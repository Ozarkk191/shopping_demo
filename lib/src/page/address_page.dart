import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_work/model/address_model.dart';
import 'package:test_work/model/product_model.dart';

import 'package:test_work/src/page/cart_page.dart';
import 'package:test_work/src/widget/button/main_button.dart';
import 'package:test_work/src/widget/textfield/field.dart';
import 'package:toast/toast.dart';

class AddressPage extends StatefulWidget {
  final Product product;

  const AddressPage({Key key, @required this.product}) : super(key: key);
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    code.dispose();
    phone.dispose();
    super.dispose();
  }

  bool check() {
    if (name.text == "") {
      return false;
    } else if (address.text == "") {
      return false;
    } else if (code.text == "") {
      return false;
    } else if (phone.text == "") {
      return false;
    } else {
      return true;
    }
  }

  Future<void> saveCartSf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var addr = AddressModel(
      name: name.text,
      address: address.text,
      code: code.text,
      phone: phone.text,
    );
    prefs.setString('address', jsonEncode(addr));
    Toast.show("บันทึกเรียบร้อย", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => CartPage(
          product: widget.product,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _widthField = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('รายละเอียดการจัดส่ง'),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => CartPage(
                  product: widget.product,
                ),
              ),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                Field(
                  controller: name,
                  width: _widthField,
                  text: 'ชื่อ-สกุล',
                ),
                Field(
                  controller: address,
                  width: _widthField,
                  text: 'ที่อยู่',
                ),
                Field(
                  controller: code,
                  width: _widthField,
                  text: 'รหัสไปรษณีย์',
                ),
                Container(
                  width: _widthField,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Field(
                          controller: phone,
                          width: MediaQuery.of(context).size.width * 0.6,
                          text: 'เบอร์มือถือ',
                        ),
                      ),
                      MainButton(
                        onTap: () {
                          Toast.show("ยังไม่มี OTP", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        },
                        textButton: 'รับ OTP',
                        borderRadius: 0,
                      )
                    ],
                  ),
                ),
                Field(
                  width: _widthField,
                  enable: false,
                  text: 'OTP',
                ),
                MainButton(
                  onTap: check()
                      ? () {
                          saveCartSf();
                        }
                      : null,
                  textButton: 'ยืนยัน',
                  width: _widthField,
                  borderRadius: 0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
