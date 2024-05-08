
import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';
import 'package:mlm_app_for_user/screens/userPickup.dart';

import '../data/testData.dart';

void main() async {
  await NaverMapMlmApp_Initialize().initialize();
  Map<String, double> locationMap ={'Initial_latitude' : 37.494299, 'Initial_longitude' : 126.780446};
  // Map<String, double> locationMap = await Location().getCurrentLocation();

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
             'drop_count' : 3
            },
            {'drop_latitude' : 37.493699,
             'drop_longitude' : 126.780847,
             'drop_count' : 5
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
        ),
      ),
    )
  );
}


class Search_MapView extends StatefulWidget {
  final Map<String, double>? initialLocation;
  final List<Map<String, double>>? markerLocation;

  const Search_MapView({super.key, this.initialLocation, this.markerLocation});

  @override
  State<Search_MapView> createState() => Search_MapViewState();
}

class Search_MapViewState extends State<Search_MapView> {
  late Map<String, double> _initialLocation = Map();
  late List<Map<String, double>>? _markerLocation;
  late double container_height;
  bool dropItemTitle_visible = true;
  bool dropItemList_visible = false;
  bool dropItemListTitle_visible = false;
  late List<Map<String, dynamic>> dropItem_TestData = [];
  List<DropItem_List_decodeMap> convert_dropItem_ListMap = [];
  // late NOverlayImage nOverlayImage;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initialLocation = widget.initialLocation!;
    _markerLocation = widget.markerLocation;
    container_height = 50;
    // visible = true;
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

    dropItem_TestData.forEach((element) {
      convert_dropItem_ListMap.add(DropItem_List_decodeMap.fromJson(element));
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
            child: Row(
              children: [
                Expanded(flex: 7, child: Placeholder()),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Expanded(child: SizedBox()),
                      Expanded(child: AutoSizeText('TEST', minFontSize: 1, maxFontSize: 100, style: TextStyle(fontSize: 16, color: CupertinoColors.activeBlue),)),
                      Expanded(child: Placeholder()),
                      Expanded(child: SizedBox())
                    ],
                  )
                )
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: NaverMapMlmApp(initial_LocationMap: _initialLocation, marker_LocationListMap: _markerLocation, use_Gestures_yn: true, zoom_level: 16)
          ),
        ],
      ),
        Visibility(
          visible: dropItemTitle_visible,
          child: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(height: container_height, color: Colors.white,
              child: DropList_Title(),
            ),
          ),
        ),
        // Visibility(visible: dropItemListTitle_visible,
        //     child: DraggableScrollableSheet(
        //       minChildSize: 0.2,
        //       initialChildSize: 0.4,
        //       maxChildSize: 0.5,
        //       builder: (context, scrollController) {
        //         return SingleChildScrollView(
        //             controller: scrollController,
        //             child: DropItem_ListView(convert_dropItemList: convert_dropItem_ListMap),
        //         );
        //       },
        //     )
        // ),
        Visibility(visible: dropItemListTitle_visible,
            child: DropItem_ListView(convert_dropItemList: convert_dropItem_ListMap),
        )
      ]
    );
  }
}


class DropList_Title extends StatefulWidget {
  // final double container_height;
  DropList_Title({super.key});

  @override
  State<DropList_Title> createState() => DropList_TitleState();
}

class DropList_TitleState extends State<DropList_Title> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(width: 0.5, color: Colors.grey)),
          color: Colors.white),
      child: Row(
        children: [
          Expanded(
              child: Container(
                decoration: const BoxDecoration(
                border: Border(
                right: BorderSide(width: 0.5, color: Colors.grey))),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText('data_title_1', textAlign: TextAlign.right),
                    AutoSizeText(
                      'data',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              )
          ),
          const Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AutoSizeText('data_title_2', textAlign: TextAlign.right),
                AutoSizeText(
                  'data',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}


class DropItem_Title extends StatelessWidget {
  const DropItem_Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 30, child: AutoSizeText('test'),);
  }
}



class DropItem_ListView extends StatefulWidget {
  final List<DropItem_List_decodeMap> convert_dropItemList;
  const DropItem_ListView({super.key, required this.convert_dropItemList});

  @override
  State<DropItem_ListView> createState() => _DropItem_ListViewState();
}

class _DropItem_ListViewState extends State<DropItem_ListView> {
  late List<DropItem_List_decodeMap> _convert_dropItemList = [];
  late bool checkboxValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _convert_dropItemList.clear();
    _convert_dropItemList = widget.convert_dropItemList;
    checkboxValue = false;
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: 0.2,
        initialChildSize: 0.4,
        maxChildSize: 0.8,
        builder: (context, scrollController) {
          return ListView.separated(
              itemBuilder: (context, index) => ,
              separatorBuilder: (context, index) => ,
              itemCount:
          )
      // return ListView(
      //   scrollDirection: Axis.vertical,
      //   controller: scrollController,
      //   shrinkWrap: true,
      //   children: [
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {
      //       setState(() {
      //         print(value);
      //         print(v)
      //         checkboxValue = value!;
      //       });
      //     },),Text('1111'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('2222'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('3333'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('4444'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('5555'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('6666'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('7777'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('8888'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('9999'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('1111'),],)),
      //     Container(color: Colors.white, height: 100, child: Row(children: [Checkbox(value: checkboxValue, onChanged: (value) {},),Text('2222'),],)),
      //   ],
      // );
      }
    );
  }


  // ListView _getDropItem(){
  //
  //     List<Widget> dropItemWidgetList = [];
  //     Search_MapViewState? parent = context.findAncestorStateOfType<Search_MapViewState>();
  //
  //     _convert_dropItemList.forEach((element) {
  //       dropItemWidgetList.add(
  //           Container(
  //             height: 100,
  //             color: Colors.white,
  //             child: Row(
  //               children: [
  //                 Expanded(
  //                     flex: 1,
  //                     child: Checkbox(
  //                       value: checkboxValue,
  //                       onChanged: (value) {
  //                         print(value);
  //
  //                         parent?.setState(() {
  //                           checkboxValue = value!;
  //                           print(value);
  //                         });
  //
  //                         // setState(() {
  //                         //   if (value == false){
  //                         //     checkboxValue = true;
  //                         //   } else {checkboxValue = false;}
  //                         // });
  //                       },
  //                     )
  //                 ),
  //                 Expanded(
  //                   flex: 9,
  //                   child: Column(
  //                     children: [
  //                       AutoSizeText('${element.complexName}', minFontSize: 1, style: TextStyle(fontSize: 5),),
  //                       AutoSizeText('${element.detailAddress}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                       AutoSizeText('${element.complexType}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                       Row(
  //                         children: [
  //                           AutoSizeText('${element.boxType}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                           AutoSizeText('${element.deliveryFee}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                         ],
  //                       ),
  //                       AutoSizeText('${element.tagInfo}', minFontSize: 1,style: TextStyle(fontSize: 5),)
  //                     ],
  //                   ),
  //                 )
  //               ],
  //             ),
  //           )
  //       );
  //     });
  //     return dropItemWidgetList;
  // }



  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //       children: _getDropItem()
  //   );
  // }
  //
  //
  //
  // List<Widget> _getDropItem(){
  //
  //   List<Widget> dropItemWidgetList = [];
  //   Search_MapViewState? parent = context.findAncestorStateOfType<Search_MapViewState>();
  //
  //   _convert_dropItemList.forEach((element) {
  //     dropItemWidgetList.add(
  //         Container(
  //           height: 100,
  //           color: Colors.white,
  //           child: Row(
  //             children: [
  //               Expanded(
  //                   flex: 1,
  //                   child: Checkbox(
  //                     value: checkboxValue,
  //                     onChanged: (value) {
  //                       print(value);
  //
  //                       parent?.setState(() {
  //                         checkboxValue = value!;
  //                         print(value);
  //                       });
  //
  //                       // setState(() {
  //                       //   if (value == false){
  //                       //     checkboxValue = true;
  //                       //   } else {checkboxValue = false;}
  //                       // });
  //                     },
  //                   )
  //               ),
  //               Expanded(
  //                 flex: 9,
  //                 child: Column(
  //                   children: [
  //                     AutoSizeText('${element.complexName}', minFontSize: 1, style: TextStyle(fontSize: 5),),
  //                     AutoSizeText('${element.detailAddress}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                     AutoSizeText('${element.complexType}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                     Row(
  //                       children: [
  //                         AutoSizeText('${element.boxType}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                         AutoSizeText('${element.deliveryFee}', minFontSize: 1,style: TextStyle(fontSize: 5),),
  //                       ],
  //                     ),
  //                     AutoSizeText('${element.tagInfo}', minFontSize: 1,style: TextStyle(fontSize: 5),)
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //     );
  //   });
  //   return dropItemWidgetList;
  // }

}