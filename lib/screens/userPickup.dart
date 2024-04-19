import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mlm_app_for_user/icons/common_icon_container.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Micro Last Mile Title', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
      ),
      body: const UserPickUp(
          pickPointAdd: '부평구 그랑힐스 아파트 204동',
          mapUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fcafefiles.naver.net%2FMjAyMDAxMDdfMjUw%2FMDAxNTc4Mzc1MjczMjE2.omnVdXiux0b3UpOKPtP0E_9IhYEu2NopQxRn8lFOW5Ig.yWBxCtGxKUkFA_EvGnpO5X3idD7k71YbQF17_CTwdA0g.JPEG%2FScreenshot_20200107-143049_NAVER.jpg&type=a340',
          pickupImgUrl: 'https://search.pstatic.net/common/?src=http%3A%2F%2Fblogfiles.naver.net%2FMjAyMTA3MDhfMTkw%2FMDAxNjI1NzA4NTU4MDk5.VGnPEqOJ1Z8F51ZcH49uuCH7-Czk7Xdbqzy3SdWDTdsg.ajf5-CoEEYuKpKS-DvGIK_OCUosGgmwA7EDmopcD1d4g.JPEG.ykj4708%2FKakaoTalk_20210708_103656329_01.jpg&type=a340',
          pickupInfomation: '지하1층 204동 출입구 앞 펜스 안쪽에서 픽업 바랍니다.',
          pickupInfomationDetail: '주차구역번호 B1C4',
          csNumber: '1588-9999',
          totalCount: 23,
          leftCount: 22,
          pickupList: [{"invoiceNo" : "1111-****-***-1234",
                       "deliveryCoo" : 'CJ대한통은',
                       "address" : "e편한세상 부평그랑힐스",
                       "detailAddress" : '104동 101호',
                       "deliveryFee" : 300,
                       "pickupState" : 0
                      },
                      {"invoiceNo" : "1111-****-***-1234",
                        "deliveryCoo" : 'CJ대한통은',
                        "address" : "Xi 그랜드써밋",
                        "detailAddress" : '101동 101호',
                        "deliveryFee" : 500,
                        "pickupState" : 1
                      }]
      ),
    ),
  ));
}

class UserPickUp extends StatefulWidget {
  final String pickPointAdd;
  final String mapUrl; /*네이버 지도 Api로 변경 해야 함*/
  final String pickupImgUrl; /*이미지 리스트로 변경??, 다음 상세화면에서 변경??*/
  final String pickupInfomation;
  final String pickupInfomationDetail;
  final String csNumber;
  final int totalCount;
  final int leftCount;
  final List<Map<String, dynamic>> pickupList;

  const UserPickUp(
      {super.key,
      required this.pickPointAdd,
      required this.mapUrl,
      required this.pickupImgUrl,
      required this.pickupInfomation,
      required this.pickupInfomationDetail,
      required this.csNumber,
      required this.totalCount,
      required this.leftCount,
      required this.pickupList
      });

  @override
  State<UserPickUp> createState() => _UserPickUpState();
}

class _UserPickUpState extends State<UserPickUp> {
  late int _leftCount;

  // late int _pickupState;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _leftCount = widget.leftCount;
    print(widget.pickupList[0]);
    print(widget.pickupList[1]);
    // _pickupState = widget.pickupList[_element['pickupList']];
  }


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            /*픽업 포인트 주소 컨테이너*/
            SizedBox(
              height: 50,
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(color: Colors.grey))
                  ),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: AutoSizeText(
                  widget.pickPointAdd,
                  minFontSize: 1,
                  maxFontSize: 100,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black54),
                )
              ),
            ),
            /*픽업 포인트 상세 사진 컨테이너*/
            SizedBox(
              height: 150,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(widget.mapUrl, fit: BoxFit.fill,),
                  ),
                  Expanded(
                    flex: 1,
                    child: Image.network(widget.pickupImgUrl, fit: BoxFit.fill, ),
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border.symmetric(horizontal: BorderSide(color: Colors.grey))
              ),
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                children: [
                  Expanded(child: Container(alignment: Alignment.centerLeft, child: AutoSizeText(widget.pickupInfomation, textAlign: TextAlign.left,))),
                  Expanded(child: Container(alignment: Alignment.centerLeft, child: AutoSizeText('(${widget.pickupInfomationDetail})', textAlign: TextAlign.left))),
                  Expanded(child: Container(alignment: Alignment.centerLeft, child: AutoSizeText('고객센터 문의: ${widget.csNumber}', textAlign: TextAlign.left, style: const TextStyle(color: CupertinoColors.systemBlue),))),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              height: 30,
              child: Row(
                children: [
                  Expanded(flex: 8, child: AutoSizeText('$_leftCount개의 픽업이 남았습니다.', style: const TextStyle(fontWeight: FontWeight.bold),)),
                  Expanded(flex: 2, child: AutoSizeText('[ 총 ${widget.totalCount}건 ]'))
                ],
              ),
            ),
            Container(color: Colors.brown, height: 300, child: PickUpList(pickupList: ['111', '1'],),),
            Container(color: Colors.purple, height: 300,),
          ],
        ),
      ),
        const Column(
          children: [
            Expanded(flex: 8, child: SizedBox(child: SizedBox.shrink(),)),
            Expanded(
              flex: 1,
              child: Row(
                children: [
                  Expanded(flex: 20, child: SizedBox(child: SizedBox.shrink(),)),
                  Expanded(
                    flex: 4,
                    child:
                    // IconButton(
                    //   icon: Icon(Icons.add_alarm)
                      //IconCircleContainer(innerColor: Colors.white, outerColor: Color(0xFF003399), icon: CupertinoIcons.barcode,),
                      // onPressed: () => {print('1');},
                      //   )
                      // ),
                    //
                    SizedBox(
                        height: 60,
                        // width: 5,
                        child: IconCircleContainer(innerColor: Colors.white, outerColor: Color(0xFF003399), icon: CupertinoIcons.barcode,)
                    ),),
                  Expanded(flex: 1, child: SizedBox(child: SizedBox.shrink(),)),
                ],
              ),
            ),
            Expanded(flex: 1, child: SizedBox(child: SizedBox.shrink(),)),
          ],
        )
    ]
    );
  }
}

class PickUpList extends StatelessWidget {
  final List<String> pickupList;
  const PickUpList({super.key, required this.pickupList});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _getInputs()
    );
  }

  List<Widget> _getInputs(){
    List<Widget> textWidgetList = [];
    pickupList.forEach((element) {
      textWidgetList.add(Text(element));
    });
    return textWidgetList;
  }
}



