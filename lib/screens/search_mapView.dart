
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';
import 'package:mlm_app_for_user/screens/userPickup.dart';

import '../data/testData.dart';

void main() async {
  await NaverMapMlmApp_Initialize().initialize();
  Map<String, double> locationMap ={'Initial_latitude' : 37.494299, 'Initial_longitude' : 126.780446};
  // Map<String, double> locationMap = await Location().getCurrentLocation();

  runApp(MaterialApp(
    home: Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color(0xFF3366CC),
      //   title: const Text(
      //     'Micro Last Mile Title',
      //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      //     ),
      //   ),
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
  late double container_height = 150;
  bool dropItemTitle_visible = true;
  bool dropItemList_visible = false;
  List<DropItem_List_decodeMap> dropItem_ListMap = [];
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
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Visibility(visible: dropItemTitle_visible, child: DropList_Title(container_height: container_height,)),
              Visibility(visible: dropItemList_visible, child: DropItem_ListView(convert_dropItemList: dropItem_ListMap))
            ],
          ),
        )
      ]
    );
  }
}


class DropList_Title extends StatefulWidget {
  final double container_height;
  DropList_Title({super.key, required this.container_height});

  @override
  State<DropList_Title> createState() => DropList_TitleState();
}

class DropList_TitleState extends State<DropList_Title> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.container_height,
      decoration: const BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(width: 0.5, color: Colors.grey)),
          color: Colors.white),
      child: Expanded(
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
      ),
    );
  }
}

class DropItem_ListView extends StatelessWidget {
  final List<DropItem_List_decodeMap> convert_dropItemList;
  const DropItem_ListView({super.key, required this.convert_dropItemList});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _getDropItem()
    );
  }

  List<Widget> _getDropItem(){
    List<Widget> dropItemWidgetList = [];
    convert_dropItemList.forEach((element) {
      dropItemWidgetList.add(
          Container(
            child: Row(
              children: [
                Container(
                  child: Placeholder(),
                ),
                Column(
                  children: [
                    AutoSizeText('${element.complexName}'),
                    AutoSizeText('${element.detailAddress}'),
                    AutoSizeText('${element.complexType}'),
                    Row(
                      children: [
                        AutoSizeText('${element.boxType}'),
                        AutoSizeText('${element.deliveryFee}'),
                      ],
                    ),
                    AutoSizeText('${element.tagInfo}')
                  ],
                )
              ],
            ),
          )
      );
    });
    return dropItemWidgetList;
  }
}