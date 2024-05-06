
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';

void main() async {
  await NaverMapMlmApp_Initialize().initialize();
  Map<String, double> locationMap = await Location().getCurrentLocation();

  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3366CC),
        title: const Text(
          'Micro Last Mile Title',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      body: Search_MapView(
        initialLocation: locationMap,
        markerLocation:
          [
            {'drop_latitude' : 37.495109,
             'drop_longitude' : 126.779065,
             'drop_count' : 5
            },
            {'drop_latitude' : 37.495066,
             'drop_longitude' : 126.781136,
             'drop_count' : 10
            },
            {'drop_latitude' : 37.493699,
             'drop_longitude' : 126.780847,
             'drop_count' : 25
            },
          ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF3366CC),
        currentIndex: 1,
        items: const [
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.map), label: '지도뷰'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.square_arrow_up_on_square), label: '픽업'),
            BottomNavigationBarItem(icon: Icon(Icons.delivery_dining), label: '배송'),
            BottomNavigationBarItem(icon: Icon(CupertinoIcons.person), label: '마이페이지'),
          ],
          onTap: (value) {
            print(value);
          },
          //   _nvbar_index = value;
          //   if (_nvbar_index == 0) {
          //     Navigator.pop(context);
          //   }
          //   if (_nvbar_index == 2) {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => const PutAway_Menu(),));
          //   }
          //   if (_nvbar_index == 3) {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => const Inven_Menu(),));
          //   }
          //   if (_nvbar_index == 4) {
          //     Navigator.push(context, MaterialPageRoute(builder: (context) => const Pick_Menu(),));
          //   }
          // }
          ),
      ),
      )
  );
}

// runApp(MaterialApp(
  //   home: Scaffold(
  //     appBar: AppBar(
  //       backgroundColor: Color(0xFF3366CC),
  //       title: const Text('Micro Last Mile Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
  //     ),
  //     body: UserPickUp(
  //         pickPointAdd: '부평구 그랑힐스 아파트 204동',
  //         initialLocation: locationMap,
  //         markerLocation: m_locationMap,
  //         pickupImgUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDhfMTkw%2FMDAxNjI1NzA4NTU4MDk5.VGnPEqOJ1Z8F51ZcH49uuCH7-Czk7Xdbqzy3SdWDTdsg.ajf5-CoEEYuKpKS-DvGIK_OCUosGgmwA7EDmopcD1d4g.JPEG.ykj4708%2FKakaoTalk_20210708_103656329_01.jpg&type=a340',
  //         pickupInfomation: '지하1층 204동 출입구 앞 펜스 안쪽에서 픽업 바랍니다.',
  //         pickupInfomationDetail: '주차구역번호 B1C4',
  //         csNumber: '1588-9999',
  //         totalCount: 23,
  //         leftCount: 22,
  //         pickupList: [{"invoiceNo" : "1111-****-***-1234",
  //           "deliveryCoo" : 'CJ대한통은',
  //           "address" : "e편한세상 부평그랑힐스",
  //           "detailAddress" : '104동 101호',
  //           "boxType" : "극소",
  //           "deliveryFee" : 300,
  //           "pickupState" : 0
  //         },
  //           {"invoiceNo" : "1111-****-***-1235",
  //             "deliveryCoo" : 'CJ대한통은',
  //             "address" : "Xi 그랜드써밋",
  //             "detailAddress" : '101동 101호',
  //             "boxType" : "극소",
  //             "deliveryFee" : 500,
  //             "pickupState" : 1
  //           },
  //           {"invoiceNo" : "1111-****-***-1236",
  //             "deliveryCoo" : 'CJ대한통은',
  //             "address" : "e편한세상 부평그랑힐스",
  //             "detailAddress" : '101동 102호',
  //             "boxType" : "극대",
  //             "deliveryFee" : 100,
  //             "pickupState" : 1
  //           },
  //           {"invoiceNo" : "1111-****-***-1237",
  //             "deliveryCoo" : 'CJ대한통은',
  //             "address" : "e편한세상 부평그랑힐스",
  //             "detailAddress" : '101동 103호',
  //             "boxType" : "극대",
  //             "deliveryFee" : 400,
  //             "pickupState" : 1
  //           }]
  //     ),
  //   ),
  // ));
// }


class Search_MapView extends StatefulWidget {
  final Map<String, double>? initialLocation;
  final List<Map<String, double>>? markerLocation;

  const Search_MapView({super.key, this.initialLocation, this.markerLocation});

  @override
  State<Search_MapView> createState() => _Search_MapViewState();
}

class _Search_MapViewState extends State<Search_MapView> {
  late Map<String, double> _initialLocation = Map();
  late List<Map<String, double>>? _markerLocation;
  late double container_height = 10;
  // late NOverlayImage nOverlayImage;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initialLocation = widget.initialLocation!;
    _markerLocation = widget.markerLocation;
    container_height = 10;
  }

  void test_cont(){
    setState(() {
      container_height = 100;
      print('ok');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Row(
                children: [
                  Expanded(flex: 7, child: Placeholder()),
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(child: SizedBox()),
                        Expanded(child: AutoSizeText('예상수익', minFontSize: 1, maxFontSize: 100, style: TextStyle(fontSize: 16, color: CupertinoColors.activeBlue),)),
                        Expanded(child: Placeholder()),
                        Expanded(child: SizedBox())
                      ],
                    )
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: NaverMapMlmApp(initial_LocationMap: _initialLocation, marker_LocationListMap: _markerLocation, use_Gestures_yn: true, zoom_level: 16)
          ),
        ],
      ),
        Positioned(
          child: Container(
            child: TextButton(
              child: Text('test'),
              onPressed: () => test_cont(),
            ),
            height: container_height,
            width: 370,
            color: Colors.blue,
            ),
          bottom: 0,
        )
      ]
    );
  }
}



class Test{
  test(){
    print('test');
    _Search_MapViewState().test_cont();
    print('okok');

  }
}

class Create_droplistView extends StatefulWidget {
  const Create_droplistView({super.key});

  @override
  State<Create_droplistView> createState() => _Create_droplistViewState();
}

class _Create_droplistViewState extends State<Create_droplistView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}


//
//
//
//
//
// class UserPickup_MapToList {
//   String? invoiceNo;
//   String? deliveryCoo;
//   String? address;
//   String? detailAddress;
//   String? boxType;
//   int? deliveryFee;
//   int? pickupState;
//
//   UserPickup_MapToList(invoiceNo, deliveryCoo, address, detailAddress, boxType, deliveryFee, pickupState){
//     this.invoiceNo = invoiceNo;
//     this.deliveryCoo = deliveryCoo;
//     this.address = address;
//     this.detailAddress = detailAddress;
//     this.boxType = boxType;
//     this.deliveryFee = deliveryFee;
//     this.pickupState = pickupState;
//   }
//
//   UserPickup_MapToList.fromJson(Map<String, dynamic> json)
//       : invoiceNo = json['invoiceNo'],
//         deliveryCoo = json['deliveryCoo'],
//         address = json['address'],
//         detailAddress = json['detailAddress'],
//         boxType = json['boxType'],
//         deliveryFee = json['deliveryFee'],
//         pickupState = json['pickupState'];
// }
//
//
// class PickUpListView extends StatelessWidget {
//   final List<UserPickup_MapToList> convert_pickupList;
//   const PickUpListView({super.key, required this.convert_pickupList});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//         children: _getInputs()
//     );
//   }
//
//   List<Widget> _getInputs(){
//     List<Widget> textWidgetList = [];
//     convert_pickupList.forEach((element) {
//       textWidgetList.add(
//           Container(
//             decoration: const BoxDecoration(
//                 border: Border.symmetric(horizontal: BorderSide(color: Colors.grey),)
//             ),
//             // color: Colors.pink,
//             height: 150,
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: Row(
//                       children: [
//                         const AutoSizeText(
//                           '운송장번호 : ',
//                           minFontSize: 1,
//                           maxFontSize: 100,
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
//                         ),
//                         AutoSizeText(
//                           element.invoiceNo!,
//                           minFontSize: 1,
//                           maxFontSize: 100,
//                           style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
//                         ),
//                       ],),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: AutoSizeText(
//                         // textAlign: TextAlign.left,
//                         element.deliveryCoo!,
//                         minFontSize: 1,
//                         maxFontSize: 100,
//                         style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       alignment: Alignment.centerLeft,
//                       child: AutoSizeText(
//                         element.address!,
//                         minFontSize: 1,
//                         maxFontSize: 100,
//                         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Row(
//                       children: [
//                         Expanded(
//                           flex: 6,
//                           child: AutoSizeText(
//                             element.detailAddress!,
//                             minFontSize: 1,
//                             maxFontSize: 100,
//                             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 1,
//                           child: AutoSizeText(
//                             element.boxType!,
//                             minFontSize: 1,
//                             maxFontSize: 100,
//                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black54),
//                           ),
//                         ),
//                         Expanded(
//                           flex: 3,
//                           child: AutoSizeText(
//                             '수수료 ${element.deliveryFee!} 원',
//                             minFontSize: 1,
//                             maxFontSize: 100,
//                             style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF3366CC)),
//                           ),
//                         )
//                       ],),
//                   ),
//                   Expanded(
//                     child: SizedBox(
//                         width: double.infinity,
//                         height: 30,
//                         child: PickStateWidget().stateWidget(element.pickupState)
//                     ),
//                   )
//                 ]
//             ),
//           )
//       );
//     });
//     return textWidgetList;
//   }
// }
//
//
// class UserPickUp extends StatefulWidget {
//   final String pickPointAdd;
//   final Map<String, double> initialLocation; /*네이버 지도 List >> Map으로 변경 해야 함*/
//   final Map<String, double>? markerLocation;
//   final String pickupImgUrl; /*이미지 리스트로 변경??, 다음 상세화면에서 변경??*/
//   final String pickupInfomation;
//   final String pickupInfomationDetail;
//   final String csNumber;
//   final int totalCount;
//   final int leftCount;
//   final List<Map<String, dynamic>> pickupList;
//
//   const UserPickUp(
//       {super.key,
//         required this.pickPointAdd,
//         required this.initialLocation,
//         this.markerLocation,
//         required this.pickupImgUrl,
//         required this.pickupInfomation,
//         required this.pickupInfomationDetail,
//         required this.csNumber,
//         required this.totalCount,
//         required this.leftCount,
//         required this.pickupList
//       });
//
//   @override
//   State<UserPickUp> createState() => _UserPickUpState();
// }
//
// class _UserPickUpState extends State<UserPickUp> {
//   late int _leftCount;
//   late Map<String, double> _initialLocation = Map();
//   late Map<String, double>? _markerLocation = Map();
//   late List<Map<String, dynamic>> _pickupListMap;
//   List<UserPickup_MapToList> userPickup_MapToList = [];
//   // late int _pickupState;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _leftCount = widget.leftCount;
//     _pickupListMap = widget.pickupList;
//     _initialLocation = widget.initialLocation;
//     _markerLocation = widget.markerLocation;
//     _pickupListMap.forEach((element) {
//       userPickup_MapToList.add(UserPickup_MapToList.fromJson(element));
//     });
//
//     // PickUpListView(_pickupListMap)._getInputs();
//     // print(widget.pickupList[0]);
//     // print(widget.pickupList[1]);
//     // _pickupState = widget.pickupList[_element['pickupList']];
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//         children: [SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               /*픽업 포인트 주소 컨테이너*/
//               SizedBox(
//                 height: 50,
//                 child: Container(
//                     alignment: Alignment.centerLeft,
//                     decoration: const BoxDecoration(
//                         border: Border.symmetric(horizontal: BorderSide(color: Colors.grey))
//                     ),
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: AutoSizeText(
//                       widget.pickPointAdd,
//                       minFontSize: 1,
//                       maxFontSize: 100,
//                       style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
//                     )
//                 ),
//               ),
//               /*픽업 포인트 상세 사진 컨테이너*/
//               SizedBox(
//                 height: 150,
//                 child: Row(
//                   children: [
//                     Expanded(
//                         flex: 1,
//                         // child: Image.network(widget.mapUrl, fit: BoxFit.fill,),
//                         child: Stack(
//                             children: [
//                               NaverMapMlmApp(initial_LocationMap: _initialLocation, marker_LocationListMap: _markerLocation, use_Gestures_yn: false,),
//                               Positioned(
//                                 right: 0,
//                                 child: InkWell(
//                                   child: Container(
//                                     height: 40,
//                                     width: 40,
//                                     decoration: BoxDecoration(
//                                         color: Colors.white,
//                                         border: Border.all(color: Colors.grey),
//                                         borderRadius: BorderRadius.circular(3)
//                                     ),
//                                     margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
//                                     child: Icon(CupertinoIcons.fullscreen, color: Colors.black54,),
//                                   ),
//                                   onTap: () {
//                                     Navigator.push(context, MaterialPageRoute(builder: (context) => PickupPoint_NaverMap(initialLocation: _initialLocation, markerLocation: _markerLocation,),));
//                                   },
//                                 ),
//                               ),
//                             ]
//                         )
//                     ),
//                     Expanded(
//                       flex: 1,
//                       child: InkWell(
//                         child: Image.network(
//                           widget.pickupImgUrl,
//                           fit: BoxFit.fill,
//                         ),
//                         onTap: () {
//                           Navigator.push(context, MaterialPageRoute(builder: (context) => PickupPoint_picture(),));
//                         },
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Container(
//                 decoration: const BoxDecoration(
//                     border: Border.symmetric(horizontal: BorderSide(color: Colors.grey))
//                 ),
//                 height: 70,
//                 padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
//                 child: Column(
//                   children: [
//                     Expanded(child: Container(alignment: Alignment.centerLeft, child: AutoSizeText(widget.pickupInfomation, textAlign: TextAlign.left,))),
//                     Expanded(child: Container(alignment: Alignment.centerLeft, child: AutoSizeText('(${widget.pickupInfomationDetail})', textAlign: TextAlign.left))),
//                     Expanded(child: Container(alignment: Alignment.centerLeft, child: AutoSizeText('고객센터 문의: ${widget.csNumber}', textAlign: TextAlign.left, style: const TextStyle(color: CupertinoColors.systemBlue),))),
//                   ],
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 height: 30,
//                 child: Row(
//                   children: [
//                     Expanded(flex: 8, child: AutoSizeText('$_leftCount개의 픽업이 남았습니다.', style: const TextStyle(fontWeight: FontWeight.bold),)),
//                     Expanded(flex: 2, child: AutoSizeText('[ 총 ${widget.totalCount}건 ]'))
//                   ],
//                 ),
//               ),
//               PickUpListView(convert_pickupList: userPickup_MapToList),
//             ],
//           ),
//         ),
//           const Column(
//             children: [
//               Expanded(flex: 8, child: SizedBox(child: SizedBox.shrink(),)),
//               Expanded(
//                 flex: 1,
//                 child: Row(
//                   children: [
//                     Expanded(flex: 20, child: SizedBox(child: SizedBox.shrink(),)),
//                     Expanded(
//                       flex: 5,
//                       child: ReadBarCode(),
//                       // IconButton(
//                       //   icon: Icon(Icons.add_alarm)
//                       //IconCircleContainer(innerColor: Colors.white, outerColor: Color(0xFF003399), icon: CupertinoIcons.barcode,),
//                       // onPressed: () => {print('1');},
//                       //   )
//                       // ),
//                       //
//                       // SizedBox(
//                       //     height: 60,
//                       //     // width: 5,
//                       //     child: IconCircleContainer(innerColor: Colors.white, outerColor: Color(0xFF003399), icon: CupertinoIcons.barcode,)
//                       // ),
//                       // IconButton(
//                       //   icon: Icon(CupertinoIcons.barcode),
//                       //   onPressed: () {},
//                       // )
//                     ),
//
//                     Expanded(flex: 1, child: SizedBox(child: SizedBox.shrink(),)),
//                   ],
//                 ),
//               ),
//               Expanded(flex: 1, child: SizedBox(child: SizedBox.shrink(),)),
//             ],
//           )
//         ]
//     );
//   }
// }
//
//
// class PickStateWidget{
//   stateWidget(pickState){
//     if(pickState == 0){
//       return Container(
//         decoration: const BoxDecoration(
//           // border: Border.symmetric(horizontal: BorderSide(color: Colors.grey),),
//           color: Color(0xFFF2F2F2),),
//         alignment: Alignment.center,
//         child: const AutoSizeText(
//           minFontSize: 1,
//           maxFontSize: 100,
//           '픽업 대기 중',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 15,
//               color: Color(0xFF3366CC)
//           ),
//         ),
//       );
//     }
//     if(pickState == 1){
//       return Container(
//           decoration: const BoxDecoration(
//             // border: Border.symmetric(horizontal: BorderSide(color: Colors.grey),),
//             color: Color(0xFF3366CC),),
//           alignment: Alignment.center,
//           child: const AutoSizeText(
//             minFontSize: 1,
//             maxFontSize: 100,
//             '픽업완료',
//             textAlign: TextAlign.center,
//             style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 15,
//                 color: Colors.white
//             ),
//           )
//       );
//     }
//   }
// }
//
// class ReadBarCode extends StatelessWidget {
//   const ReadBarCode({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       borderRadius: BorderRadius.circular(25),
//       splashColor: Color(0xFF003399),
//       child: IconCircleContainer(innerColor: Colors.white, outerColor: Color(0xFF003399), icon: CupertinoIcons.barcode,),
//       onTap: () {
//         showDialog(
//           context: context,
//           builder: (context) => Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               AlertDialog(
//                 // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(0.0)),
//                 alignment: Alignment.centerRight,
//                 backgroundColor: Colors.black,
//                 title: const AutoSizeText(
//                   '운송장을 스캔 해주세요.',
//                   minFontSize: 1,
//                   maxFontSize: 100,
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 14,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//                 content: QrBarCode_Reader(title: 'QR/Bar코드인식 with 진동/소리'),
//                 // content: Text("test")
//               ),
//             ],
//           ),
//         );
//         // showDialog(
//         //   context: context,
//         //   builder: (context) => AlertDialog(
//         //     // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
//         //     shape: RoundedRectangleBorder(
//         //         borderRadius: BorderRadius.circular(0.0)),
//         //     alignment: Alignment.centerRight,
//         //     backgroundColor: Colors.black,
//         //     title: const AutoSizeText(
//         //       '운송장을 스캔 해주세요.',
//         //       minFontSize: 1,
//         //       maxFontSize: 100,
//         //       style: TextStyle(
//         //         color: Colors.white,
//         //         fontSize: 14,
//         //         fontWeight: FontWeight.bold,
//         //       ),
//         //       textAlign: TextAlign.center,
//         //     ),
//         //     contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//         //     content: QrBarCode_Reader(title: 'QR/Bar코드인식 with 진동/소리'),
//         //     // content: Text("test")
//         //   ),
//         // );
//         // showDialog(
//         //   useSafeArea: false,
//         //   anchorPoint: Offset(150, 150),
//         //   context: context,
//         //   builder: (context) => QrBarCode_Reader(title: 'QR/Bar코드인식 with 진동/소리'),
//         // );
//       },
//     );
//   }
// }