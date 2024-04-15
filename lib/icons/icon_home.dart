import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  double _BoxSize = 500;
  // _BoxSize= 500;

  runApp(
      const MaterialApp(
        home: Scaffold(
          body: Center(child: SizedBox(
              width: 100,
              height: 100,
              child: HomeIcon(iConSize: 70,))),
        ),
      )
  );
}

class HomeIcon extends StatelessWidget {
  final double iConSize;

  const HomeIcon({required this.iConSize, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Colors.indigo),
      child: Icon(Icons.home, color: Colors.white, size: iConSize,)
    );

    //     floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
  }
}
