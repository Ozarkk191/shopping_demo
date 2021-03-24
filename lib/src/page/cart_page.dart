import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_work/model/address_model.dart';
import 'package:test_work/model/cart_model.dart';
import 'package:test_work/model/product_model.dart';
import 'package:test_work/src/page/address_page.dart';
import 'package:test_work/src/page/payment_page.dart';
import 'package:test_work/src/page/product_detail.dart';
import 'package:test_work/src/widget/button/main_button.dart';
import 'dart:convert';

import 'package:toast/toast.dart';

class CartPage extends StatefulWidget {
  final Product product;

  const CartPage({Key key, @required this.product}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int badge = 0;
  double total = 0;
  double sum = 0;
  String checkAddress = "ไม่มี";

  Future<List<CartModel>> getCartSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> _cartStringList = <String>[];
    List<CartModel> _cartList = <CartModel>[];

    var _badge = prefs.getInt('badge') ?? 0;
    badge = _badge;

    checkAddress = prefs.getString('address') ?? 'ไม่มี';
    if (checkAddress != "ไม่มี") {
      final data = await json.decode(checkAddress);
      var address = AddressModel.fromJson(data);
      checkAddress =
          "${address.name}\n${address.address}\n${address.code}\n${address.phone}\n";
      log(checkAddress);
    }

    _cartStringList = prefs.getStringList('cart');
    if (_cartStringList != null) {
      for (var i = 0; i < _cartStringList.length; i++) {
        final data = await json.decode(_cartStringList[i]);
        var cart = CartModel.fromJson(data);
        _cartList.add(cart);
      }
    }

    return _cartList;
  }

  saveCartSf(List<CartModel> cartList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> cartStringList = <String>[];
    for (var i = 0; i < cartList.length; i++) {
      cartStringList.add(jsonEncode(cartList[i].toJson()).toString());
    }
    badge = badge - 1;
    prefs.setInt('badge', badge);

    prefs.setStringList('cart', cartStringList);
    Toast.show("ลบของจากรถเข็นแล้ว", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text('รถเข็น'),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetail(
                  product: widget.product,
                ),
              ),
            );
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.only(bottom: 60),
                child: Column(
                  children: [
                    _address(
                      width: MediaQuery.of(context).size.width,
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressPage(
                              product: widget.product,
                            ),
                          ),
                        );
                      },
                    ),
                    FutureBuilder(
                      future: getCartSF(),
                      builder: (BuildContext context,
                          AsyncSnapshot<dynamic> snapshot) {
                        if (snapshot.hasData) {
                          sum = 0;
                          List<CartModel> arr = snapshot.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: arr.length,
                            itemBuilder: (BuildContext context, int index) {
                              var discount = arr[index].discount * 100;
                              var price = arr[index].productPrice -
                                  (arr[index].productPrice *
                                      arr[index].discount);
                              sum = sum + price;
                              return Card(
                                clipBehavior: Clip.hardEdge,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                  child: Row(
                                    children: [
                                      Card(
                                        clipBehavior: Clip.hardEdge,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Image.network(
                                          arr[index].productImg,
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              arr[index].description,
                                              style: TextStyle(fontSize: 10),
                                            ),
                                            SizedBox(height: 5),
                                            Row(
                                              children: [
                                                discount != 0.0
                                                    ? Text(
                                                        "฿ ${arr[index].productPrice}",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.grey,
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                        ),
                                                      )
                                                    : Text(
                                                        "฿ ${arr[index].productPrice}",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.red,
                                                        ),
                                                      ),
                                                SizedBox(width: 5),
                                                discount != 0.0
                                                    ? Text(
                                                        "฿ $price",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          color: Colors.red,
                                                        ),
                                                      )
                                                    : Container(),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          sum = sum - price;
                                          arr.removeAt(index);
                                          setState(() {});
                                          saveCartSf(arr);
                                        },
                                        child: Center(
                                          child:
                                              Icon(Icons.delete_forever_sharp),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else {
                          return Container(
                            child: Center(
                              child: Text("ไม่มีสินค้าในรถเข็นของคุณ"),
                            ),
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
            sum == 0
                ? Align(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text("ไม่มีสินค้าในรถเข็นของคุณ"),
                    ),
                  )
                : Container(),
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
                        "รวมราคาทั้งหมด $sum บาท",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    MainButton(
                      onTap: () {
                        if (checkAddress == "ไม่มี") {
                          Toast.show("กรุณากรอกที่อยู่", context,
                              duration: Toast.LENGTH_SHORT,
                              gravity: Toast.BOTTOM);
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentPage(
                                        total: sum,
                                      )));
                        }
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
      ),
    );
  }

  Container _address({double width, Function onTap}) {
    return Container(
      width: width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ที่อยู่สำหรับจัดส่ง',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '$checkAddress',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
            ],
          ),
          InkWell(
            onTap: onTap,
            child: Icon(Icons.edit),
          ),
        ],
      ),
    );
  }
}
