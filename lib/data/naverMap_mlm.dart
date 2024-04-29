import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';


// 지도 초기화하기
class NaverMapMlmApp_Initialize{
  Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    await NaverMapSdk.instance.initialize(
        clientId: 'dza205s9mz',     // 클라이언트 ID 설정
        onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed")
    );
    // await Location();
  }
}

//네이버맵 몸통
class NaverMapMlmApp extends StatefulWidget {
  final Map<String, double>? marker_LocationListMap;
  final Map<String, double> initial_LocationMap;
  final bool use_Gestures_yn;

  NaverMapMlmApp({Key? key, this.marker_LocationListMap, required this.initial_LocationMap, required this.use_Gestures_yn});

  @override
  State<NaverMapMlmApp> createState() => _NaverMapMlmAppState();
}

class _NaverMapMlmAppState extends State<NaverMapMlmApp> {
  late NaverMapViewOptions naverMapViewOptions;
  late double Initial_latitude;
  late double Initial_longitude;
  late double marker_latitude;
  late double marker_longitude;
  late Map<String, double> _initial_LocationMap = Map();
  late Map<String, double> _marker_LocationMap = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('_marker_LocationMap');
    print(_marker_LocationMap);
    _initial_LocationMap.addAll(widget.initial_LocationMap) ;
    _marker_LocationMap.addAll(widget.marker_LocationListMap ?? <String, double>{}) ;
    Initial_latitude = _initial_LocationMap['Initial_latitude'] ?? 0;
    Initial_longitude = _initial_LocationMap['Initial_longitude'] ?? 0;
    marker_latitude = _marker_LocationMap['marker_latitude'] ?? 0;
    marker_longitude = _marker_LocationMap['marker_longitude'] ?? 0;
    print('marker_latitude');
    print(marker_latitude);
    print('marker_longitude');
    print(marker_latitude);
    naverMapViewOptions = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
        target: NLatLng(Initial_latitude, Initial_longitude), zoom: 14, bearing: 0, tilt: 0
        ),
      rotationGesturesEnable: widget.use_Gestures_yn, //제스처 활성화여부
      scrollGesturesEnable: widget.use_Gestures_yn, //제스처 활성화여부
      tiltGesturesEnable: widget.use_Gestures_yn, //제스처 활성화여부
      zoomGesturesEnable: widget.use_Gestures_yn, //제스처 활성화여부
      stopGesturesEnable: widget.use_Gestures_yn, //제스처 활성화여부
      locale: Locale('ko'),
      indoorEnable: false, // 실내 맵 사용 가능 여부 설정
      locationButtonEnable: true, // 위치 버튼 표시 여부 설정
      consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 여부 설정
      logoClickEnable: false
    );
  }

  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();
    final marker = NMarker(id: 'marker_1',position: NLatLng(marker_latitude, marker_longitude), size: Size(20, 25));

    return Container(
      child: NaverMap(
        options: naverMapViewOptions,
        onMapReady: (controller) async {                // 지도 준비 완료 시 호출되는 콜백 함수
          mapControllerCompleter.complete(controller);  // Completer에 지도 컨트롤러 완료 신호 전송
          log("onMapReady", name: "onMapReady");
          controller.addOverlay(marker);
        },
      ),
    );
  }
}


class Location {
  double latitude = 0;
  double longitude = 0;

  Map<String, double> location = Map();

  Future<Map<String, double>> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      // print(latitude);
      // print(longitude);
      location.putIfAbsent('Initial_latitude', () => latitude);
      location.putIfAbsent('Initial_longitude', () => longitude);

    } catch (e) {
      print(e);
    }
    print(location);


    return location;
  }
}

//
// class LocationListMap_toList {
//   String? marker_latitude;
//   String? marker_longitude;
//
//   LocationListMap_toList(marker_latitude, marker_longitude){
//     this.marker_latitude = marker_latitude;
//     this.marker_longitude = marker_longitude;
//   }
//
//   LocationListMap_toList.fromJson(Map<String, dynamic> json)
//       : marker_latitude = json['marker_latitude'],
//         marker_longitude = json['marker_longitude'];
// }



class M_Location {
  double m_latitude = 0;
  double m_longitude = 0;

  Map<String, double> m_location = Map();

  Future<Map<String, double>> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    // print(permission);
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      m_latitude = position.latitude;
      m_longitude = position.longitude;
      // print(latitude);
      // print(longitude);
      m_location.putIfAbsent('marker_latitude', () => m_latitude);
      m_location.putIfAbsent('marker_longitude', () => m_longitude);

    } catch (e) {
      print(e);
    }
    // print('m_location');
    // print(m_location);


    return m_location;
  }
}