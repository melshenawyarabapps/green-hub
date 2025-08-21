
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/core/extensions/date_extensions.dart';
import 'package:gold/core/extensions/map_extensions.dart';
import 'package:gold/features/base/data/models/base_model.dart';
import 'package:gold/core/services/api/api_errors.dart';
import 'package:gold/core/services/api/api_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:gold/core/config/app_config.dart';
import 'package:gold/core/utils/app_exceptions.dart';
import 'package:gold/translations/locale_keys.g.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:share_plus/share_plus.dart';

class BaseRepo {
  final ApiService _apiService;

  BaseRepo(this._apiService);

  Future<Either<Failure, (List<BaseModel>, String)>> getData(
    CurrencyType type,
  ) async {
    try {
      final response = await _apiService.get(endPoint: type.endPoint);
      final data = response['data'] as List<dynamic>;
      final jsonLastUpdated = response['meta']?['latest_updated'];
      final lastUpdated =
          DateTime.fromMillisecondsSinceEpoch(int.parse(jsonLastUpdated??'0')).formatDate;

      final List<BaseModel> list = [];

      for (var item in data) {
        list.add((item as Map).toModel(type));
      }
      return Right((list, lastUpdated));
    } catch (e) {
      return Left(ServerFailure.generalException(e));
    }
  }

  Future<void> takeScreenshot(GlobalKey globalKey, String? text) async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );
      Uint8List pngBytes = byteData!.buffer.asUint8List();
      final directory = await getApplicationDocumentsDirectory();
      final filePath =
          '${directory.path}/Gold-${AppConfig.instance.currentFlavor.toUpperCase()}.png';
      File file = File(filePath);
      await file.writeAsBytes(pngBytes);
      SharePlus.instance.share(
        ShareParams(
          previewThumbnail: XFile(filePath),
          files: [XFile(filePath)],
          text: text,
        ),
      );
    } catch (_) {
      AppExceptions.instance.unExpectedException(
        LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater.tr(),
      );
    }
  }
}
