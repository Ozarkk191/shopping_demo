import 'package:flutter/material.dart';

class BannerProduct extends StatelessWidget {
  final double eco;
  final double discount;
  final double productPrice;
  final double discountPrice;
  final int sold;
  final double rate;

  const BannerProduct({
    Key key,
    @required this.eco,
    @required this.discount,
    @required this.productPrice,
    @required this.discountPrice,
    @required this.sold,
    @required this.rate,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Container(
      width: _size.width,
      height: 60,
      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
      color: Colors.orange[800],
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ประหยัด $eco บาท",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  discount != 0.0
                      ? Text(
                          "฿ $productPrice",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Text(
                          "฿ $productPrice",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                  SizedBox(width: 5),
                  discount != 0.0
                      ? Text(
                          "฿ $discountPrice",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      : Container(),
                ],
              ),
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ขายไปแล้ว $sold ชิ้น",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "คะแนน $rate",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
