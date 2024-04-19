import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconCircleContainer extends StatelessWidget {
  final Color? innerColor;
  final Color? outerColor;
  final IconData? icon;

  const IconCircleContainer({super.key, tis, this.innerColor, this.outerColor, this.icon});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Container(
          padding: EdgeInsets.symmetric(vertical: (constraints.biggest.height)/6, horizontal: (constraints.biggest.height)/6),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100), color: outerColor),
          child: LayoutBuilder(
            builder: (context, constraints) => Icon(
              icon,
              color: innerColor,
              size: constraints.biggest.height,
            ),
          )),
    );
  }
}