/// status : 200
/// message : "Property prices calculated successfully"
/// data : {"discount_type":"","prices":[{"date":"2023-09-19","price":"88.00","status":"Available"}],"price_before_discount":"88.00","discount_price":"0.00","coupon_discount":"6.00","price_after_discount":"82.00","service_charge":"10.00","cleaning_charge":"12.00","coupon_code":"abc","tax":"13.00","wallet_amount":"0.00","remaining_wallet_balance":"0.00","gross_price":"117.00"}
/// error : ""

class GetPropertyPrices {
  GetPropertyPrices({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetPropertyPrices.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetPropertyPrices copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetPropertyPrices(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
  error: error ?? _error,
);
  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    map['error'] = _error;
    return map;
  }

}

/// discount_type : ""
/// prices : [{"date":"2023-09-19","price":"88.00","status":"Available"}]
/// price_before_discount : "88.00"
/// discount_price : "0.00"
/// coupon_discount : "6.00"
/// price_after_discount : "82.00"
/// service_charge : "10.00"
/// cleaning_charge : "12.00"
/// coupon_code : "abc"
/// tax : "13.00"
/// wallet_amount : "0.00"
/// remaining_wallet_balance : "0.00"
/// gross_price : "117.00"

class Data {
  Data({
      String? discountType, 
      List<Prices>? prices, 
      String? priceBeforeDiscount,
      String? pricePerNight,
      String? totalNights,
      String? discountPrice,
      String? couponDiscount,
      String? priceAfterDiscount,
      String? serviceCharge,
      String? cleaningCharge,
      String? couponCode, 
      String? tax,
      String? walletAmount,
      String? remainingWalletBalance,
      String? grossPrice,}){
    _discountType = discountType;
    _prices = prices;
    _priceBeforeDiscount = priceBeforeDiscount;
    _pricePerNight = pricePerNight;
    _totalNights = totalNights;
    _discountPrice = discountPrice;
    _couponDiscount = couponDiscount;
    _priceAfterDiscount = priceAfterDiscount;
    _serviceCharge = serviceCharge;
    _cleaningCharge = cleaningCharge;
    _couponCode = couponCode;
    _tax = tax;
    _walletAmount = walletAmount;
    _remainingWalletBalance = remainingWalletBalance;
    _grossPrice = grossPrice;
}

  Data.fromJson(dynamic json) {
    _discountType = json['discount_type'];
    if (json['prices'] != null) {
      _prices = [];
      json['prices'].forEach((v) {
        _prices?.add(Prices.fromJson(v));
      });
    }
    _priceBeforeDiscount = json['price_before_discount'];
    _pricePerNight = json['price_per_night'];
    _totalNights = json['total_nights'];
    _discountPrice = json['discount_price'];
    _couponDiscount = json['coupon_discount'];
    _priceAfterDiscount = json['price_after_discount'];
    _serviceCharge = json['service_charge'];
    _cleaningCharge = json['cleaning_charge'];
    _couponCode = json['coupon_code'];
    _tax = json['tax'];
    _walletAmount = json['wallet_amount'];
    _remainingWalletBalance = json['remaining_wallet_balance'];
    _grossPrice = json['gross_price'];
  }
  String? _discountType;
  List<Prices>? _prices;
  String? _priceBeforeDiscount;
  String? _pricePerNight;
  String? _totalNights;
  String? _discountPrice;
  String? _couponDiscount;
  String? _priceAfterDiscount;
  String? _serviceCharge;
  String? _cleaningCharge;
  String? _couponCode;
  String? _tax;
  String? _walletAmount;
  String? _remainingWalletBalance;
  String? _grossPrice;
Data copyWith({  String? discountType,
  List<Prices>? prices,
  String? priceBeforeDiscount,
  String? pricePerNight,
  String? totalNights,
  String? discountPrice,
  String? couponDiscount,
  String? priceAfterDiscount,
  String? serviceCharge,
  String? cleaningCharge,
  String? couponCode,
  String? tax,
  String? walletAmount,
  String? remainingWalletBalance,
  String? grossPrice,
}) => Data(  discountType: discountType ?? _discountType,
  prices: prices ?? _prices,
  priceBeforeDiscount: priceBeforeDiscount ?? _priceBeforeDiscount,
  pricePerNight: pricePerNight ?? _pricePerNight,
  totalNights: totalNights ?? _totalNights,
  discountPrice: discountPrice ?? _discountPrice,
  couponDiscount: couponDiscount ?? _couponDiscount,
  priceAfterDiscount: priceAfterDiscount ?? _priceAfterDiscount,
  serviceCharge: serviceCharge ?? _serviceCharge,
  cleaningCharge: cleaningCharge ?? _cleaningCharge,
  couponCode: couponCode ?? _couponCode,
  tax: tax ?? _tax,
  walletAmount: walletAmount ?? _walletAmount,
  remainingWalletBalance: remainingWalletBalance ?? _remainingWalletBalance,
  grossPrice: grossPrice ?? _grossPrice,
);
  String? get discountType => _discountType;
  List<Prices>? get prices => _prices;
  String? get priceBeforeDiscount => _priceBeforeDiscount;
  String? get pricePerNight => _pricePerNight;
  String? get totalNights => _totalNights;
  String? get discountPrice => _discountPrice;
  String? get couponDiscount => _couponDiscount;
  String? get priceAfterDiscount => _priceAfterDiscount;
  String? get serviceCharge => _serviceCharge;
  String? get cleaningCharge => _cleaningCharge;
  String? get couponCode => _couponCode;
  String? get tax => _tax;
  String? get walletAmount => _walletAmount;
  String? get remainingWalletBalance => _remainingWalletBalance;
  String? get grossPrice => _grossPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['discount_type'] = _discountType;
    if (_prices != null) {
      map['prices'] = _prices?.map((v) => v.toJson()).toList();
    }
    map['price_before_discount'] = _priceBeforeDiscount;
    map['price_per_night'] = _pricePerNight;
    map['total_nights'] = _totalNights;
    map['discount_price'] = _discountPrice;
    map['coupon_discount'] = _couponDiscount;
    map['price_after_discount'] = _priceAfterDiscount;
    map['service_charge'] = _serviceCharge;
    map['cleaning_charge'] = _cleaningCharge;
    map['coupon_code'] = _couponCode;
    map['tax'] = _tax;
    map['wallet_amount'] = _walletAmount;
    map['remaining_wallet_balance'] = _remainingWalletBalance;
    map['gross_price'] = _grossPrice;
    return map;
  }

}

/// date : "2023-09-19"
/// price : "88.00"
/// status : "Available"

class Prices {
  Prices({
      String? date, 
      String? price, 
      String? status,}){
    _date = date;
    _price = price;
    _status = status;
}

  Prices.fromJson(dynamic json) {
    _date = json['date'];
    _price = json['price'];
    _status = json['status'];
  }
  String? _date;
  String? _price;
  String? _status;
Prices copyWith({  String? date,
  String? price,
  String? status,
}) => Prices(  date: date ?? _date,
  price: price ?? _price,
  status: status ?? _status,
);
  String? get date => _date;
  String? get price => _price;
  String? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['price'] = _price;
    map['status'] = _status;
    return map;
  }

}