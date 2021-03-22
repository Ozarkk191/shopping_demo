import 'package:flutter/material.dart';
import 'package:test_work/model/product_model.dart';
import 'package:test_work/service/product_service.dart';
import 'package:test_work/src/page/product_detail.dart';
import 'package:test_work/src/widget/card/product_card_item.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // List<ProductModel> _productLiat = <ProductModel>[];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: ProductService.readJson(),
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    if (snapshot.hasData) {
                      List<Product> productList = snapshot.data;
                      return Container(
                        child: GridView.count(
                          childAspectRatio: (0.7),
                          controller:
                              new ScrollController(keepScrollOffset: false),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          children: List.generate(productList.length, (index) {
                            var discount = productList[index].discount * 100;
                            var price = productList[index].productPrice -
                                (productList[index].productPrice *
                                    productList[index].discount);
                            return ProductCardItem(
                              description: '${productList[index].description}',
                              discount: discount,
                              discountPrice: price,
                              numberOfPieces: productList[index].numberOfPieces,
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                      product: productList[index],
                                    ),
                                  ),
                                );
                              },
                              productImg: '${productList[index].productImg}',
                              productPrice: productList[index].productPrice,
                            );
                          }),
                        ),
                      );
                    } else {
                      return Container(
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
