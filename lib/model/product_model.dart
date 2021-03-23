class ProductModel {
  List<Product> product;

  ProductModel({this.product});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['product'] != null) {
      product = <Product>[];
      json['product'].forEach((v) {
        product.add(Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String category;
  String description;
  double discount;
  int numberOfPieces;
  String productImg;
  String productName;
  double productPrice;
  int sold;
  double rate;

  Product(
      {this.category,
      this.description,
      this.discount,
      this.numberOfPieces,
      this.productImg,
      this.productName,
      this.productPrice,
      this.sold,
      this.rate});

  Product.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    description = json['description'];
    discount = json['discount'];
    numberOfPieces = json['number_of_pieces'];
    productImg = json['product_img'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    sold = json['sold'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['description'] = this.description;
    data['discount'] = this.discount;
    data['number_of_pieces'] = this.numberOfPieces;
    data['product_img'] = this.productImg;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['sold'] = this.sold;
    data['rate'] = this.rate;
    return data;
  }
}
