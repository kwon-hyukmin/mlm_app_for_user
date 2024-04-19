import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text(
          'Micro Last Mile Title',
          style: TextStyle( fontSize: 30, color: Colors.white ) ,
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(border: Border.all(color: Colors.green, width: 3)),
        child: Column(
          children: [
            Expanded( flex: 80, child: MenuArea()),
            Expanded( flex: 20, child: AdArea()),
            Expanded( flex: 2, child: BottomBackGrd()),
          ],
        ),
      ),
    ),
  ));
}

class MenuArea extends StatelessWidget {
  const MenuArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      ///////////////////////////////////////////////////////

      child: Column(

          children: [
            Container(
              width: double.infinity,
              //height: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
            ),
            Container(
              width: double.infinity,
              // height: double.infinity,
              decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 3)),
            ),
          ]


      ),

      ///////////////////////////////////////////////////////
    );
  }
}

class AdArea extends StatelessWidget {
  const AdArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightGreen,
      child: const Center(
        child: Text(
            'Advertise Area',
            style: TextStyle(color: Colors.lime, fontSize: 50)
        ),
      ),
    );
  }
}

class BottomBackGrd extends StatelessWidget {
  const BottomBackGrd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.indigo,
    );
  }
}
