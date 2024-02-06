class Profile {
  int? id;
  String? cusName;
  String? cusAdd;
  String? cusCity;
  String? cusState;
  String? cusPostcode;
  String? cusCountry;
  String? cusPhone;
  String? cusFax;
  String? shipName;
  String? shipAdd;
  String? shipCity;
  String? shipState;
  String? shipPostcode;
  String? shipCountry;
  String? shipPhone;
  int? userId;
  String? createdAt;
  String? updatedAt;
  User? user;

  Profile(
      {this.id,
      this.cusName,
      this.cusAdd,
      this.cusCity,
      this.cusState,
      this.cusPostcode,
      this.cusCountry,
      this.cusPhone,
      this.cusFax,
      this.shipName,
      this.shipAdd,
      this.shipCity,
      this.shipState,
      this.shipPostcode,
      this.shipCountry,
      this.shipPhone,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.user});

  Profile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cusName = json['cus_name'];
    cusAdd = json['cus_add'];
    cusCity = json['cus_city'];
    cusState = json['cus_state'];
    cusPostcode = json['cus_postcode'];
    cusCountry = json['cus_country'];
    cusPhone = json['cus_phone'];
    cusFax = json['cus_fax'];
    shipName = json['ship_name'];
    shipAdd = json['ship_add'];
    shipCity = json['ship_city'];
    shipState = json['ship_state'];
    shipPostcode = json['ship_postcode'];
    shipCountry = json['ship_country'];
    shipPhone = json['ship_phone'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['cus_name'] = this.cusName;
    data['cus_add'] = this.cusAdd;
    data['cus_city'] = this.cusCity;
    data['cus_state'] = this.cusState;
    data['cus_postcode'] = this.cusPostcode;
    data['cus_country'] = this.cusCountry;
    data['cus_phone'] = this.cusPhone;
    data['cus_fax'] = this.cusFax;
    data['ship_name'] = this.shipName;
    data['ship_add'] = this.shipAdd;
    data['ship_city'] = this.shipCity;
    data['ship_state'] = this.shipState;
    data['ship_postcode'] = this.shipPostcode;
    data['ship_country'] = this.shipCountry;
    data['ship_phone'] = this.shipPhone;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? email;
  String? otp;
  String? createdAt;
  String? updatedAt;

  User({this.id, this.email, this.otp, this.createdAt, this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    otp = json['otp'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['email'] = this.email;
    data['otp'] = this.otp;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
