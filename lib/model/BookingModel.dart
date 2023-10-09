
class BookingModel {
  BookingModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  BookingModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;

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

class Data {
  Data({
      List<Bookings>? bookings, 
      num? offset, 
      num? limit,}){
    _bookings = bookings;
    _offset = offset;
    _limit = limit;
}

  Data.fromJson(dynamic json) {
    if (json['Bookings'] != null) {
      _bookings = [];
      json['Bookings'].forEach((v) {
        _bookings?.add(Bookings.fromJson(v));
      });
    }
    _offset = json['offset'];
    _limit = json['limit'];
  }
  List<Bookings>? _bookings;
  num? _offset;
  num? _limit;

  List<Bookings>? get bookings => _bookings;
  num? get offset => _offset;
  num? get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_bookings != null) {
      map['Bookings'] = _bookings?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    map['limit'] = _limit;
    return map;
  }

}

class Bookings {
  Bookings({
      num? id, 
      String? itemid, 
      String? userid, 
      String? hostId, 
      String? checkIn, 
      String? checkOut, 
      String? status, 
      String? totalNight, 
      String? perNight, 
      dynamic bookFor, 
      String? basePrice, 
      String? cleaningCharge, 
      String? guestCharge, 
      String? serviceCharge, 
      String? securityMoney, 
      String? ivaTax, 
      String? totalGuest,
      String? total,
      String? adminCommission, 
      String? vendorCommision, 
      String? currencyCode, 
      dynamic cancellationReasion, 
      dynamic cancelledCharge,
      dynamic transaction,
      String? paymentMethod, 
      String? paymentStatus, 
      String? propImg, 
      String? propTitle, 
      dynamic itemData, 
      String? wallAmt, 
      dynamic note, 
      String? rating, 
      dynamic cancelledBy, 
      String? createdAt, 
      String? updatedAt,
      String? reviewStatus,
      String? reviewRating,
      String? review,
      String? hostName,
      String? hostNumber,
      String? hostEmail,
      String? userName,
      String? userNumber,
      String? userEmail,

  }){
    _id = id;
    _itemid = itemid;
    _userid = userid;
    _hostId = hostId;
    _checkIn = checkIn;
    _checkOut = checkOut;
    _status = status;
    _totalNight = totalNight;
    _perNight = perNight;
    _bookFor = bookFor;
    _basePrice = basePrice;
    _cleaningCharge = cleaningCharge;
    _guestCharge = guestCharge;
    _serviceCharge = serviceCharge;
    _securityMoney = securityMoney;
    _ivaTax = ivaTax;
    _totalGuest = totalGuest;
    _total = total;
    _adminCommission = adminCommission;
    _vendorCommision = vendorCommision;
    _currencyCode = currencyCode;
    _cancellationReasion = cancellationReasion;
    _cancelledCharge = cancelledCharge;
    _transaction = transaction;
    _paymentMethod = paymentMethod;
    _paymentStatus = paymentStatus;
    _propImg = propImg;
    _propTitle = propTitle;
    _itemData = itemData;
    _wallAmt = wallAmt;
    _note = note;
    _rating = rating;
    _cancelledBy = cancelledBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _reviewStatus = reviewStatus;
    _reviewRating = reviewRating;
    _review = review;
    _hostName = hostName;
    _hostNumber = hostNumber;
    _hostEmail = hostEmail;
    _userName = userName;
    _userNumber = userNumber;
    _userEmail = userEmail;
}

  Bookings.fromJson(dynamic json) {
    _id = json['id'];
    _itemid = json['itemid'];
    _userid = json['userid'];
    _hostId = json['host_id'];
    _checkIn = json['check_in'];
    _checkOut = json['check_out'];
    _status = json['status'];
    _totalNight = json['total_night'];
    _perNight = json['per_night'];
    _bookFor = json['book_for'];
    _basePrice = json['base_price'];
    _cleaningCharge = json['cleaning_charge'];
    _guestCharge = json['guest_charge'];
    _serviceCharge = json['service_charge'];
    _securityMoney = json['security_money'];
    _ivaTax = json['iva_tax'];
    _totalGuest = json['total_guest'];
    _total = json['total'];
    _adminCommission = json['admin_commission'];
    _vendorCommision = json['vendor_commision'];
    _currencyCode = json['currency_code'];
    _cancellationReasion = json['cancellation_reasion'];
    _cancelledCharge = json['cancelled_charge'];
    _transaction = json['transaction'];
    _paymentMethod = json['payment_method'];
    _paymentStatus = json['payment_status'];
    _propImg = json['prop_img'];
    _propTitle = json['prop_title'];
    _itemData = json['item_data'];
    _wallAmt = json['wall_amt'];
    _note = json['note'];
    _rating = json['rating'];
    _cancelledBy = json['cancelled_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _reviewStatus = json['review_status'];
    _reviewRating = json['review_rating'];
    _review = json['review'];
    _hostName = json['host_name'];
    _hostNumber = json['host_number'];
    _hostEmail = json['host_email'];
    _userName = json['user_name'];
    _userNumber = json['user_number'];
    _userEmail = json['user_email'];
  }
  num? _id;
  String? _itemid;
  String? _userid;
  String? _hostId;
  String? _checkIn;
  String? _checkOut;
  String? _status;
  String? _totalNight;
  String? _perNight;
  dynamic _bookFor;
  String? _basePrice;
  String? _cleaningCharge;
  String? _guestCharge;
  String? _serviceCharge;
  String? _securityMoney;
  String? _ivaTax;
  String? _totalGuest;
  String? _total;
  String? _adminCommission;
  String? _vendorCommision;
  String? _currencyCode;
  dynamic _cancellationReasion;
  dynamic _cancelledCharge;
  dynamic _transaction;
  String? _paymentMethod;
  String? _paymentStatus;
  String? _propImg;
  String? _propTitle;
  dynamic _itemData;
  String? _wallAmt;
  dynamic _note;
  String? _rating;
  dynamic _cancelledBy;
  String? _createdAt;
  String? _updatedAt;
  String? _reviewStatus;
  String? _reviewRating;
  String? _review;
  String? _hostName;
  String? _hostNumber;
  String? _hostEmail;
  String? _userName;
  String? _userNumber;
  String? _userEmail;

  num? get id => _id;
  String? get itemid => _itemid;
  String? get userid => _userid;
  String? get hostId => _hostId;
  String? get checkIn => _checkIn;
  String? get checkOut => _checkOut;
  String? get status => _status;
  String? get totalNight => _totalNight;
  String? get perNight => _perNight;
  dynamic get bookFor => _bookFor;
  String? get basePrice => _basePrice;
  String? get cleaningCharge => _cleaningCharge;
  String? get guestCharge => _guestCharge;
  String? get serviceCharge => _serviceCharge;
  String? get securityMoney => _securityMoney;
  String? get ivaTax => _ivaTax;
  String? get totalGuest => _totalGuest;
  String? get total => _total;
  String? get adminCommission => _adminCommission;
  String? get vendorCommision => _vendorCommision;
  String? get currencyCode => _currencyCode;
  dynamic get cancellationReasion => _cancellationReasion;
  dynamic get cancelledCharge => _cancelledCharge;
  dynamic get transaction => _transaction;
  String? get paymentMethod => _paymentMethod;
  String? get paymentStatus => _paymentStatus;
  String? get propImg => _propImg;
  String? get propTitle => _propTitle;
  dynamic get itemData => _itemData;
  String? get wallAmt => _wallAmt;
  dynamic get note => _note;
  String? get rating => _rating;
  dynamic get cancelledBy => _cancelledBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get reviewStatus => _reviewStatus;
  String? get reviewRating => _reviewRating;
  String? get review => _review;
  String? get hostName => _hostName;
  String? get hostNumber => _hostNumber;
  String? get hostEmail => _hostEmail;
  String? get userName => _userName;
  String? get userNumber => _userNumber;
  String? get userEmail => _userEmail;

  set statusSetter(String value){
    _status=value;
  }
  set reviewStatusSetter(String value){
    _reviewStatus=value;
  }
  set reviewRatingSetter(String value){
    _reviewRating=value;
  }
  set reviewSetter(String value){
    _review=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['itemid'] = _itemid;
    map['userid'] = _userid;
    map['host_id'] = _hostId;
    map['check_in'] = _checkIn;
    map['check_out'] = _checkOut;
    map['status'] = _status;
    map['total_night'] = _totalNight;
    map['per_night'] = _perNight;
    map['book_for'] = _bookFor;
    map['base_price'] = _basePrice;
    map['cleaning_charge'] = _cleaningCharge;
    map['guest_charge'] = _guestCharge;
    map['service_charge'] = _serviceCharge;
    map['security_money'] = _securityMoney;
    map['iva_tax'] = _ivaTax;
    map['total_guest'] = _totalGuest;
    map['total'] = _total;
    map['admin_commission'] = _adminCommission;
    map['vendor_commision'] = _vendorCommision;
    map['currency_code'] = _currencyCode;
    map['cancellation_reasion'] = _cancellationReasion;
    map['cancelled_charge'] = _cancelledCharge;
    map['transaction'] = _transaction;
    map['payment_method'] = _paymentMethod;
    map['payment_status'] = _paymentStatus;
    map['prop_img'] = _propImg;
    map['prop_title'] = _propTitle;
    map['item_data'] = _itemData;
    map['wall_amt'] = _wallAmt;
    map['note'] = _note;
    map['rating'] = _rating;
    map['cancelled_by'] = _cancelledBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['review_status'] = _reviewStatus;
    map['review_rating'] = _reviewRating;
    map['review'] = _review;
    map['host_name'] = _hostName;
    map['host_number'] = _hostNumber;
    map['host_email'] = _hostEmail;
    map['user_name'] = _userName;
    map['user_number'] = _userNumber;
    map['user_email'] = _userEmail;
    return map;
  }

}