class CartModel {
  String productImg;
  String productName;
  double productPrice;
  double discount;
  String description;
  int pieces;

  CartModel(
      {this.productImg,
      this.productName,
      this.productPrice,
      this.discount,
      this.description,
      this.pieces});

  CartModel.fromJson(Map<String, dynamic> json) {
    productImg = json['product_img'];
    productName = json['product_name'];
    productPrice = json['product_price'];
    discount = json['discount'];
    description = json['description'];
    pieces = json['pieces'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_img'] = this.productImg;
    data['product_name'] = this.productName;
    data['product_price'] = this.productPrice;
    data['discount'] = this.discount;
    data['description'] = this.description;
    data['pieces'] = this.pieces;
    return data;
  }
}
