import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:test_work/model/product_model.dart';

class ProductService {
  static Future<List<Product>> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/product.json');
    final data = await json.decode(response);
    ProductModel model = ProductModel.fromJson(data);
    return model.product;
  }
}
