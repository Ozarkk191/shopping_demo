import 'package:flutter/material.dart';
import 'package:test_work/src/widget/button/main_button.dart';
import 'package:test_work/src/widget/textfield/field.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  @override
  Widget build(BuildContext context) {
    var _widthField = MediaQuery.of(context).size.width * 0.8;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('รายละเอียดการจัดส่ง'),
        // leading: InkWell(
        //   onTap: () {

        //   },
        //   child: Icon(Icons.arrow_back),
        // ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Field(
                  width: _widthField,
                  text: 'ชื่อ-สกุล',
                ),
                Field(
                  width: _widthField,
                  text: 'ที่อยู่บรรทัดที่ 1',
                ),
                Field(
                  width: _widthField,
                  text: 'อำเภอ',
                ),
                Field(
                  width: _widthField,
                  text: 'จังหวัด',
                ),
                Field(
                  width: _widthField,
                  text: 'รหัส',
                ),
                Container(
                  width: _widthField,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Field(
                          width: MediaQuery.of(context).size.width * 0.6,
                          text: 'เบอร์มือถือ',
                        ),
                      ),
                      MainButton(
                        onTap: () {},
                        textButton: 'รับ OTP',
                        borderRadius: 0,
                      )
                    ],
                  ),
                ),
                Field(
                  width: _widthField,
                  text: 'OTP',
                ),
                MainButton(
                  onTap: () {},
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
