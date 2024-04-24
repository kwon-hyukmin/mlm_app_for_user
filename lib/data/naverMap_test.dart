import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:naver_map_plugin/naver_map_plugin.dart' show LatLng;

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
}

class NaverMapApp extends StatelessWidget {
  const NaverMapApp({Key? key});

  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();

    return MaterialApp(
      home: Scaffold(
        body: NaverMap(
          options: const NaverMapViewOptions(
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
      ),
    );
  }
}


class LocationClass extends LatLng {
  final double latitude;
  final double longitude;

  const LocationClass({required this.latitude, required this.longitude}) : super(latitude, longitude);
}