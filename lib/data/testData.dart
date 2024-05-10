class DropItem_TestData{
  List<Map<String, dynamic>>? dropPointList_testData;
  List<Map<String, dynamic>>? dropPointList_testData_1;
  List<Map<String, dynamic>>? dropPointList_testData_2;
  List<Map<String, dynamic>>? dropPointList_testData_3;
  List<Map<String, dynamic>>? final_dropPointList_testData;
  List<Map<String, dynamic>>? dropItemList_testData;

  dropPoint_List(double fr_drop_latitude, double to_drop_latitude, double fr_drop_longitude, double to_drop_longitude){
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
    ];

    dropPointList_testData_2 =
    [
      { 'drop_pointid': '4',
        'drop_latitude': 37.497005,
        'drop_longitude': 126.779065,
        'drop_count': 5
      },
      { 'drop_pointid': '5',
        'drop_latitude': 37.495066,
        'drop_longitude': 126.781136,
        'drop_count': 3
      },
      { 'drop_pointid': '6',
        'drop_latitude': 37.493699,
        'drop_longitude': 126.780847,
        'drop_count': 5
      },
    ];

    dropPointList_testData_3 =
    [
      { 'drop_pointid': '7',
        'drop_latitude': 37.495109,
        'drop_longitude': 126.779065,
        'drop_count': 5
      },
      { 'drop_pointid': '8',
        'drop_latitude': 37.495066,
        'drop_longitude': 126.781136,
        'drop_count': 3
      },
      { 'drop_pointid': '9',
        'drop_latitude': 37.493699,
        'drop_longitude': 126.780847,
        'drop_count': 5
      },
    ];

    if(fr_drop_latitude >= 37.49210276650818 && to_drop_latitude <= 37.4964951689097 && fr_drop_longitude >= 126.77834314811918 && to_drop_longitude <= 126.78254885187994 )
    {final_dropPointList_testData = dropPointList_testData_1;};
    if(fr_drop_latitude >= 37.495219448036124 && to_drop_latitude <= 37.49961166713631 && fr_drop_longitude >= 126.77807177302543 && to_drop_longitude <= 126.78227747678619 )
    {final_dropPointList_testData = dropPointList_testData_2;};
    if(fr_drop_latitude >= 37.499323127898705 && to_drop_latitude <= 37.503715105629496 && fr_drop_longitude >= 126.77660052957248 && to_drop_longitude <= 126.78254885187994 )
    {final_dropPointList_testData = dropPointList_testData_3;};

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


  DropItem_List_decodeMap(complexName, detailAddress, complexType, boxType, deliveryFee, tagInfo){
    this.complexName = complexName;
    this.detailAddress = detailAddress;
    this.complexType = complexType;
    this.boxType = boxType;
    this.deliveryFee = deliveryFee;
    this.tagInfo = tagInfo;
  }

  DropItem_List_decodeMap.fromJson(Map<String, dynamic> json)
      : complexName = json['complexName'],
        detailAddress = json['detailAddress'],
        complexType = json['complexType'],
        boxType = json['boxType'],
        deliveryFee = json['deliveryFee'],
        tagInfo = json['tagInfo'];
}
