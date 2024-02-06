class CreateProfileParams {
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

  CreateProfileParams(
      {this.cusName,
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
      this.shipPhone});

  CreateProfileParams.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    return data;
  }
}
