import 'package:flutter/material.dart';
import 'package:test_work/model/product_model.dart';

class ProductDetail extends StatefulWidget {
  final Product product;

  const ProductDetail({Key key, @required this.product}) : super(key: key);
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('${widget.product.productName}'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Image.network(widget.product.productImg),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
