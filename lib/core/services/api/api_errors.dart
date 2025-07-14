
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:gold/translations/locale_keys.g.dart';


abstract class Failure {
  String msg;
  int? statusCode;

  Failure(
    this.msg, {
    this.statusCode,
  });
}

class ServerFailure extends Failure {
  ServerFailure(
    super.msg, {
    super.statusCode,
  });

  factory ServerFailure.generalException(exception) {
    try {
      if (exception is DioException) {
        return ServerFailure._fromDioException(
          exception,
        );
      }
    } catch (e) {
      return ServerFailure(
        LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater
            .tr(),
      );
    }
    return ServerFailure(
      exception.toString(),
    );
  }

  factory ServerFailure._fromDioException(DioException exception) {
    log(exception.response!.data.toString());
    switch (exception.type) {
      case DioExceptionType.sendTimeout:
        return ServerFailure(
          LocaleKeys.sendTimeOutPleaseTryAgainLater.tr(),
            statusCode:
            exception.response?.statusCode,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          LocaleKeys.receiveTimeOutPleaseTryAgainLater.tr(),statusCode:
        exception.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ServerFailure(
          LocaleKeys.connectionErrorPleaseTryAgainLater.tr(),statusCode:
        exception.response?.statusCode,
        );
      case DioExceptionType.cancel:
        return ServerFailure(
          LocaleKeys.requestHasBeenCancelledPleaseTryAgainLater.tr(),statusCode:
        exception.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        if (exception.response!.statusCode == 440) {

          return ServerFailure(
            LocaleKeys.oppsYouNeedToUpdateApp.tr(),
            statusCode: 440,
          );
        } else if (exception.response!.data['message'] != null) {
          return ServerFailure(
            exception.response!.data['message'],statusCode:
          exception.response?.statusCode,
          );
        }
        return ServerFailure(
          LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater
              .tr(),statusCode:
        exception.response?.statusCode,
        );
      default:
        return ServerFailure(
          LocaleKeys.oppsAnUnexpectedErrorOccurredPleaseTryAgainLater
              .tr(),statusCode:
        exception.response?.statusCode,
        );
    }
  }
}
