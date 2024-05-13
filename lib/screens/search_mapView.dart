

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';
import 'package:mlm_app_for_user/screens/userPickup.dart';
import 'package:intl/intl.dart';
import '../data/testData.dart';

void main() async {
  await NaverMapMlmApp_Initialize().initialize();
  Map<String, double> locationMap = await Location().getCurrentLocation();
  Map<String, double> rMarkerLocationMap = await M_Location().getCurrentLocation();

  runApp(Myapp(iLocationMap: locationMap, mLocationMap: rMarkerLocationMap,)

  );
}

class Myapp extends StatelessWidget {
  final Map<String, double> iLocationMap;
  final Map<String, double> mLocationMap;
  const Myapp({super.key, required this.iLocationMap, required this.mLocationMap});

  @override
  Widget build(BuildContext context) {

  Map<String, double> locationMap ={'Initial_latitude' : 37.494299, 'Initial_longitude' : 126.780446};
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF3366CC),
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
          selectedItemColor: const Color(0xFF3366CC),
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
  late Map<String, double> _initialLocation = {};
  bool dropItemListVisible = false;
  bool inAreaDropSummaryVisible = true;
  late List<Map<String, dynamic>> dropItemListMapData = [];
  List<DropItem_List_decodeMap> convertDropItemListMap = [];
  int intForecastIncome= 0;
  String stringTransForecastIncome = '0';
  var f = NumberFormat('###,###,###,###');

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
      convertDropItemListMap.add(DropItem_List_decodeMap.fromJson(element));
    });


  }


  @override
  Widget build(BuildContext context) {

    stringTransForecastIncome = f.format(intForecastIncome);

    return Stack(
      children: [
        Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                const Expanded(flex: 7, child: Placeholder()),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      const Expanded(child: SizedBox()),
                      const Expanded(child: AutoSizeText('예상수익', minFontSize: 1, maxFontSize: 100, style: TextStyle(fontSize: 20, color: CupertinoColors.activeBlue),)),
                      Expanded(child: Row(
                        children: [
                          Expanded(flex: 13, child: AutoSizeText(stringTransForecastIncome, minFontSize: 1, maxFontSize: 100, textAlign: TextAlign.right, style: const TextStyle(fontSize: 20, color: CupertinoColors.destructiveRed),)),
                          const Expanded(flex: 7, child: AutoSizeText('원', minFontSize: 1, maxFontSize: 100, textAlign: TextAlign.left, style: TextStyle(fontSize: 28, color: CupertinoColors.destructiveRed),)),
                        ],
                      )),
                      const Expanded(child: SizedBox())
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
          visible: inAreaDropSummaryVisible,
          child: Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(height: 50, color: Colors.white,
              child: InArea_DropSummary(),
            ),
          ),
        ),
        Visibility(visible: dropItemListVisible,
            child: Column(
              children: [
                Expanded(child: DropItem_ListView(convertDropItemList: convertDropItemListMap)),
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
  final int parentListViewLength;
  const DropItem_Header({super.key, required this.parentListViewLength});
  @override
  State<DropItem_Header> createState() => DropItem_HeaderState();
}

class DropItem_HeaderState extends State<DropItem_Header> {
  late bool _allCheckboxValue;
  late int _parentListViewLength;
  int _checkCount=0;
  int _covertCheckCount=0;

  @override
  Widget build(BuildContext context) {
    _allCheckboxValue = false;
    _parentListViewLength = widget.parentListViewLength;
    DropItem_ListViewState? parent = context.findAncestorStateOfType<DropItem_ListViewState>();
    Search_MapViewState? mainParent = context.findAncestorStateOfType<Search_MapViewState>();

    _checkCount = 0;
    for (int i = 0; i < _parentListViewLength; i++) {
      if (parent?._convertDropItemList[i].selectYn == true){
        _checkCount++;
      }
    }

    if (_checkCount == 0){
        _covertCheckCount = 0;
    } else { _covertCheckCount = _checkCount;}


    if(_parentListViewLength == _covertCheckCount){
      _allCheckboxValue = true;
    } else {_allCheckboxValue = false;}


    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
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
                  _parentListViewLength = parent._convertDropItemList.length;
                  for (int i = 0; i < _parentListViewLength; i++) {
                    parent._convertDropItemList[i].selectYn = value!;
                  }
                });
                setState(() {
                  _allCheckboxValue = value!;
                });
                //
                // mainParent?.setState(() {
                //   for(int i = 0; i < _parentListViewLength; i++ ){
                //     if(parent?._convertDropItemList[i].selectYn == true){
                //       mainParent.intForecastIncome = mainParent.intForecastIncome + parent!._convertDropItemList[i].deliveryFee!;
                //     }
                //   }
                // });

              },)),
          Expanded(
            flex: 8,
            child: Row(
              children: [
                Expanded(
                  flex: 7,
                  child: Row(
                    children: [
                      const AutoSizeText('총', minFontSize: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                      AutoSizeText('$_parentListViewLength', minFontSize: 1, style: const TextStyle(fontSize: 14, color: Colors.red, fontWeight: FontWeight.bold),),
                      const AutoSizeText('개의 배송이 있습니다.', minFontSize: 1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
                    ],
                  )
                ),
                Expanded(flex: 3, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AutoSizeText('[', minFontSize: 1, style: TextStyle(fontSize: 14),),
                    AutoSizeText('$_covertCheckCount', minFontSize: 1, style: const TextStyle(fontSize: 14, color: Colors.red),),
                    const AutoSizeText('건 선택]', minFontSize: 1, style: TextStyle(fontSize: 14),),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: IconButton(
                    icon: const Icon(CupertinoIcons.chevron_down_square,),
                    onPressed: () {
                      mainParent?.setState(() {
                        mainParent.dropItemListVisible = false;
                        mainParent.intForecastIncome = 0;
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
  final List<DropItem_List_decodeMap> convertDropItemList;
  const DropItem_ListView({super.key, required this.convertDropItemList});

  @override
  State<DropItem_ListView> createState() => DropItem_ListViewState();
}

class DropItem_ListViewState extends State<DropItem_ListView> {
  late List<DropItem_List_decodeMap> _convertDropItemList = [];
  // late List<bool> checkboxValueList = [];
  // int _checkCount = 0;

  void getForecastIncome(BuildContext context){
    Search_MapViewState? Parent = context.findAncestorStateOfType<Search_MapViewState>();
    Parent?.setState(() {
      Parent.intForecastIncome = 0;
      for(int i = 0; i < _convertDropItemList.length; i++ ){
        if(_convertDropItemList[i].selectYn == true){
          Parent.intForecastIncome = Parent.intForecastIncome + _convertDropItemList[i].deliveryFee!;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    _convertDropItemList = [];
    _convertDropItemList = widget.convertDropItemList;


    return DraggableScrollableSheet(
        minChildSize: 0.2,
        initialChildSize: 0.4,
        maxChildSize: 0.7,
        expand: false,
        builder: (context, scrollController) =>
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropItem_Header(parentListViewLength: _convertDropItemList.length),
              Expanded(
                child: Container(color: Colors.white,
                  child: ListView.separated(
                      shrinkWrap: true,
                      controller: scrollController,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 150,
                          color: Colors.white,
                          child: Row(
                            children: [
                              Expanded(flex: 2, child: Checkbox(value: _convertDropItemList[index].selectYn ?? false/*checkboxValueList[index]*/, onChanged: (value) {
                                setState(() {
                                  _convertDropItemList[index].selectYn = value!;
                                  // DropItem_HeaderState()._allCheckboxValue = false;
                                });
                                getForecastIncome(context);
                              },)),
                              Expanded(
                                flex: 8,
                                child: Column(
                                  children: [
                                      AutoSizeText('${_convertDropItemList.elementAt(index).complexName}', minFontSize: 1, style: const TextStyle(fontSize: 10),),
                                      AutoSizeText('${_convertDropItemList.elementAt(index).detailAddress}', minFontSize: 1,style: const TextStyle(fontSize: 10),),
                                      AutoSizeText('${_convertDropItemList.elementAt(index).complexType}', minFontSize: 1,style: const TextStyle(fontSize: 10),),
                                      Row(
                                        children: [
                                          AutoSizeText('${_convertDropItemList.elementAt(index).boxType}', minFontSize: 1,style: const TextStyle(fontSize: 10),),
                                          AutoSizeText('${_convertDropItemList.elementAt(index).deliveryFee}', minFontSize: 1,style: const TextStyle(fontSize: 10),),
                                        ],
                                      ),
                                      AutoSizeText('${_convertDropItemList.elementAt(index).tagInfo}', minFontSize: 1,style: const TextStyle(fontSize: 10),)
                                  ],
                                ),
                              ),
                            ],
                          )
                        );
                      } ,
                      separatorBuilder: (context, index) => const Divider(
                          height: 0.2,
                          color: Colors.grey,
                        ),
                      itemCount: _convertDropItemList.length
                  ),
                ),
              ),
            ],
          )
      // }
    );
  }
}