import 'package:flutter/material.dart';
import 'package:test_work/src/widget/appbar/normal_appbar.dart';
import 'package:test_work/src/widget/button/main_button.dart';
import 'package:test_work/src/widget/textfield/textfield_border_none.dart';
import 'package:toast/toast.dart';

class CreditPage extends StatefulWidget {
  final double total;

  const CreditPage({Key key, @required this.total}) : super(key: key);
  @override
  _CreditPageState createState() => _CreditPageState();
}

class _CreditPageState extends State<CreditPage> {
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
                    title: 'Credit/Debit Card',
                  ),
                  Container(
                    width: fullSizeWidth,
                    height: 40,
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Add Credit/Debit Card"),
                        Image.network(
                          'https://www.allmajestic.com/images/Paypal-4.png',
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: fullSizeWidth,
                    padding: EdgeInsets.all(10),
                    color: Colors.white,
                    child: Column(
                      children: [
                        TextFieldBorderNone(
                          width: fullSizeWidth,
                          hintText: 'Card Number',
                        ),
                        TextFieldBorderNone(
                          width: fullSizeWidth,
                          hintText: 'Cardholder Name',
                        ),
                        Row(
                          children: [
                            TextFieldBorderNone(
                              width: fullSizeWidth * 0.4,
                              hintText: 'Expiration (MM/YY)',
                            ),
                            TextFieldBorderNone(
                              width: fullSizeWidth * 0.2,
                              hintText: 'CVV',
                            ),
                          ],
                        ),
                        SizedBox(height: 20)
                      ],
                    ),
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
                      "ยอดรวม ${widget.total} บาท",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  MainButton(
                    onTap: () {
                      Toast.show("ชำระเรียบร้อย", context,
                          duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                    },
                    textButton: 'ชำระเงิน',
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
