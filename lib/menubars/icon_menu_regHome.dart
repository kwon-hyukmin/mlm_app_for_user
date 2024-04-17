import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mlm_app_for_user/icons/icon_home.dart';

void main(){
  runApp(
  MaterialApp(
    home: Scaffold(
      body: Center(
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color(0xFF009999)),
              width: 300,
              height: 70,
              child: const RegHome_menuIcon(iConSize: 40))),
    ),
  ));
}

class RegHome_menuIcon extends StatelessWidget {
  final double iConSize;
  /// 아이콘의 크기 값을 변수로 받아와야 할 듯

  const RegHome_menuIcon({required this.iConSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xFF003399)),
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Center(
                  child: HomeIcon(iConSize: iConSize,),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const AutoSizeText(
                      '우리집 등록',
                      minFontSize: 1,
                      maxFontSize: 100,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                )
            ),
          ],
        )
    );
  }
}


