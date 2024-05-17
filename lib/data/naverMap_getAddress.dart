import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future getAddress(position) async {
  const String apiUrl =
      "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc";
  String coords = position; // 여기에 입력 좌표 값을 넣으세요
  const String orders = "legalcode"; // 여기에 변환 작업 이름 값을 넣으세요
  const String output = "json"; // 여기에 출력 형식 값을 넣으세요
  const String apiKeyId = 'dza205s9mz';
  const String apiKeySecret = 'fmDGpaz1nzU8QQHh1FwbnzxLEC6GrlKlI8gWrm2x';
  List<dynamic>? listResults;
  Map<String, dynamic>? transListToMapResult;
  Map<String, dynamic>? mapRegion;
  Map<String, dynamic>? area1;
  Map<String, dynamic>? area2;
  Map<String, dynamic>? area3;
  Map<String, dynamic>? area4;
  Map<String, dynamic> getAreaName = {};


  Future<Map<String, dynamic>?> fetchData() async {
    final response = await http.get(
      Uri.parse("$apiUrl?coords=$coords&orders=$orders&output=$output"),
      headers: {
        "X-NCP-APIGW-API-KEY-ID": apiKeyId,
        "X-NCP-APIGW-API-KEY": apiKeySecret,
      },
    );

    if (response.statusCode == 200) {
      // JSON 응답 파싱
      final Map<String, dynamic> getResponsData = json.decode(response.body);
      // debugPrint("Response Data: $getResponsData");
      listResults = getResponsData['results'] ?? [];
      transListToMapResult = listResults?[0];
      mapRegion = transListToMapResult?['region'] ?? [];
      area1 = mapRegion?['area1'];
      area2 = mapRegion?['area2'];
      area3 = mapRegion?['area3'];
      area4 = mapRegion?['area4'];

      getAreaName =
      {
        'status' : 'ok',
        'area1' : area1?['name'],
        'area2' : area2?['name'],
        'area3' : area3?['name'],
        'area4' : area4?['name']
      };
    } else {
      // 요청 실패 처리
      debugPrint("Failed to load data: ${response.statusCode}");
      getAreaName = { 'status' : 'fail'};
    }
      return getAreaName;
  }

  return fetchData();
}


// {
//   status: {
//             code: 0,name: ok, message: done
//           },
//   results: [
//     {
//       name: legalcode,
//       code: {
//         id: 4119210800,
//         type: L,
//         mappingId: 02192108
//       },
//       region: {
//         area0: {
//           name: kr,
//           coords: {center: {crs: , x: 0.0, y: 0.0}}
//         },
//         area1: {
//           name: 경기도,
//           coords: {center: {crs: EPSG:4326, x: 127.550802, y: 37.436318}},alias: 경기
//         },
//         area2: {
//           name: 부천시 원미구,
//           coords: {center: {crs: EPSG:4326, x: 126.787116, y: 37.496601}}
//         },
//         area3: {
//           name: 중동,
//           coords: {center: {crs: EPSG:4326, x: 126.768185, y: 37.487812}}
//         },
//         area4: {
//           name: ,
//           coords: {center: {crs: , x: 0.0, y: 0.0}}
//         }
//       }
//     }
//   ]
// }