import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../icons/icon_mappin.dart';

void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xFF009999)),
              width: 120,
              height: 120,
              child: SearchArea_menuIcon(iConSize: 60,))),
        ),
      )
  );
}

class SearchArea_menuIcon extends StatelessWidget {
  final double iConSize;
  /// 아이콘의 크기 값을 변수로 받아와야 할 듯

  const SearchArea_menuIcon({required this.iConSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xFF009999)),
        child: Column(
          children: [
            Expanded(flex: 4, child: MapPinIcon(iConSize: iConSize,)),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: const AutoSizeText(
                    '지역 검색',
                    minFontSize: 1,
                    maxFontSize: 100,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                )
            ),
          ],
        )
    );
  }
}


