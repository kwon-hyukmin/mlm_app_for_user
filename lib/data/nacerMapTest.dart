import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';



void main() async {

  await NaverMapMlmApp_Initialize().initialize();
  // await Location().getCurrentLocation();
  List<double> list = await Location().getCurrentLocation();

  print('list');
  print(list);
  runApp(NaverMapMlmApp(list: list,));
}

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


class NaverMapMlmApp extends StatefulWidget {
  final List<double> list;


  NaverMapMlmApp({Key? key, required this.list});

  @override
  State<NaverMapMlmApp> createState() => _NaverMapMlmAppState();
}

class _NaverMapMlmAppState extends State<NaverMapMlmApp> {
  late NaverMapViewOptions naverMapViewOptions;
  late double aaa;
  late double bbb;
  late List<double> _list;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print('widget.list');
    print(widget.list);

    _list = widget.list;
    // list = Location().getCurrentLocation();
    aaa = _list[0];
    bbb = _list[1];
    // list = Location().location;

    print(aaa);
    print(bbb);
    // print(list);

    naverMapViewOptions = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
          target: NLatLng(aaa, bbb), zoom: 14, bearing: 0, tilt: 0),
      extent: NLatLngBounds(
        southWest: NLatLng(31.43, 122.37),
        northEast: NLatLng(44.35, 132.0),
      ),
      locale: Locale('ko'),
      indoorEnable: true,
      // 실내 맵 사용 가능 여부 설정
      locationButtonEnable: true,
      // 위치 버튼 표시 여부 설정
      consumeSymbolTapEvents: false, // 심볼 탭 이벤트 소비 여부 설정
    );
  }

  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();


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
        },
      ),
    );
  }
}


class Location {
  double latitude = 0;
  double longitude = 0;
  List<double> location = [];

  Future<List<double>> getCurrentLocation() async {
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
      location.add(latitude);
      location.add(longitude);
    } catch (e) {
      print(e);
    }
    print(location);


    return location;
  }
}
