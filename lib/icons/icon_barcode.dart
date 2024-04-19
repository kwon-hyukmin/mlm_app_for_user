import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(child: BarcodeIcon()),
    ),
  ));
}

class BarcodeIcon extends StatelessWidget {
  const BarcodeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(6.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.indigo),
      child: Image.asset('assets/images/barcode.png'),
    );

    //     floatingActionButton: FloatingActionButton(
    //   onPressed: _incrementCounter,
    //   tooltip: 'Increment',
    //   child: const Icon(Icons.add),
  }
}
