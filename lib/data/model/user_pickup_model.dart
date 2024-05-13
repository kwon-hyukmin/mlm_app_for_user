class UserPickupModel {
  int? seqNum;
  String? invoiceNoOrigin;
  String? invoiceNo;
  String? deliveryCoo;
  String? danjiId;
  String? danjiName;
  String? danjiSubId;
  String? danjiSubName;
  String? address;
  String? detailAddress;
  String? boxType;
  int? deliveryFee;
  String? pickupUserId;
  String? pickupUserName;
  String? pickupStateCode;
  String? pickupState;

  UserPickupModel(
      {this.seqNum,
        this.invoiceNoOrigin,
        this.invoiceNo,
        this.deliveryCoo,
        this.danjiId,
        this.danjiName,
        this.danjiSubId,
        this.danjiSubName,
        this.address,
        this.detailAddress,
        this.boxType,
        this.deliveryFee,
        this.pickupUserId,
        this.pickupUserName,
        this.pickupStateCode,
        this.pickupState});

  UserPickupModel.fromJson(Map<String, dynamic> json) {
    seqNum = json['seqNum'];
    invoiceNoOrigin = json['invoiceNoOrigin'];
    invoiceNo = json['invoiceNo'];
    deliveryCoo = json['deliveryCoo'];
    danjiId = json['danjiId'];
    danjiName = json['danjiName'];
    danjiSubId = json['danjiSubId'];
    danjiSubName = json['danjiSubName'];
    address = json['address'];
    detailAddress = json['detailAddress'];
    boxType = json['boxType'];
    deliveryFee = json['deliveryFee'];
    pickupUserId = json['pickupUserId'];
    pickupUserName = json['pickupUserName'];
    pickupStateCode = json['pickupStateCode'];
    pickupState = json['pickupState'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['seqNum'] = this.seqNum;
    data['invoiceNoOrigin'] = this.invoiceNoOrigin;
    data['invoiceNo'] = this.invoiceNo;
    data['deliveryCoo'] = this.deliveryCoo;
    data['danjiId'] = this.danjiId;
    data['danjiName'] = this.danjiName;
    data['danjiSubId'] = this.danjiSubId;
    data['danjiSubName'] = this.danjiSubName;
    data['address'] = this.address;
    data['detailAddress'] = this.detailAddress;
    data['boxType'] = this.boxType;
    data['deliveryFee'] = this.deliveryFee;
    data['pickupUserId'] = this.pickupUserId;
    data['pickupUserName'] = this.pickupUserName;
    data['pickupStateCode'] = this.pickupStateCode;
    data['pickupState'] = this.pickupState;
    return data;
  }
}