import 'package:flutter/material.dart';
import 'package:test_work/model/product_model.dart';
import 'package:test_work/src/widget/banner/banner.dart';
import 'package:test_work/src/widget/button/main_button.dart';
import 'package:toast/toast.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key key, @required this.product}) : super(key: key);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  double discount;
  double discountPrice;
  double eco;
  bool fav = false;
  @override
  void initState() {
    discount = widget.product.discount * 100;
    discountPrice = widget.product.productPrice -
        (widget.product.productPrice * widget.product.discount);
    eco = widget.product.productPrice * widget.product.discount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('${widget.product.productName}'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: _size.width,
                          height: _size.height * 0.4,
                          color: Colors.white,
                          child: Image.network(
                            widget.product.productImg,
                            width: _size.width,
                            height: _size.height * 0.4,
                            fit: BoxFit.contain,
                          ),
                        ),
                        widget.product.numberOfPieces == 0
                            ? Container(
                                width: _size.width,
                                height: _size.height * 0.4,
                                color: Colors.grey.withOpacity(0.7),
                                child: Center(
                                  child: Text(
                                    "สินค้าหมด",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 23),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    ),
                    BannerProduct(
                      discount: discount,
                      discountPrice: discountPrice,
                      eco: eco,
                      productPrice: widget.product.productPrice,
                      sold: widget.product.sold,
                      rate: widget.product.rate,
                    ),
                    Container(
                      width: _size.width,
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Text("${widget.product.description}"),
                    ),
                    _rating(_size),
                    SizedBox(height: 1),
                    _status(_size),
                    SizedBox(height: 5),
                    Container(
                      width: _size.width,
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text("โค้ดส่วนลดร้านค้า"),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: _size.width,
                      height: 300,
                      color: Colors.white,
                      child: Center(
                        child: Text("สินค้าที่คล้ายกัน"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MainButton(
                onTap: widget.product.numberOfPieces == 0
                    ? null
                    : () {
                        Toast.show("Coming Soon!", context,
                            duration: Toast.LENGTH_SHORT,
                            gravity: Toast.BOTTOM);
                      },
                width: _size.width * 0.8,
                textButton: "ซื้อสินค้า",
                backgroundColor: widget.product.numberOfPieces == 0
                    ? Colors.grey
                    : Colors.red[900],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _status(Size _size) {
    return Container(
      width: _size.width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(
            Icons.verified_user,
            size: 20,
          ),
          SizedBox(width: 5),
          Text(
            "ของแท้ 100%",
            style: TextStyle(fontSize: 11),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.replay_circle_filled,
                  size: 20,
                ),
                SizedBox(width: 5),
                Text(
                  "คืนเงิน/สินค้า ภายใน 15 วัน",
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
          Icon(
            Icons.two_wheeler_rounded,
            size: 20,
          ),
          SizedBox(width: 5),
          Text(
            "ส่งฟรี",
            style: TextStyle(fontSize: 11),
          ),
          SizedBox(width: 5),
        ],
      ),
    );
  }

  Container _rating(Size _size) {
    return Container(
      width: _size.width,
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Text("คะแนน ${widget.product.rate}"),
          SizedBox(width: 5),
          Container(
            width: 1,
            height: 15,
            color: Colors.grey,
          ),
          SizedBox(width: 5),
          Expanded(
            child: Text("สินค้าคงเหลือ ${widget.product.numberOfPieces} ชิ้น"),
          ),
          InkWell(
            onTap: () {
              if (fav) {
                setState(() {
                  fav = false;
                });
              } else {
                setState(() {
                  fav = true;
                });
              }
            },
            child: fav
                ? Icon(
                    Icons.favorite,
                    color: Colors.pink,
                  )
                : Icon(
                    Icons.favorite_border_outlined,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
