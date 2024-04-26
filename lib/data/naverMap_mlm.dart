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
  final List<Map<String, double>>? marker_LocationListMap;
  final Map<String, double> initial_LocationMap;

  NaverMapMlmApp({Key? key, this.marker_LocationListMap, required this.initial_LocationMap});

  @override
  State<NaverMapMlmApp> createState() => _NaverMapMlmAppState();
}

class _NaverMapMlmAppState extends State<NaverMapMlmApp> {
  late NaverMapViewOptions naverMapViewOptions;
  late double Initial_latitude;
  late double Initial_longitude;
  late Map<String, double> _initial_LocationMap = Map();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initial_LocationMap.addAll(widget.initial_LocationMap) ;
    Initial_latitude = _initial_LocationMap['Initial_latitude'] ?? 0;
    Initial_longitude = _initial_LocationMap['Initial_longitude'] ?? 0;

    naverMapViewOptions = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
        target: NLatLng(Initial_latitude, Initial_longitude), zoom: 14, bearing: 0, tilt: 0
        ),
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
    final marker = NMarker(id: 'marker_1',position: NLatLng(Initial_latitude, Initial_longitude), size: Size(20, 25));

    return Container(
      child: NaverMap(
        options: naverMapViewOptions,
        // NaverMapViewOptions(
        //   initialCameraPosition: NCameraPosition(
        //       target: NLatLng(aaa, bbb),
        //       zoom: 14,
        //       bearing: 0,
        //       tilt: 0
        //   ),
        //   extent: NLatLngBounds(
        //     southWest: NLatLng(31.43, 122.37),
        //     northEast: NLatLng(44.35, 132.0),
        //   ),
        //   locale: Locale('ko'),
        //   indoorEnable: true,             // 실내 맵 사용 가능 여부 설정
        //   locationButtonEnable: true,    // 위치 버튼 표시 여부 설정
        //   consumeSymbolTapEvents: false,  // 심볼 탭 이벤트 소비 여부 설정
        // ),
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


class LocationListMap_toList {
  String? marker_latitude;
  String? marker_longitude;

  LocationListMap_toList(marker_latitude, marker_longitude){
    this.marker_latitude = marker_latitude;
    this.marker_longitude = marker_longitude;
  }

  LocationListMap_toList.fromJson(Map<String, dynamic> json)
      : marker_latitude = json['marker_latitude'],
        marker_longitude = json['marker_longitude'];
}