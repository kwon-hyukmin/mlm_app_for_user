import 'dart:async';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mlm_app_for_user/data/testData.dart';
import 'package:mlm_app_for_user/screens/search_mapView.dart';

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
  final Map<String, double>? represent_marker_LocationMap;
  final List<Map<String, double>>? marker_LocationListMap;
  final Map<String, double> initial_LocationMap;
  final bool use_Gestures_yn;
  final double? zoom_level;

  NaverMapMlmApp({Key? key, this.represent_marker_LocationMap, required this.initial_LocationMap, required this.use_Gestures_yn, this.zoom_level, this.marker_LocationListMap});



  @override
  State<NaverMapMlmApp> createState() => _NaverMapMlmAppState();
}

class _NaverMapMlmAppState extends State<NaverMapMlmApp> {
  late NaverMapViewOptions naverMapViewOptions;
  late double Initial_latitude;
  late double Initial_longitude;
  late double marker_latitude;
  late double marker_longitude;
  late double _zoom_level;
  late Map<String, double> _initial_LocationMap = Map();
  late Map<String, double> _represent_marker_LocationMap = Map();
  late List<Map<String, double>>? _marker_LocationListMap;
  List<Marker_decodeMap> _marker_decodeMap = [];
  late NOverlayImage nOverlayImage1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _marker_LocationListMap = widget.marker_LocationListMap;
    _marker_LocationListMap?.forEach((element) {
      _marker_decodeMap.add(Marker_decodeMap.fromJson(element));
    });


    print('_marker_LocationMap');
    print(_represent_marker_LocationMap);
    _initial_LocationMap.addAll(widget.initial_LocationMap) ;
    _represent_marker_LocationMap.addAll(widget.represent_marker_LocationMap ?? <String, double>{}) ;
    Initial_latitude = _initial_LocationMap['Initial_latitude'] ?? 0;
    Initial_longitude = _initial_LocationMap['Initial_longitude'] ?? 0;
    marker_latitude = _represent_marker_LocationMap['marker_latitude'] ?? 0;
    marker_longitude = _represent_marker_LocationMap['marker_longitude'] ?? 0;
    _zoom_level = widget.zoom_level ?? 14;
    print('marker_latitude');
    print(marker_latitude);
    print('marker_longitude');
    print(marker_latitude);
    naverMapViewOptions = NaverMapViewOptions(
      initialCameraPosition: NCameraPosition(
        target: NLatLng(Initial_latitude, Initial_longitude), zoom: _zoom_level, bearing: 0, tilt: 0
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
    // final marker = NMarker(id: 'marker_1',position: NLatLng(marker_latitude, marker_longitude), size: Size(20, 25));
    List<NMarker> listNmarker = [];
    final marker = NMarker(id: 'marker_1',position: NLatLng(37.494299, 126.780446), size: Size(20, 25));
    Search_MapViewState? parent = context.findAncestorStateOfType<Search_MapViewState>();




    _marker_decodeMap.forEach((element) async {
      listNmarker.add(
      NMarker(
        id: 'marker_${element.drop_latitude}_${element.drop_longitude}',
        position: NLatLng(element.drop_latitude ?? 0, element.drop_longitude ?? 0),
        alpha: 0.7,
        size: Size(40, 40),
        icon: NOverlayImage.fromAssetImage('assets/icons/${element.drop_count}.png'),
        // 위젯으로 아이콘 만드는 부분
           // 문제점 : 리스타트 할때 동일 이미지명으로 저장이 안되어서 지우고 다시 만드는 방법으로 수정해야 할 듯하며,
           //         공통으로 빼서 호출해서 써야 하는데.. 컨텍스트를 줄 수 있을 지 봐야 함
        // icon: await NOverlayImage.fromWidget(
        //   widget: Container(
        //     decoration: BoxDecoration(
        //       color: Color(0xFF64ACF8),
        //       borderRadius: BorderRadius.circular(50),
        //       border: Border.all(color: Color(0xFF3A7DCE))
        //     ),
        //     height: 30,
        //     width: 30,
        //     child: Center(
        //       child: AutoSizeText(
        //         '${element.drop_count}',
        //         minFontSize: 1,
        //         maxFontSize: 100,
        //         style: TextStyle(fontSize: 8),
        //         textAlign: TextAlign.center,
        //         ),
        //     ),
        //     ),
        //   size: Size(20, 20),
        //   context: context)
        )
      );
    });

    return Container(
      child: NaverMap(
        options: naverMapViewOptions,

        onMapReady: (controller) async {                // 지도 준비 완료 시 호출되는 콜백 함수
          mapControllerCompleter.complete(controller);  // Completer에 지도 컨트롤러 완료 신호 전송
          log("onMapReady", name: "onMapReady");

          // 대표마커
          controller.addOverlay(marker);

          // Drop Point에 수량 찍어주는 마커
          // controller.addOverlayAll(listNmarker.toSet());
          listNmarker.forEach((element) {
            controller.addOverlay(element);
            element.setOnTapListener((overlay) {
              parent?.setState(() {
                if (parent.container_height == 50){parent.container_height = 130;}
                else {parent.container_height = 50;}

                if (parent.dropItemList_visible == false){parent.dropItemList_visible = true;}
                else {parent.dropItemList_visible = false;}

                if (parent.dropItemListTitle_visible == false){parent.dropItemListTitle_visible = true;}
                else {parent.dropItemListTitle_visible = false;}

                if (parent.dropItemTitle_visible == false){parent.dropItemTitle_visible = true;}
                else {parent.dropItemTitle_visible = false;}
                parent.dropItem_TestData.clear();
                parent.convert_dropItem_ListMap.clear();
                parent.dropItem_TestData = DropItemList_TestData().dropItem_List('1');
              });
            },);
          });
        },
        // onMapTapped: (point, latLng) {
        //   parent?.setState(() {
        //
        //     parent.container_height == 50;
        //     parent.dropItemTitle_visible == false;
        //     parent.dropItemListTitle_visible == false;
        //     parent.dropItemList_visible = false;
        //     parent.dropItem_TestData.clear();
        //     parent.convert_dropItem_ListMap.clear();
        //   });
        // }
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


class Marker_decodeMap {
  double? drop_latitude;
  double? drop_longitude;
  double? drop_count;
  // String? detailAddress;
  // String? boxType;
  // int? deliveryFee;
  // int? pickupState;

  Marker_decodeMap(drop_latitude, drop_longitude, drop_count){
    this.drop_latitude = drop_latitude;
    this.drop_longitude = drop_longitude;
    this.drop_count = drop_count;
  }

  Marker_decodeMap.fromJson(Map<String, double> json)
      : drop_latitude = json['drop_latitude'],
        drop_longitude = json['drop_longitude'],
        drop_count = json['drop_count'];
}
