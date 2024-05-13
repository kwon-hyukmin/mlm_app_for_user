

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';
import 'package:mlm_app_for_user/screens/userPickup.dart';

import '../data/testData.dart';

void main() async {
  await NaverMapMlmApp_Initialize().initialize();
  Map<String, double> locationMap = await Location().getCurrentLocation();
  Map<String, double> m_locationMap = await M_Location().getCurrentLocation();

  runApp(Myapp(i_locationMap: locationMap, m_locationMap: m_locationMap,)

  );
}

class Myapp extends StatelessWidget {
  final Map<String, double> i_locationMap;
  final Map<String, double> m_locationMap;
  const Myapp({super.key, required this.i_locationMap, required this.m_locationMap});

  @override
  Widget build(BuildContext context) {

  Map<String, double> locationMap ={'Initial_latitude' : 37.494299, 'Initial_longitude' : 126.780446};
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF3366CC),
          title: const Text(
            'Naver Map Test Page',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Search_MapView(
          initialLocation: locationMap,
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
          onTap: (value) {}
                ),
                )
              );
            }

}



class Search_MapView extends StatefulWidget {
  final Map<String, double>? initialLocation;


  const Search_MapView({super.key, this.initialLocation});

  @override
  State<Search_MapView> createState() => Search_MapViewState();
}

class Search_MapViewState extends State<Search_MapView> {
  late Map<String, double> _initialLocation = Map();
  bool dropItemList_visible = false;
  bool inArea_DropSummary_visible = true;
  late List<Map<String, dynamic>> dropItemListMapData = [];
  List<DropItem_List_decodeMap> convert_dropItem_ListMap = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialLocation = widget.initialLocation!;

    // visible = true;
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);

    dropItemListMapData.forEach((element) {
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
            child: NaverMapMlmApp(initial_LocationMap: _initialLocation, use_Gestures_yn: true, zoom_level: 16)
          ),
        ],
      ),
        Visibility(
          visible: inArea_DropSummary_visible,
          child: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(height: 50, color: Colors.white,
              child: InArea_DropSummary(),
            ),
          ),
        ),
        Visibility(visible: dropItemList_visible,
            child: Column(
              children: [
                Expanded(child: DropItem_ListView(convert_dropItemList: convert_dropItem_ListMap)),
              ],
            ),
        )
      ]
    );
  }
}


class InArea_DropSummary extends StatefulWidget {
  InArea_DropSummary({super.key});

  @override
  State<InArea_DropSummary> createState() => InArea_DropSummaryState();
}

class InArea_DropSummaryState extends State<InArea_DropSummary> {
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


class DropItem_Header extends StatefulWidget {
  final int parent_ListView_length;
  const DropItem_Header({super.key, required this.parent_ListView_length});
  @override
  State<DropItem_Header> createState() => DropItem_HeaderState();
}

class DropItem_HeaderState extends State<DropItem_Header> {
  late bool _allCheckboxValue;
  late int _parent_ListView_length;
  int _checkCount=0;
  int _covert_checkCount=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // _allCheckboxValue = false;
    // _parent_ListView_length = widget.parent_ListView_length;
    // _checkCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    _allCheckboxValue = false;
    _parent_ListView_length = widget.parent_ListView_length;
    DropItem_ListViewState? parent = context.findAncestorStateOfType<DropItem_ListViewState>();
    Search_MapViewState? mainParent = context.findAncestorStateOfType<Search_MapViewState>();

    _checkCount = 0;
    for (int i = 0; i < _parent_ListView_length; i++) {
      if (parent?.checkboxValue_List[i] == true){
        _checkCount++;
      }
    }

    if (_checkCount == 0){
        _covert_checkCount = 0;
    } else { _covert_checkCount = _checkCount;}

    if(_parent_ListView_length == _covert_checkCount){
      _allCheckboxValue = true;
    } else {_allCheckboxValue = false;}


    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.symmetric(horizontal: BorderSide(color: Colors.grey, width: 0.5))
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Checkbox(
              value: _allCheckboxValue,
              onChanged: (value) {
                parent?.setState(() {
                  _parent_ListView_length = parent.checkboxValue_List.length;

                  for (int i = 0; i < _parent_ListView_length; i++) {
                    parent.checkboxValue_List[i] = value!;
                  }
                });
                setState(() {
                  _allCheckboxValue = value!;
                });
              },)),
          Expanded(
            flex: 8,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      AutoSizeText('총', minFontSize: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      AutoSizeText('${_parent_ListView_length}', minFontSize: 1, style: TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),),
                      AutoSizeText('개의 배송이 있습니다.', minFontSize: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ],
                  )
                ),
                Expanded(flex: 3, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText('[', minFontSize: 1, style: TextStyle(fontSize: 14),),
                    AutoSizeText('${_covert_checkCount}', minFontSize: 1, style: TextStyle(fontSize: 14, color: Colors.red),),
                    AutoSizeText('건 선택]', minFontSize: 1, style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: Icon(CupertinoIcons.chevron_down_square,),
                    onPressed: () {
                      mainParent?.setState(() {
                        mainParent.dropItemList_visible = false;
                      });
                    },
                  )
                )
              ],
            )),
        ],
      )
    );
  }
}



class DropItem_ListView extends StatefulWidget {
  final List<DropItem_List_decodeMap> convert_dropItemList;
  const DropItem_ListView({super.key, required this.convert_dropItemList});

  @override
  State<DropItem_ListView> createState() => DropItem_ListViewState();
}

class DropItem_ListViewState extends State<DropItem_ListView> {
  late List<DropItem_List_decodeMap> _convert_dropItemList = [];
  late List<bool> checkboxValue_List = [];
  // int _checkCount = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _convert_dropItemList.clear();
    _convert_dropItemList = widget.convert_dropItemList;


    _convert_dropItemList.forEach((element) {
      checkboxValue_List.add(false);
    });
    // for (int i = 0; i < _checkboxValue_List.length; i++) {
    //   if(_checkboxValue_List[i] == true){
    //     // _checkCount++;
    //   }
    // }

  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        minChildSize: 0.2,
        initialChildSize: 0.4,
        maxChildSize: 0.7,
        expand: false,
        builder: (context, scrollController) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropItem_Header(parent_ListView_length: _convert_dropItemList.length),
              Expanded(
                child: ListView.separated(
                    shrinkWrap: true,
                    controller: scrollController,
                    itemBuilder: (context, index) {
                      return Container(
                        height: 150,
                        color: Colors.white,
                        child: Row(
                          children: [
                            Expanded(flex: 2, child: Checkbox(value: checkboxValue_List[index], onChanged: (value) {
                              setState(() {
                                checkboxValue_List[index] = value!;
                                DropItem_HeaderState()._allCheckboxValue = false;
                              });
                            },)),
                            Expanded(
                              flex: 8,
                              child: Column(
                                children: [
                                    AutoSizeText('${_convert_dropItemList.elementAt(index).complexName}', minFontSize: 1, style: TextStyle(fontSize: 10),),
                                    AutoSizeText('${_convert_dropItemList.elementAt(index).detailAddress}', minFontSize: 1,style: TextStyle(fontSize: 10),),
                                    AutoSizeText('${_convert_dropItemList.elementAt(index).complexType}', minFontSize: 1,style: TextStyle(fontSize: 10),),
                                    Row(
                                      children: [
                                        AutoSizeText('${_convert_dropItemList.elementAt(index).boxType}', minFontSize: 1,style: TextStyle(fontSize: 10),),
                                        AutoSizeText('${_convert_dropItemList.elementAt(index).deliveryFee}', minFontSize: 1,style: TextStyle(fontSize: 10),),
                                      ],
                                    ),
                                    AutoSizeText('${_convert_dropItemList.elementAt(index).tagInfo}', minFontSize: 1,style: TextStyle(fontSize: 10),)
                                ],
                              ),
                            ),
                          ],
                        )
                      );
                    } ,
                    separatorBuilder: (context, index) => Divider(
                        height: 0.2,
                        color: Colors.grey,
                      ),
                    itemCount: _convert_dropItemList.length
                ),
              ),
            ],
          )
      // }
    );
  }
}