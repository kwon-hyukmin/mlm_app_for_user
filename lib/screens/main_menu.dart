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
        decoration: BoxDecoration(border: Border.all(color: Colors.blue, width: 5)),
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


//////////////////////////////////////////////////////////////
// 메인메뉴영역
class MenuArea extends StatelessWidget {
  const MenuArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,

      child: Column(

          children: [

            //////////////
            // 마이페이지, 로그아웃
            Expanded(
              flex: 2,
              child: Container(
                // width: double.infinity,
                //decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1)),
                  color: Colors.pink,   // 개발시 영역확인용
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Text('')), //Expanded(child: Placeholder()),
                      TextButton(onPressed: () { print('마이페이지'); }, child: Text('마이페이지', style: TextStyle( color: Colors.black),   )),
                      TextButton(onPressed: () { print('로그아웃'); }, child: Text('로그아웃' ,  style: TextStyle( color: Colors.black),  )),
                    ],
                  )
              ),
            ),


            //////////////
            // 지도로찾기, 단지로 찾기
            Expanded(
              flex: 4,
              child: Container(
                // width: double.infinity,
                //height: double.infinity,
                // decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
                color: Colors.grey,  // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('지도로 찾기', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                    ),
                    Expanded(
                        flex: 1,
                        child: Text('단지로 찾기', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                    ),
                  ],
                ),
              ),
            ),

            //////////////
            // 지역검색, 추천단지
            Expanded(
              flex: 4,
              child: Container(
                // width: double.infinity,
                // height: double.infinity,
                // decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
                color: Colors.yellow,  // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('지역 검색', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                    ),
                    Expanded(
                        flex: 1,
                        child: Text('추천 단지', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                    ),
                  ],
                ),
              ),
            ),

            //////////////
            // 우리집 등록
            Expanded(
              flex: 2,
              child: Container(
                // width: double.infinity,
                // height: double.infinity,
                // decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
                color: Colors.green,  // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('우리집 등록', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                    ),
                  ],
                ),
              ),
            ),


            //////////////
            // 자주 찾는 단지
            Expanded(
              flex: 2,
              child: Container(
                // width: double.infinity,
                // height: double.infinity,
                // decoration: BoxDecoration(border: Border.all(color: Colors.red, width: 1)),
                color: Colors.blue, // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text('자주 찾는 단지', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                    ),
                  ],
                ),
              ),
            ),

          ]


      ),


    );
  }
}

//////////////////////////////////////////////////////////////
// 광고영역
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


//////////////////////////////////////////////////////////////
// 맨 아래 얇은 indigo 색 배경같은 영역
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
