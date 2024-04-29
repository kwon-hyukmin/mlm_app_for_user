import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'exception.dart';

class WebRequest {

  Future<List<String>> ApiCall(serverAdd, serviceName, keyParam, menuCode, sqlProp)
    async {
      String requestQrl = '$serverAdd$serviceName?KEYPARAM=$keyParam&MENU_ID=$menuCode&SQLPROP=$sqlProp';
      var url = Uri.parse(requestQrl);
      print(requestQrl);
      var response;

      try{
        response = await http.post(url, body: response)
            .timeout(Duration(seconds: 10), onTimeout: () => throw TimeoutException('Time Out!'));
      } on SocketException {
        throw FetchDataException('No Internet Connection');
      }
      Map<String,dynamic> jsonData = jsonDecode(response.body);


      String errorMsg = jsonData['ErrorMsg'];
      List<dynamic> dsOut = jsonData['DS_OUT'];


      List<Map<String,dynamic>> convertedList;
      convertedList = List<Map<String, dynamic>>.from(dsOut);

      List<String> nameList = [];
      convertedList.forEach((element) {
        // print(element['NAME']);
        nameList.add(element['NAME']);
        // return element['NAME'];
      });
      return nameList;

  }
}

