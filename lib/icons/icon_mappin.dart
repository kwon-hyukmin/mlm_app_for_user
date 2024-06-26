import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: SizedBox(
            height: 100,
            width: 100,
            child: MapPinIcon(iConSize: 50,))),
        ),
      )
  );
}

class MapPinIcon extends StatelessWidget {
  final double iConSize;
  /// 아이콘의 크기 값을 변수로 받아와야 할 듯

  const MapPinIcon({required this.iConSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Color(0xFF009999)),
        child: Container(
          alignment: Alignment.center,
          child: Icon(Icons.signpost_sharp, color: Colors.white, size: iConSize,)
        )
    );

    //     floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
  }
}
