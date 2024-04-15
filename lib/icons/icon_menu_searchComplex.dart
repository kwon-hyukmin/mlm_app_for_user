import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'icon_apartment.dart';

void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(child: Container(
              width: 100,
              height: 100,
              child: SearchComplex_menuIcon(iConSize: 60,))),
        ),
      )
  );
}

class SearchComplex_menuIcon extends StatelessWidget {
  final double iConSize;
  /// 아이콘의 크기 값을 변수로 받아와야 할 듯

  const SearchComplex_menuIcon({required this.iConSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFF3366CC)),
        child: Column(
          children: [
            Expanded(flex: 3, child: ApartmentIcon(iConSize: iConSize,)),
            Expanded(flex: 1,child: AutoSizeText(
              '단지로 찾기', minFontSize: 1,
              maxFontSize: 100,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
            ),
          ],
        )
    );
  }
}


