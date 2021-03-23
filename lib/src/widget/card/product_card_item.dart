import 'package:flutter/material.dart';

class ProductCardItem extends StatelessWidget {
  final Function onTap;
  final double discount;
  final double productPrice;
  final double discountPrice;
  final String productImg;
  final String description;
  final int numberOfPieces;

  const ProductCardItem({
    Key key,
    @required this.discount,
    @required this.onTap,
    @required this.productImg,
    @required this.productPrice,
    @required this.discountPrice,
    @required this.description,
    @required this.numberOfPieces,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Container(
          margin: EdgeInsets.all(2.5),
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Stack(
            children: [
              Image.network(
                "$productImg",
                width: MediaQuery.of(context).size.width * 0.5,
                fit: BoxFit.cover,
              ),
              discount != 0.0
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 40,
                        height: 40,
                        color: Colors.amber,
                        child: Center(
                          child: Text(
                            "ลด\n$discount%",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : Container(),
              Container(
                color: numberOfPieces == 0
                    ? Colors.grey.withOpacity(0.9)
                    : Colors.transparent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        "$description",
                        style: TextStyle(fontSize: 10),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
                      child: Row(
                        children: [
                          discount != 0.0
                              ? Text(
                                  "฿ $productPrice",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                )
                              : Text(
                                  "฿ $productPrice",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                ),
                          SizedBox(width: 5),
                          discount != 0.0
                              ? Text(
                                  "฿ $discountPrice",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.red,
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              numberOfPieces == 0
                  ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        "สินค้าหมด",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}
