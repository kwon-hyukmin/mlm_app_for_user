import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: SizedBox(
              width: 100,
              height: 100,
              child: StarIcon(iConSize: 70,))),
        ),
      )
  );
}

class StarIcon extends StatelessWidget {
  final double iConSize;
  /// 아이콘의 크기 값을 변수로 받아와야 할 듯

  const StarIcon({required this.iConSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: const Color(0xFF2E75B6)),
        child: Icon(Icons.star, color: Colors.white, size: iConSize,)
    );

    //     floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
  }
}
