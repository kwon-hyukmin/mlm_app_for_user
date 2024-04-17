import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'icon_apartment.dart';
import 'icon_locate_Indicator.dart';

void main(){
  runApp(
      MaterialApp(
        home: Scaffold(
          body: Center(
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Color(0xFF003399) ),
                // color: Colors.red/*Color(0xFF003399)*/,
                padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 1),
                child: /*Container(color: Colors.blue,)*/SearchComplex_menuIcon(iConSize: 60,)
              )
          ),
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: const Color(0xFF003399)),
        child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex:1,
                    child:
                    Container(
                      // color: Colors.yellow,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                        )
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child:
                    Container(
                      // color: Colors.yellow,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                        )
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child:
                    Container(
                      // color: Colors.yellow,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                        )
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child:
                    Container(
                      // color: Colors.yellow,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                        )
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child:
                    Container(
                      // color: Colors.yellow,
                        decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                        )
                    ),
                  ),
                ]
              ),
              Row(
                  children: [
                    Expanded(
                      flex:1,
                      child:
                      Container(
                        // color: Colors.yellow,
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                          )
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child:
                      Container(
                        // color: Colors.yellow,
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                          )
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child:
                      Container(
                        // color: Colors.yellow,
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                          )
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child:
                      Container(
                        // color: Colors.yellow,
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                          )
                      ),
                    ),
                    Expanded(
                      flex:1,
                      child:
                      Container(
                        // color: Colors.yellow,
                          decoration: BoxDecoration(border: Border.all(color: const Color(0xFF4472C4)),
                          )
                      ),
                    ),
                  ]
              ),
              Column(
                children: [
                const Expanded(flex: 4, child: Icon(Icons.location_on_sharp, color: Colors.white, size: 60,)/*MapIndicatorIcon(iConSize: iConSize,)*/),
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      child: const AutoSizeText(
                        '지도로 찾기',
                        minFontSize: 1,
                        maxFontSize: 100,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    )
                ),
              ],
            ),
        ])
    );
  }
}


