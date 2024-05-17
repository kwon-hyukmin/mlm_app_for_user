

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';
import 'package:mlm_app_for_user/screens/userPickup.dart';
import 'package:intl/intl.dart';
import '../data/naverMap_getAddress.dart';
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
              onTap: (value) {
                // await getAddress('126.780386,37.493935');
              }
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
  // bool inAreaDropSummaryVisible = true;
  late List<Map<String, dynamic>> dropItemListMapData = [];
  List<DropItem_List_decodeMap> convertDropItemListMap = [];
  int intForecastIncome= 0;
  String stringTransForecastIncome = '0';
  var f = NumberFormat('###,###,###,###');
  Map<String, dynamic>? nowAreaName;
  String strNowAreaName1 = '';
  String strNowAreaName2 = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initialLocation = widget.initialLocation!;
    // 초기 값이 없을때 자꾸 에러나서 강제로 임의값 셋팅 처리
    nowAreaName = { 'area1' : '_initial', 'area2' : '_initial', 'area3' : '_initial', 'area4' : '_initial'};
  }


  @override
  Widget build(BuildContext context) {
    stringTransForecastIncome = f.format(intForecastIncome);
    strNowAreaName1 = '[' + nowAreaName?['area1'] + ']';
    strNowAreaName2 = nowAreaName?['area2']+ ' ' + nowAreaName?['area3']+ ' ' + nowAreaName?['area4'];

    return Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                      border: BorderDirectional(bottom: BorderSide(color: Colors.grey, width: 0.5))
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 13,
                          child: Column(
                            children: [
                              Expanded(
                                flex : 7,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        strNowAreaName1,
                                        minFontSize: 1,
                                        presetFontSizes: [18, 10],
                                        maxFontSize: 20,
                                        style: const TextStyle(
                                            color: Colors.black54
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 10),
                                      width: double.infinity,
                                      alignment: Alignment.centerLeft,
                                      child: AutoSizeText(
                                        strNowAreaName2,
                                        minFontSize: 1,
                                        presetFontSizes: [20, 10],
                                        maxFontSize: 20,
                                        style: const TextStyle(
                                          color: Colors.black
                                          ),
                                        ),
                                    ),
                                  ],
                                )
                              ),
                              Expanded(
                                  flex : 3,
                                  child : Container()
                              )
                            ],
                          )
                      ),
                      Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              const Expanded(child: SizedBox()),
                              const Expanded(child: AutoSizeText('예상수익', minFontSize: 1, maxFontSize: 100, style: TextStyle(fontSize: 22, color: CupertinoColors.activeBlue),)),
                              Expanded(child: Row(
                                children: [
                                  Expanded(flex: 13, child: AutoSizeText(stringTransForecastIncome, minFontSize: 1, maxFontSize: 100, textAlign: TextAlign.right, style: const TextStyle(fontSize: 22, color: CupertinoColors.destructiveRed),)),
                                  const Expanded(flex: 7, child: AutoSizeText('원', minFontSize: 1, maxFontSize: 100, textAlign: TextAlign.left, style: TextStyle(fontSize: 22, color: CupertinoColors.destructiveRed),)),
                                ],
                              )),
                              const Expanded(child: SizedBox())
                            ],
                          )
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 17,
                  child: NaverMapMlmApp(initial_LocationMap: _initialLocation, use_Gestures_yn: true, zoom_level: 16)
              ),
            ],
          ),
          Visibility(visible: dropItemListVisible,
            child: Column(
              children: [
                Expanded(child: DropItem_ListView(convertDropItemList: convertDropItemListMap)),
              ],
            ),
          ),
          const Positioned(
            bottom: 20,
            right: 20,
            child: DeliveryReservationButton()
          )
        ]
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
                    mainParent?.setState(() {
                      mainParent.intForecastIncome = 0;
                      for(int i = 0; i < _parentListViewLength; i++ ){
                        if(parent?._convertDropItemList[i].selectYn == true){
                          mainParent.intForecastIncome = mainParent.intForecastIncome + parent!._convertDropItemList[i].deliveryFee!;
                        } else {mainParent.intForecastIncome = 0;}
                      }
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


class DeliveryReservationButton extends StatefulWidget {
  const DeliveryReservationButton({super.key});

  @override
  State<DeliveryReservationButton> createState() => _DeliveryReservationButtonState();
}

class _DeliveryReservationButtonState extends State<DeliveryReservationButton> {
  late Widget buttonIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonIcon = DeliveryReservationButtonDefult();
  }

  @override
  Widget build(BuildContext context) {

    double screenSize = 0;
    double locationHeightSnackBar = 0;
    bool test = false;

    return InkWell(
      child: buttonIcon,
      onTapDown: (details) => setState(() {buttonIcon = DeliveryReservationButtonOnPress();}),
      onTapUp: (details) => setState(() {buttonIcon = DeliveryReservationButtonDefult();}),
      onTap: () {
        screenSize = MediaQuery.of(context).size.height;
        locationHeightSnackBar = screenSize/2.5;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Reservation Completde!!'), //snack bar의 내용. icon, button같은것도 가능하다.
            duration: const Duration(seconds: 5), //올라와있는 시간
            action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
              label: '닫기', //버튼이름
              onPressed: (){}, //버튼 눌렀을때.
            ),
            behavior: SnackBarBehavior.floating,
            // dismissDirection: DismissDirection.up,
            margin: EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - locationHeightSnackBar,
                left: 10,
                right: 10),
          )
        );
      },
    );
  }
}

class DeliveryReservationButtonDefult extends StatelessWidget {
  const DeliveryReservationButtonDefult({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: const Color(0xFF3366CC),
      ),
      height: 60,
      width: 60,
      child: const Icon(Icons.add, color: Colors.white, size: 30,),
    );
  }
}

class DeliveryReservationButtonOnPress extends StatelessWidget {
  const DeliveryReservationButtonOnPress({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      height: 60,
      width: 60,
      child: const Icon(Icons.add, color: Color(0xFF3366CC), size: 30,),
    );
  }
}



// 나중에 하기로..
// class InArea_DropSummary extends StatefulWidget {
//   InArea_DropSummary({super.key});
//
//   @override
//   State<InArea_DropSummary> createState() => InArea_DropSummaryState();
// }
//
// class InArea_DropSummaryState extends State<InArea_DropSummary> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 50,
//       decoration: const BoxDecoration(
//           border: Border.symmetric(
//               horizontal: BorderSide(width: 0.5, color: Colors.grey)),
//           color: Colors.white),
//       child: Row(
//         children: [
//           Expanded(
//               child: Container(
//                 decoration: const BoxDecoration(
//                     border: Border(
//                         right: BorderSide(width: 0.5, color: Colors.grey))),
//                 child: const Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     AutoSizeText('data_title_1', textAlign: TextAlign.right),
//                     AutoSizeText(
//                       'data',
//                       textAlign: TextAlign.left,
//                       style: TextStyle(
//                           color: Colors.red, fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//           ),
//           const Expanded(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 // crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   AutoSizeText('data_title_2', textAlign: TextAlign.right),
//                   AutoSizeText(
//                     'data',
//                     textAlign: TextAlign.left,
//                     style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               )
//           ),
//         ],
//       ),
//     );
//   }
// }