import 'package:flutter/material.dart';
import 'package:test_work/src/widget/appbar/normal_appbar.dart';
import 'package:test_work/src/widget/button/main_button.dart';
import 'package:toast/toast.dart';

class QRCodePage extends StatefulWidget {
  final double total;

  const QRCodePage({Key key, @required this.total}) : super(key: key);
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    var fullSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              width: fullSizeWidth,
              child: Column(
                children: [
                  NormalAppbar(
                    title: 'Scan QR Code',
                  ),
                  Container(
                    width: fullSizeWidth,
                    height: fullSizeWidth,
                    margin: EdgeInsets.all(20),
                    color: Colors.white,
                    child: Center(
                      child: Image.asset(
                        'assets/images/qr.png',
                      ),
                    ),
                  ),
                  Container(
                    width: fullSizeWidth,
                    height: 60,
                    color: Colors.white,
                    child: Center(
                        child: Text('ยอดรวมทั้งหมด ${widget.total} บาท')),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  MainButton(
                    onTap: () {
                      Toast.show("ชำระเรียบร้อย", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    textButton: 'ยืนยัน',
                    borderRadius: 0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
