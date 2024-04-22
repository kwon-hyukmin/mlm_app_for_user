import 'package:flutter/material.dart';

// import '../icons/icon_apartment.dart';

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
                //   color: Colors.pink,   // 개발시 영역확인용
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Expanded(child: Text('')), //Expanded(child: Placeholder()),
                      TextButton(onPressed: () { print('마이페이지'); }, child: Text('마이페이지', style: TextStyle( color: Colors.black),   )),
                      TextButton(onPressed: () { print('로그아웃'); }, child: Text('로그아웃' ,  style: TextStyle( color: Colors.black),  )),
                      // InkWell(
                      //   onTap: () {print('마이페이지');},
                      //   child: Text('마이페이지', style: TextStyle( color: Colors.black),   )
                      // ),
                      // InkWell(
                      //     onTap: () {print('로그아웃');},
                      //   child: Text('로그아웃' ,  style: TextStyle( color: Colors.black),  )
                      // ),
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
                // color: Colors.grey,  // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        //child: Text('지도로 찾기', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                        child: Container(
                          // padding: const EdgeInsets.symmetric(vertical: 5),
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: const Color(0xFF003399)),
                          child: Column(
                            children: [
                              Icon(Icons.location_on_sharp, color: Colors.white, size: 90,),
                              Text('지도로 찾기', style: TextStyle( color: Colors.white,), textAlign: TextAlign.center, )
                            ],
                          )
                        ),
                    ),
                    Expanded(
                        flex: 1,
                      //margin: const EdgeInsets.symmetric(horizontal: 30),
                        // child: Text('단지로 찾기', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )

                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Color(0xFF3366CC)),
                          child: Column(
                            children: [
                              Icon(Icons.apartment, color: Colors.white, size: 90,),
                              Text('단지로 찾기', style: TextStyle( color: Colors.white,), textAlign: TextAlign.center, )
                            ],
                          ),
                        ),
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
                // color: Colors.yellow,  // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      //child: Text('지역 검색', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Color(0xFF009999)),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              child: Icon(Icons.signpost_sharp, color: Colors.white, size: 90,)
                            ),
                            Text('지역 검색', style: TextStyle( color: Colors.white,), textAlign: TextAlign.center, )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      //child: Text('추천 단지', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20 ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Color(0xFF008080)),
                        child: Column(
                          children: [
                            Text('A I', style: TextStyle( color: Colors.white, fontSize: 60), textAlign: TextAlign.center, ),
                            Text('추천단지', style: TextStyle( color: Colors.white,), textAlign: TextAlign.center, ),
                          ],
                        ),
                      ),
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
                // color: Colors.green,  // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      //child: Text('우리집 등록', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5 ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Colors.indigo ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.other_houses, color: Colors.white, size: 50,),
                            SizedBox(width: 30, height: 60,),
                            Text('우리집 등록', style: TextStyle( color: Colors.white, fontSize: 25), textAlign: TextAlign.center, ),
                          ],
                        ),
                      ),
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
                // color: Colors.blue, // 개발시 영역확인용
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      //child: Text('자주 찾는 단지', style: TextStyle( color: Colors.black,), textAlign: TextAlign.center, )
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5 ),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(0), color: Colors.blueAccent ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 50,),
                            SizedBox(width: 10, height: 60,),
                            Text('자주 찾는 단지', style: TextStyle( color: Colors.white, fontSize: 25), textAlign: TextAlign.center, ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Expanded(
            //   flex: 1,
            //   child: SizedBox(width: 1, height: 1,),
            // ),

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
      // margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      width: double.infinity,
      height: double.infinity,
      color: Colors.lightBlueAccent,
      child: const Center(
        child: Text(
            'Advertise Area',
            style: TextStyle(color: Colors.grey, fontSize: 50, fontWeight: FontWeight.bold)
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
