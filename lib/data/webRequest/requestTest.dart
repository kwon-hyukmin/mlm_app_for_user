import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'exception.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String serverAdd;
  late String serviceName;
  late String keyParam;
  late String menuCode;
  late String sqlProp;
  late Map<String, dynamic> firstbody;
  late String nameList;
  late String test;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nameList  = 'test';
    serverAdd = 'http://10.21.1.113:8080';
    serviceName = '/appService/getCodeAndName';
    keyParam = 'INB_SCD';
    menuCode = 'PDA1001';
    sqlProp = 'CODE';
    firstbody = new Map();
    // nameList = _callAPI();
  }
  Future<String> _callAPI() async {
    String requestQrl = 'http://jjh103.iptime.org:8080/pickingList/jjh103';
    Map<String,dynamic> _map = {};
    // String requestQrl = '$serverAdd$serviceName?KEYPARAM=$keyParam&MENU_ID=$menuCode&SQLPROP=$sqlProp';
    // var url = Uri.parse(
    //   'http://10.21.1.113:8080/appService/getCodeAndName',
    // );
    // print('$serverAdd$serviceName?KEYPARAM=$keyParam&MENU_ID=$menuCode&SQLPROP=$sqlProp');
    print(requestQrl);
    // var response = await http.get(url);
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');
    //                     'http://10.21.1.113:8080/appSerivce/getCodeAndName?KEYPARAM=INB_SCD&MENU_ID=PDA1001&SQLPROP=CODE'
    // var url = Uri.parse('http://10.21.1.113:8080/appService/getCodeAndName?KEYPARAM=INB_SCD&MENU_ID=PDA1001&SQLPROP=CODE');
    var url = Uri.parse(requestQrl);
    var response;

    try{
      response = await http.get(url);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    List<dynamic> jsonData = jsonDecode(response.body);

    List<Map<String,dynamic>> convertedList;
    convertedList = List<Map<String, dynamic>>.from(jsonData);


    print(convertedList);
    List<String> nameList = [];
    convertedList.forEach((element) {
      // print(element['NAME']);
      nameList.add(element['deliveryCoo']);
      // return element['NAME'];
    });
    test = nameList[0];
    return test;

    print(response);
    // List<Map<String, dynamic>> jsonData = jsonDecode(response.body);

    print(jsonData);
    print(_map);
    // String errorMsg = jsonData['ErrorMsg'];
    // List<dynamic> result = jsonData['DS_OUT'];

    // print('errorMsg: $errorMsg'); // ErrorMsg 출력
    // print('dsOut: $dsOut'); // ErrorMsg 출력


    // List<dynamic> aaa = jsonData['DS_OUT'];
    // List<Map<String,dynamic>> convertedList;
    // convertedList = List<Map<String, dynamic>>.from(result);

    // convertedList.forEach((element) {
    //   print(element['NAME']);
    // });

    // dsOut.forEach((element) {
    //   Map<String, String> eleMap = element
    //   print(e)
    // });
    // Map<String,dynamic> jsonData2 = jsonDecode(aaa);
    // print(jsonData2['CODE']); // ErrorMsg 출력


    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');



    // dynamic responseJson = jsonDecode(response.body);

    // return responseJson;


    // print('Response body: ${response.}');
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('http Example'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                    _callAPI();
                });
              },
              child: const Text('Call API'),
            ),
            Text('$nameList')
          ],
        ),
      ),
    );
  }
}

