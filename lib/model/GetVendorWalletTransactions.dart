/// status : 200
/// message : "global.vendor_Wallet_amount"
/// data : {"WalletTransactionsDetails":[{"id":4,"vendor_id":"4","booking_id":"65","payout_id":"0","amount":"973.66","type":"credit","description":"Vendor commission for booking #65","created_at":"2023-09-11 18:57:57","updated_at":"2023-09-11 18:57:59"},{"id":5,"vendor_id":"4","booking_id":"65","payout_id":"0","amount":"973.66","type":"refund","description":"Vendor commission for booking #65","created_at":"2023-09-10 18:58:01","updated_at":"2023-09-05 18:58:04"}]}
/// error : ""

class GetVendorWalletTransactions {
  GetVendorWalletTransactions({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetVendorWalletTransactions.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetVendorWalletTransactions copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetVendorWalletTransactions(  status: status ?? _status,
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

/// WalletTransactionsDetails : [{"id":4,"vendor_id":"4","booking_id":"65","payout_id":"0","amount":"973.66","type":"credit","description":"Vendor commission for booking #65","created_at":"2023-09-11 18:57:57","updated_at":"2023-09-11 18:57:59"},{"id":5,"vendor_id":"4","booking_id":"65","payout_id":"0","amount":"973.66","type":"refund","description":"Vendor commission for booking #65","created_at":"2023-09-10 18:58:01","updated_at":"2023-09-05 18:58:04"}]

class Data {
  Data({
      List<WalletTransactionsDetails>? walletTransactionsDetails,
    num? offset,}){
    _walletTransactionsDetails = walletTransactionsDetails;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['WalletTransactionsDetails'] != null) {
      _walletTransactionsDetails = [];
      json['WalletTransactionsDetails'].forEach((v) {
        _walletTransactionsDetails?.add(WalletTransactionsDetails.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<WalletTransactionsDetails>? _walletTransactionsDetails;
  num? _offset;

  List<WalletTransactionsDetails>? get walletTransactionsDetails => _walletTransactionsDetails;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_walletTransactionsDetails != null) {
      map['WalletTransactionsDetails'] = _walletTransactionsDetails?.map((v) => v.toJson()).toList();

    }
    map['offset'] = _offset;
    return map;
  }

}

/// id : 4
/// vendor_id : "4"
/// booking_id : "65"
/// payout_id : "0"
/// amount : "973.66"
/// type : "credit"
/// description : "Vendor commission for booking #65"
/// created_at : "2023-09-11 18:57:57"
/// updated_at : "2023-09-11 18:57:59"

class WalletTransactionsDetails {
  WalletTransactionsDetails({
      num? id, 
      String? vendorId, 
      String? bookingId, 
      String? payoutId, 
      String? amount, 
      String? type, 
      String? description, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _vendorId = vendorId;
    _bookingId = bookingId;
    _payoutId = payoutId;
    _amount = amount;
    _type = type;
    _description = description;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  WalletTransactionsDetails.fromJson(dynamic json) {
    _id = json['id'];
    _vendorId = json['vendor_id'];
    _bookingId = json['booking_id'];
    _payoutId = json['payout_id'];
    _amount = json['amount'];
    _type = json['type'];
    _description = json['description'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _vendorId;
  String? _bookingId;
  String? _payoutId;
  String? _amount;
  String? _type;
  String? _description;
  String? _createdAt;
  String? _updatedAt;
WalletTransactionsDetails copyWith({  num? id,
  String? vendorId,
  String? bookingId,
  String? payoutId,
  String? amount,
  String? type,
  String? description,
  String? createdAt,
  String? updatedAt,
}) => WalletTransactionsDetails(  id: id ?? _id,
  vendorId: vendorId ?? _vendorId,
  bookingId: bookingId ?? _bookingId,
  payoutId: payoutId ?? _payoutId,
  amount: amount ?? _amount,
  type: type ?? _type,
  description: description ?? _description,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get vendorId => _vendorId;
  String? get bookingId => _bookingId;
  String? get payoutId => _payoutId;
  String? get amount => _amount;
  String? get type => _type;
  String? get description => _description;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['vendor_id'] = _vendorId;
    map['booking_id'] = _bookingId;
    map['payout_id'] = _payoutId;
    map['amount'] = _amount;
    map['type'] = _type;
    map['description'] = _description;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}