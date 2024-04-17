import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'common_icon_container.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
          child: SizedBox(
              width: 200,
              height: 200,
              child: IconCircleContainer(
                icon: Icons.add,
                innerColor: Colors.blue,
                outerColor: Colors.green,
              ))),
    ),
  ));
}
