import 'package:get/get.dart';
import 'package:mlm_app_for_user/data/webrequest/strings.dart';

import 'debug.dart';



void showError(dynamic e) {
  if (e is TimeoutException) {
    Get.snackbar(kAlert, kErrorTimeout);
  } else if (e is ConnectionException) {
    Get.snackbar(kAlert, kErrorServerConnectionFailed);
  } else if (e is FetchDataException) {
    Get.snackbar(kAlert, kErrorParse);
  } else {
    Get.snackbar(kAlert, kErrorUnknown);
  }
  debug('exception: $e');
}

class AppException implements Exception {
  final _message;
  final _prefix;

  AppException([this._message, this._prefix]);

  String toString() {
    return "$_prefix$_message";
  }
}

class TimeoutException extends AppException {
  TimeoutException([String? message]) : super(message, "Request Timeout: ");
}

class ConnectionException extends AppException {
  ConnectionException([String? message])
      : super(message, "Server Connection Failed: ");
}

class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error During Communication: ");
}

class BadRequestException extends AppException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}

class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message, "Unauthorised Request: ");
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid Input: ");
}
