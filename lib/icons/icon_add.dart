import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(child: AddIcon()),
      ),
    )
  );
}

class AddIcon extends StatelessWidget {
  const AddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Colors.indigo),
      child: const Icon(Icons.add, color: Colors.white),
    );
      
  //     floatingActionButton: FloatingActionButton(
  //   onPressed: _incrementCounter,
  //   tooltip: 'Increment',
  //   child: const Icon(Icons.add),
  }
}
