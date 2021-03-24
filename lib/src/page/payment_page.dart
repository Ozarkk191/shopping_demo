import 'package:flutter/material.dart';
import 'package:test_work/src/page/credit_page.dart';
import 'package:test_work/src/page/qr_code_page.dart';
import 'package:test_work/src/widget/appbar/normal_appbar.dart';

class PaymentPage extends StatefulWidget {
  final double total;

  const PaymentPage({Key key, @required this.total}) : super(key: key);
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    var fullSizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        child: Container(
          width: fullSizeWidth,
          child: Column(
            children: [
              NormalAppbar(
                title: 'Payment',
              ),
              Container(
                width: fullSizeWidth,
                height: 50,
                margin: EdgeInsets.all(10),
                child: Text(
                    "This service is safe to use.The only risk is if anyone is literally looking at your screen while you use the application"),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CreditPage(
                        total: widget.total,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: fullSizeWidth,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Credit/DebitCard'),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QRCodePage(
                        total: widget.total,
                      ),
                    ),
                  );
                },
                child: Container(
                  width: fullSizeWidth,
                  height: 60,
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('QR Code'),
                      Icon(Icons.arrow_forward_ios_outlined),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
