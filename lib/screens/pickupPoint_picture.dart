import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: const Text('Micro Last Mile Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: PickupPoint_picture(
          // pickPointAdd: '부평구 그랑힐스 아파트 204동',
          // initialLocation: locationMap,
          // markerLocation: m_locationMap,
          // pickupImgUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDhfMTkw%2FMDAxNjI1NzA4NTU4MDk5.VGnPEqOJ1Z8F51ZcH49uuCH7-Czk7Xdbqzy3SdWDTdsg.ajf5-CoEEYuKpKS-DvGIK_OCUosGgmwA7EDmopcD1d4g.JPEG.ykj4708%2FKakaoTalk_20210708_103656329_01.jpg&type=a340',
          // pickupInfomation: '지하1층 204동 출입구 앞 펜스 안쪽에서 픽업 바랍니다.',
          // pickupInfomationDetail: '주차구역번호 B1C4',
          // csNumber: '1588-9999',
          // totalCount: 23,
          // leftCount: 22,
          // pickupList: [{"invoiceNo" : "1111-****-***-1234",
          //   "deliveryCoo" : 'CJ대한통은',
          //   "address" : "e편한세상 부평그랑힐스",
          //   "detailAddress" : '104동 101호',
          //   "boxType" : "극소",
          //   "deliveryFee" : 300,
          //   "pickupState" : 0
          // },
          //   {"invoiceNo" : "1111-****-***-1235",
          //     "deliveryCoo" : 'CJ대한통은',
          //     "address" : "Xi 그랜드써밋",
          //     "detailAddress" : '101동 101호',
          //     "boxType" : "극소",
          //     "deliveryFee" : 500,
          //     "pickupState" : 1
          //   },
          //   {"invoiceNo" : "1111-****-***-1236",
          //     "deliveryCoo" : 'CJ대한통은',
          //     "address" : "e편한세상 부평그랑힐스",
          //     "detailAddress" : '101동 102호',
          //     "boxType" : "극대",
          //     "deliveryFee" : 100,
          //     "pickupState" : 1
          //   },
          //   {"invoiceNo" : "1111-****-***-1237",
          //     "deliveryCoo" : 'CJ대한통은',
          //     "address" : "e편한세상 부평그랑힐스",
          //     "detailAddress" : '101동 103호',
          //     "boxType" : "극대",
          //     "deliveryFee" : 400,
          //     "pickupState" : 1
          //   }]
      ),
    ),
  ));
}

class PickupPoint_picture extends StatelessWidget {
  const PickupPoint_picture({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 12,
            child: Placeholder(),
          ),
          Expanded(
              flex: 1,
              child: Container(
                  child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.close_outlined, color: Colors.grey, )
                  )
              )
          )
        ],
      ),
    );
  }
}
