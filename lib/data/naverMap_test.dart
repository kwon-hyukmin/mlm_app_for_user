import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';

void main() async {

  await _initialize();

  runApp(const NaverMapApp());
}

// 지도 초기화하기
Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NaverMapSdk.instance.initialize(
      clientId: 'dza205s9mz',     // 클라이언트 ID 설정
      onAuthFailed: (e) => log("네이버맵 인증오류 : $e", name: "onAuthFailed")
  );
  // await Location();
}

class NaverMapApp extends StatelessWidget {
  const NaverMapApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Text("네이버지도"),
              TextButton(onPressed: () async {
                Location location = Location();
                await location.getCurrentLocation();
                print('object');
              }, child: Text("위도경도 호출")),
            ],
          ),
        ),
        body: Stack(
          children: [

            NaverMap(
              options: const NaverMapViewOptions(
                    initialCameraPosition: NCameraPosition(
                        target: NLatLng(37.5036313, 127.0471425),
                        zoom: 14,
                        bearing: 0,
                        tilt: 0
                    ),
                extent: NLatLngBounds(
                  southWest: NLatLng(31.43, 122.37),
                  northEast: NLatLng(44.35, 132.0),
                ),
                locale: Locale('ko'),
                indoorEnable: true,             // 실내 맵 사용 가능 여부 설정
                locationButtonEnable: true,    // 위치 버튼 표시 여부 설정
                consumeSymbolTapEvents: false,  // 심볼 탭 이벤트 소비 여부 설정
              ),
              onMapReady: (controller) async {                // 지도 준비 완료 시 호출되는 콜백 함수
                mapControllerCompleter.complete(controller);  // Completer에 지도 컨트롤러 완료 신호 전송
                log("onMapReady", name: "onMapReady");
              },
            ),
          ],
        ),
      ),
    );
  }
}


// class LocationClass extends LatLng {
//   final double latitude;
//   final double longitude;
//
//   const LocationClass({required this.latitude, required this.longitude}) : super(latitude, longitude);
// }

class Location {
  double latitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation() async {
    print(11111);
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
      print(latitude);
      print(longitude);
    } catch (e) {
      print(e);
    }

  }
}
