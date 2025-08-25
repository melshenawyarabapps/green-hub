import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gold/core/enums/api_enums.dart';
import 'package:gold/core/enums/currency_enums.dart';
import 'package:gold/features/base/data/models/base_model.dart';

import 'package:gold/features/base/data/repos/base_repo.dart';
import 'package:gold/translations/locale_keys.g.dart';

part 'base_state.dart';

class BaseController extends Cubit<BaseState> {
  BaseController(this._baseRepo) : super(const BaseState(status: {}, data: {}));

  final BaseRepo _baseRepo;

  Future<void> getData(CurrencyType type, {bool isRefresh = false}) async {
    final status = Map<CurrencyType, RequestStatus>.from(state.status);
    if (status[type]?.isLoading == true ||
        (state.data[type]?.isNotEmpty == true && !isRefresh)) {
      return;
    }
    status[type] = RequestStatus.loading;

    emit(state.copyWith(status: status));
    final result = await _baseRepo.getData(type);
    result.fold(
      (l) {
        status[type] = RequestStatus.error;

        emit(state.copyWith(status: status));
      },
      (r) {
        final list = r.$1;
        status[type] = RequestStatus.loaded;
        final data = Map<CurrencyType, List<BaseModel>>.from(state.data);
        data[type] = list;
        final lastUpdates = Map<CurrencyType, String>.from(state.lastUpdates);
        lastUpdates[type] = r.$2;
        emit(
          state.copyWith(status: status, data: data, lastUpdates: lastUpdates),
        );
      },
    );
  }

  Future<void> takeScreenshot(GlobalKey globalKey, {String? text}) async {
    emit(state.copyWith(shareAppLoading: true));
    await _baseRepo.takeScreenshot(globalKey, text);
    emit(state.copyWith(shareAppLoading: false));
  }
}
