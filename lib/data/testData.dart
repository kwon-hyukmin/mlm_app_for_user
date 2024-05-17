import 'package:mlm_app_for_user/data/naverMap_mlm.dart';

class DropItem_TestData{
  List<Map<String, dynamic>>? dropPointList_testData;
  List<Map<String, dynamic>>? dropPointList_testData_1;
  List<Map<String, dynamic>>? dropPointList_testData_2;
  List<Map<String, dynamic>>? dropPointList_testData_3;
  List<Map<String, dynamic>> final_dropPointList_testData = [];
  List<Map<String, dynamic>>? dropItemList_testData;
  List<Marker_decodeMap> _marker_decodeMap = [];

  dropPoint_List(double fr_drop_latitude, double to_drop_latitude, double fr_drop_longitude, double to_drop_longitude){
    dropPointList_testData =
      [
        { 'drop_pointid': '1',
          'drop_latitude': 37.495109,
          'drop_longitude': 126.779065,
          'drop_count': 5
        },
        { 'drop_pointid': '2',
          'drop_latitude': 37.495066,
          'drop_longitude': 126.781136,
          'drop_count': 3
        },
        { 'drop_pointid': '3',
          'drop_latitude': 37.493699,
          'drop_longitude': 126.780847,
          'drop_count': 5
        },
      ];

    dropPointList_testData_1 =
    [
      { 'drop_pointid': '1',
        'drop_latitude': 37.495109,
        'drop_longitude': 126.779065,
        'drop_count': 5
      },
      { 'drop_pointid': '2',
        'drop_latitude': 37.495066,
        'drop_longitude': 126.781136,
        'drop_count': 3
      },
      { 'drop_pointid': '3',
        'drop_latitude': 37.493699,
        'drop_longitude': 126.780847,
        'drop_count': 5
      },
      { 'drop_pointid': '4',
        'drop_latitude': 37.496445,
        'drop_longitude': 126.780062,
        'drop_count': 5
      },
      { 'drop_pointid': '5',
        'drop_latitude': 37.497279,
        'drop_longitude': 126.779875,
        'drop_count': 3
      },
      { 'drop_pointid': '6',
        'drop_latitude': 37.499339,
        'drop_longitude': 126.780122,
        'drop_count': 5
      },
      { 'drop_pointid': '7',
        'drop_latitude': 37.500447,
        'drop_longitude': 126.779218,
        'drop_count': 5
      },
      { 'drop_pointid': '8',
        'drop_latitude': 37.501183,
        'drop_longitude': 126.778432,
        'drop_count': 3
      },
      { 'drop_pointid': '9',
        'drop_latitude': 37.502140,
        'drop_longitude': 126.780111,
        'drop_count': 5
      },
    ];

    dropPointList_testData_1?.forEach((element) {
      _marker_decodeMap.add(Marker_decodeMap.fromJson(element));
    });


    _marker_decodeMap.forEach((element) {
      if(element.drop_latitude! >= fr_drop_latitude && element.drop_latitude! <= to_drop_latitude){
        if(element.drop_longitude! <= fr_drop_longitude && element.drop_longitude! <= to_drop_longitude){
          final_dropPointList_testData.add(
              { 'drop_pointid': element.drop_pointid,
                'drop_latitude': element.drop_latitude,
                'drop_longitude': element.drop_longitude,
                'drop_count': element.drop_count
              }
          );
        }
      }

    });

    // return dropPointList_testData;
    return final_dropPointList_testData;
  }




  dropItem_List(String DropPoint_id){
    if (DropPoint_id == '1') {
      dropItemList_testData = [
        {"complexName": "부천중동리첸시아",
        "detailAddress": 'A동 1',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 2',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 3',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'B동 4',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'B동 5',
          "complexType": "아파트",
          "boxType": "극대",
          "deliveryFee": 1300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 6',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 8',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 9',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'B동 10',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'B동 11',
          "complexType": "아파트",
          "boxType": "극대",
          "deliveryFee": 1300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 12',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 13',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'A동 14',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'B동 15',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        },
        {"complexName": "부천중동리첸시아",
          "detailAddress": 'B동 16',
          "complexType": "아파트",
          "boxType": "극대",
          "deliveryFee": 1300,
          "tagInfo": ' #엘리베이터 1대, #주민민원 적음'
        }
      ];
    }

    if (DropPoint_id == '2') {
      dropItemList_testData = [{"complexName": "연화마을 아파트",
        "detailAddress": '1409동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 1대, #구축아파트'
      },
        {"complexName": "연화마을 아파트",
          "detailAddress": '1411동',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #구축아파트'
        },
        {"complexName": "연화마을 아파트",
          "detailAddress": '1413동',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 1대, #구축아파트'
        }
      ];
    }

    if (DropPoint_id == '3') {
      dropItemList_testData = [{"complexName": "스타팰리움아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      },
        {"complexName": "스타팰리움아파트",
          "detailAddress": '101동',
          "complexType": "아파트",
          "boxType": "대",
          "deliveryFee": 800,
          "tagInfo": ' #엘리베이터 2대, #소형단지'
        },
        {"complexName": "스타팰리움아파트",
          "detailAddress": '102동',
          "complexType": "아파트",
          "boxType": "극소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 2대, #소형단지'
        },
        {"complexName": "스타팰리움아파트",
          "detailAddress": '103동',
          "complexType": "아파트",
          "boxType": "소",
          "deliveryFee": 300,
          "tagInfo": ' #엘리베이터 2대, #소형단지'
        },
        {"complexName": "스타팰리움아파트",
          "detailAddress": '103동',
          "complexType": "아파트",
          "boxType": "중",
          "deliveryFee": 400,
          "tagInfo": ' #엘리베이터 2대, #소형단지'
        }
      ];
    }

    if (DropPoint_id == '4') {
      dropItemList_testData = [{"complexName": "대원아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      }];
    }

    if (DropPoint_id == '5') {
      dropItemList_testData = [{"complexName": "쌍용아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      }];
    }

    if (DropPoint_id == '6') {
      dropItemList_testData = [{"complexName": "건영서안아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      }];
    }

    if (DropPoint_id == '7') {
      dropItemList_testData = [{"complexName": "동아아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      }];
    }

    if (DropPoint_id == '8') {
      dropItemList_testData = [{"complexName": "삼환한진아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      }];
    }

    if (DropPoint_id == '9') {
      dropItemList_testData = [{"complexName": "삼환한진아파트",
        "detailAddress": '101동',
        "complexType": "아파트",
        "boxType": "극소",
        "deliveryFee": 300,
        "tagInfo": ' #엘리베이터 2대, #소형단지'
      }];
    }


    return dropItemList_testData;
  }
}


class DropItem_List_decodeMap {
  String? complexName;
  String? detailAddress;
  String? complexType;
  String? boxType;
  int? deliveryFee;
  String? tagInfo;
  bool? selectYn;


  DropItem_List_decodeMap(complexName, detailAddress, complexType, boxType, deliveryFee, tagInfo){
    this.complexName = complexName;
    this.detailAddress = detailAddress;
    this.complexType = complexType;
    this.boxType = boxType;
    this.deliveryFee = deliveryFee;
    this.tagInfo = tagInfo;
    selectYn = false;
  }

  DropItem_List_decodeMap.fromJson(Map<String, dynamic> json)
      : complexName = json['complexName'],
        detailAddress = json['detailAddress'],
        complexType = json['complexType'],
        boxType = json['boxType'],
        deliveryFee = json['deliveryFee'],
        tagInfo = json['tagInfo'];
}
