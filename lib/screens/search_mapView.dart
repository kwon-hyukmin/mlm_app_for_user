
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
  bool visible = false;
  // late NOverlayImage nOverlayImage;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _initialLocation = widget.initialLocation!;
    _markerLocation = widget.markerLocation;
    container_height = 250;
    visible = true;
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
          child: DropList_Title(container_height: container_height, visible: this.visible,),
        )
      ]
    );
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


class DropList_Title extends StatefulWidget {
  final double container_height;
  final bool visible;
  DropList_Title({super.key, required this.container_height, required this.visible});

  @override
  State<DropList_Title> createState() => DropList_TitleState();
}

class DropList_TitleState extends State<DropList_Title> {
  // late bool _visible;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //
  //   // _visible = widget.visible;
  // }

  // @override
  // void setState(VoidCallback fn) {
  //   // TODO: implement setState
  //   super.setState(fn);
  //
  //   _visible = widget.visible;
  //   print('visible : $_visible');
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: Container(
                decoration: BoxDecoration(border: Border(right: BorderSide(width: 0.5, color: Colors.grey))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AutoSizeText('data_title_1', textAlign: TextAlign.right),
                    AutoSizeText(' data', textAlign: TextAlign.left, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                  ],
                ),
              )),
              Expanded(child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AutoSizeText('data_title_2', textAlign: TextAlign.right),
                  AutoSizeText(' data', textAlign: TextAlign.left, style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),),
                ],
              )),
            ],
          ),
          Visibility(
            maintainAnimation: bool.hasEnvironment('name'),
            visible: widget.visible,
            child: Container(height: 100, color: Colors.green),)
        ],
      ),
      height: widget.container_height,
      decoration: BoxDecoration(
          border: Border.symmetric(horizontal: BorderSide(width: 0.5, color: Colors.grey)),
          color: Colors.white
      ),
    );
  }
}
