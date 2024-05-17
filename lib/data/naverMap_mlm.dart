import 'dart:async';
import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mlm_app_for_user/data/getDropMarker.dart';
import 'package:mlm_app_for_user/data/testData.dart';
import 'package:mlm_app_for_user/screens/search_mapView.dart';

import 'naverMap_getAddress.dart';

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
  final Map<String, double> initial_LocationMap;
  final bool use_Gestures_yn;
  final double? zoom_level;

  NaverMapMlmApp({Key? key, this.represent_marker_LocationMap, required this.initial_LocationMap, required this.use_Gestures_yn, this.zoom_level/*, this.marker_LocationListMap*/});



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
  List<Map<String, dynamic>>? _marker_LocationListMap = [];
  List<Marker_decodeMap> _marker_decodeMap = [];
  late NOverlayImage nOverlayImage1;
  NaverMapController? navermapController;
  NLatLngBounds? camerePositionArea;
  List<NMarker> listNmarker = [];
  late List<Map<String, dynamic>> NdropItem_TestData = [];
  bool NdropItemList_visible = false;
  bool NinArea_DropSummary_visible = true;
  NCameraPosition? nowCameraPosition;
  double? nowLatitude;
  double? nowLongitude;
  String? nowPosition;
  Map<String, dynamic>? getAreaName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initial_LocationMap.addAll(widget.initial_LocationMap) ;
    _represent_marker_LocationMap.addAll(widget.represent_marker_LocationMap ?? <String, double>{}) ;
    Initial_latitude = _initial_LocationMap['Initial_latitude'] ?? 0;
    Initial_longitude = _initial_LocationMap['Initial_longitude'] ?? 0;
    marker_latitude = _represent_marker_LocationMap['marker_latitude'] ?? 0;
    marker_longitude = _represent_marker_LocationMap['marker_longitude'] ?? 0;
    _zoom_level = widget.zoom_level ?? 14;
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

  void createDropMarker(){
    // 변수 재초기화 처리
    _marker_LocationListMap?.clear();
    _marker_decodeMap.clear();
    listNmarker.clear();

    // 리스트맵 디코딩
    _marker_LocationListMap = GetDropMarker().getMarkerLocation(camerePositionArea);
    // _marker_LocationListMap = widget.marker_LocationListMap;
    _marker_LocationListMap?.forEach((element) {
      _marker_decodeMap.add(Marker_decodeMap.fromJson(element));
    });


    //드랍포인트 리스트 마커 생성
    _marker_decodeMap.forEach((element) async {
      listNmarker.add(
          NMarker(
            id: '${element.drop_pointid}',
            position: NLatLng(element.drop_latitude ?? 0, element.drop_longitude ?? 0),
            alpha: 0.7,
            size: Size(40, 40),
            icon: NOverlayImage.fromAssetImage('assets/icons/${element.drop_count}.png'),
          )
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    // NaverMapController 객체의 비동기 작업 완료를 나타내는 Completer 생성
    final Completer<NaverMapController> mapControllerCompleter = Completer();
    // final marker = NMarker(id: 'marker_1',position: NLatLng(marker_latitude, marker_longitude), size: Size(20, 25));
    final marker = NMarker(id: 'marker_1',position: NLatLng(37.494299, 126.780446), size: Size(20, 25));
    // 부모클래스 State 상속 처리
    Search_MapViewState? parent = context.findAncestorStateOfType<Search_MapViewState>();
    // DropItem_ListViewState? parent_child = context.findAncestorStateOfType<DropItem_ListViewState>();


    return Container(
      child: NaverMap(
        options: naverMapViewOptions,

        // Event1 : 지도 준비 완료 시
        onMapReady: (controller) async {                // 지도 준비 완료 시 호출되는 콜백 함수
          navermapController = controller;                        // controller 할당
          log("onMapReady", name: "onMapReady");
          camerePositionArea = await navermapController?.getContentBounds(withPadding: false);  // 현재 보고있는 지도 영역 변수에 할당
          // 대표마커
          controller.addOverlay(marker);
        },

        // Event2 : 지도 아무데나 찍었을때
        onMapTapped: (point, latLng) {
          parent?.setState(() {
            parent.dropItemListVisible = false;
            parent.intForecastIncome = 0;
            // parent.inAreaDropSummaryVisible = true;
            parent.convertDropItemListMap.clear();
            parent.selectedDropItemCount = 0;
            // parent.dropItem_TestData = DropItem_TestData().dropItem_List();
          });
        },

        // Event3 : 지도 이동이 끝났을때
        onCameraIdle: () async {
          log("onCameraIdle", name: "onCameraIdle");
          nowCameraPosition = navermapController?.nowCameraPosition;
          nowLatitude = nowCameraPosition?.target.latitude;
          nowLongitude = nowCameraPosition?.target.longitude;
          nowPosition = nowLongitude!.toStringAsFixed(6) + ',' + nowLatitude!.toStringAsFixed(6);
          getAreaName = await getAddress(nowPosition);
          parent?.setState(() {
            parent.nowAreaName = getAreaName;
          });
          // 지도에 있는 모든 오버레이 삭제
          navermapController?.clearOverlays();
          // 대표마커 재오버레이
          navermapController?.addOverlay(marker);
          // 현재 보고있는 지도 영역 변수에 할당
          camerePositionArea = await navermapController?.getContentBounds(withPadding: false);
          // 마커생성
          createDropMarker();
          // 생성한 마커 지도에 오버레이 처리
          listNmarker.forEach((element) {
            navermapController?.addOverlay(element);
            // 오베리이 된 마커에 이벤트 객체 생성
            element.setOnTapListener((overlay) {
              // 부모클레스 setState(스크롤 팝업 스위치, 리스트 데이터 생성 부분)를 포함하고 있는 위젯을 오버레이
              parent?.setState(() {
                parent.convertDropItemListMap.clear();
                parent.dropItemListMapData = DropItem_TestData().dropItem_List(element.info.id);
                parent.dropItemListMapData.forEach((element) {
                  parent.convertDropItemListMap.add(DropItem_List_decodeMap.fromJson(element));
                });
                parent.dropItemListVisible = true;
                // parent.inAreaDropSummaryVisible = true;
              });
            },);
          });
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
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      location.putIfAbsent('Initial_latitude', () => latitude);
      location.putIfAbsent('Initial_longitude', () => longitude);

    } catch (e) {
      print(e);
    }
    print(location);


    return location;
  }
}


class M_Location {
  double m_latitude = 0;
  double m_longitude = 0;

  Map<String, double> m_location = Map();

  Future<Map<String, double>> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      m_latitude = position.latitude;
      m_longitude = position.longitude;
      m_location.putIfAbsent('marker_latitude', () => m_latitude);
      m_location.putIfAbsent('marker_longitude', () => m_longitude);

    } catch (e) {
      print(e);
    }


    return m_location;
  }
}


class Marker_decodeMap {
  String? drop_pointid;
  double? drop_latitude;
  double? drop_longitude;
  int? drop_count;

  Marker_decodeMap(drop_pointid, drop_latitude, drop_longitude, drop_count){
    this.drop_pointid = drop_pointid;
    this.drop_latitude = drop_latitude;
    this.drop_longitude = drop_longitude;
    this.drop_count = drop_count;
  }

  Marker_decodeMap.fromJson(Map<String, dynamic> json)
      : drop_pointid = json['drop_pointid'],
        drop_latitude = json['drop_latitude'],
        drop_longitude = json['drop_longitude'],
        drop_count = json['drop_count'];
}
