class AddressModel {
  String name;
  String address;
  String code;
  String phone;

  AddressModel({
    this.name,
    this.address,
    this.code,
    this.phone,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    code = json['code'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['code'] = this.code;
    data['phone'] = this.phone;

    return data;
  }
}
