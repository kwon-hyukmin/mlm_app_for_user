import 'package:flutter/material.dart';
import 'package:flutter_qr_bar_scanner/qr_bar_scanner_camera.dart';
import 'package:flutter_beep/flutter_beep.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:wakelock/wakelock.dart';

class QrBarCode_Reader extends StatefulWidget {
  QrBarCode_Reader({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _QrBarCode_ReaderState createState() => _QrBarCode_ReaderState();
}

class _QrBarCode_ReaderState extends State<QrBarCode_Reader> {
  String? _qrInfo = '스캔하세요';
  bool _canVibrate = true;
  bool _camState = false;

  @override
  void initState() {
    super.initState();
    _init();
  }

  /// 초기화 함수
  _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      // 화면 꺼짐 방지
      Wakelock.enable();

      // QR 코드 스캔 관련
      _camState = true;

      // 진동 관련
      _canVibrate = canVibrate;
      _canVibrate
          ? debugPrint('This device can vibrate')
          : debugPrint('This device cannot vibrate');
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// QR/Bar Code 스캔 성공시 호출
  _qrCallback(String? code) {
    setState(() {
      // 동일한걸 계속 읽을 경우 한번만 소리/진동 실행..
      if (code != _qrInfo) {
        FlutterBeep.beep(); // 비프음
        if (_canVibrate) Vibrate.feedback(FeedbackType.heavy); // 진동
      }
      _camState = false;
      _qrInfo = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 300,
            width: double.infinity,
            child: QRBarScannerCamera(
              // 에러 발생시..
              onError: (context, error) => Text(
                error.toString(),
                style: TextStyle(color: Colors.red),
              ),
              // QR 이 읽혔을 경우
              qrCodeCallback: (code) {
                _qrCallback(code);
              },
            ),
          ),
          /// 사이즈 자동 조절을 위해 FittedBox 사용
          FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(_qrInfo!, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),)
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('닫기', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),))
        ],
      );
  }
}