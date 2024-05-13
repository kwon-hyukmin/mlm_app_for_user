import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import 'exception.dart';

class TempRestService {

  static final Map<String, String> baseHeaders = {
    'Content-Type': 'application/json'
  };
  static final Map<String, String> imageHeaders = {'Content-Type': 'image'};
  static final Map<String, dynamic> baseBody = {};


  static Future requestGet({required String url, required String params}) async {
    String convertedUrl = params.isEmpty ? url : '$url$params';
    try {
      return http
          .get(Uri.parse(convertedUrl))
          .timeout(Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('60 seconds api request timeout');
      }).then((response) {
        return toJson(response);
      });
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }


  static Future<dynamic> requestPost({required String url, required Map<String, String> headers, required Map<String, dynamic> body}) async {

    try {
      return http
          .post(Uri.parse(url), headers: headers, body: json.encode(body))
          .timeout(Duration(seconds: 60), onTimeout: () {
        throw TimeoutException('60 seconds api request timeout');
      }).then((response) {
        return toJson(response);
      });
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
  }

  static dynamic toJson(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 404:
      case 503:
        throw ConnectionException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }








}