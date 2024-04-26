import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mlm_app_for_user/data/naverMap_mlm.dart';

class PickupPoint_NaverMap extends StatelessWidget {
  // final List<double> initialLocation;
  final Map<String, double> initialLocation;
  PickupPoint_NaverMap({super.key, required this.initialLocation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Expanded(flex: 12, child: NaverMapMlmApp(initial_LocationMap: initialLocation)),
            Expanded(
              flex: 1,
              child: Container(
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.close_outlined, color: Colors.grey, )
                )
              )
            )
          ],
        ),
      ),
    );
  }
}
