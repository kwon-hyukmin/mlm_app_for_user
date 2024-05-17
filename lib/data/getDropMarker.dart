
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:mlm_app_for_user/data/testData.dart';

class GetDropMarker{
  NLatLngBounds? get_camerePositionArea;
  List<Map<String, dynamic>>? getMarkerListMap = [];

  List<Map<String, dynamic>>? getMarkerLocation(NLatLngBounds? NcamerePositionArea){
    get_camerePositionArea = NcamerePositionArea;
    getMarkerListMap?.clear();
    getMarkerListMap =
        DropItem_TestData().dropPoint_List(
          get_camerePositionArea?.southEast.latitude ?? 0,
          get_camerePositionArea?.northEast.latitude ?? 0,
          get_camerePositionArea?.southEast.longitude ?? 0,
          get_camerePositionArea?.northEast.longitude ?? 0,
        );
    return getMarkerListMap;
  }
}