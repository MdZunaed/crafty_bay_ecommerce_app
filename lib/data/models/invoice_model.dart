class InvoiceModel {
  int? id;
  String? total;
  String? vat;
  String? payable;
  String? cusDetails;
  String? shipDetails;
  String? tranId;
  String? valId;
  String? deliveryStatus;
  String? paymentStatus;
  int? userId;
  String? createdAt;
  String? updatedAt;

  InvoiceModel(
      {this.id,
      this.total,
      this.vat,
      this.payable,
      this.cusDetails,
      this.shipDetails,
      this.tranId,
      this.valId,
      this.deliveryStatus,
      this.paymentStatus,
      this.userId,
      this.createdAt,
      this.updatedAt});

  InvoiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    total = json['total'];
    vat = json['vat'];
    payable = json['payable'];
    cusDetails = json['cus_details'];
    shipDetails = json['ship_details'];
    tranId = json['tran_id'];
    valId = json['val_id'];
    deliveryStatus = json['delivery_status'];
    paymentStatus = json['payment_status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['total'] = this.total;
    data['vat'] = this.vat;
    data['payable'] = this.payable;
    data['cus_details'] = this.cusDetails;
    data['ship_details'] = this.shipDetails;
    data['tran_id'] = this.tranId;
    data['val_id'] = this.valId;
    data['delivery_status'] = this.deliveryStatus;
    data['payment_status'] = this.paymentStatus;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
