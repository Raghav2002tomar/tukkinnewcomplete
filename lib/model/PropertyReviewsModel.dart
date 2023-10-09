/// status : 200
/// message : "global.Result_found"
/// data : {"reviews":[{"id":35,"booking_id":"39","property_id":"146","property_name":"Hotel Shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"good","created_at":"2023-09-16T17:57:41.000000Z","updated_at":"2023-09-16T17:57:41.000000Z"},{"id":36,"booking_id":"39","property_id":"146","property_name":"Hotel Shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"Book Your Stay In Top-Rated Cities Explore Our Top Destinations","created_at":"2023-09-16T17:57:41.000000Z","updated_at":"2023-09-16T17:57:41.000000Z"},{"id":33,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"best","created_at":"2023-09-16T17:54:19.000000Z","updated_at":"2023-09-16T17:54:19.000000Z"},{"id":34,"booking_id":"39","property_id":"146","property_name":"Hotel Shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"beautiful","created_at":"2023-09-16T17:54:19.000000Z","updated_at":"2023-09-16T17:54:19.000000Z"},{"id":31,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"confortable","created_at":"2023-09-16T17:52:21.000000Z","updated_at":"2023-09-16T17:52:26.000000Z"},{"id":32,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"cool","created_at":"2023-09-16T17:52:01.000000Z","updated_at":"2023-09-16T17:52:15.000000Z"},{"id":30,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"kuch bhi","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"yjuyu","created_at":"2023-09-16T11:12:49.000000Z","updated_at":"2023-09-16T11:12:49.000000Z"},{"id":29,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"210","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"sfrd","created_at":"2023-09-16T11:06:00.000000Z","updated_at":"2023-09-16T11:06:00.000000Z"},{"id":28,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"dgfdg","created_at":"2023-09-16T10:07:16.000000Z","updated_at":"2023-09-16T10:07:16.000000Z"},{"id":27,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"2","message":"fgfhfg","created_at":"2023-09-16T10:02:50.000000Z","updated_at":"2023-09-16T10:02:50.000000Z"}],"limit":"10","offset":10}
/// error : ""

class PropertyReviewsModel {
  PropertyReviewsModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PropertyReviewsModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
PropertyReviewsModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => PropertyReviewsModel(  status: status ?? _status,
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

/// reviews : [{"id":35,"booking_id":"39","property_id":"146","property_name":"Hotel Shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"good","created_at":"2023-09-16T17:57:41.000000Z","updated_at":"2023-09-16T17:57:41.000000Z"},{"id":36,"booking_id":"39","property_id":"146","property_name":"Hotel Shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"Book Your Stay In Top-Rated Cities Explore Our Top Destinations","created_at":"2023-09-16T17:57:41.000000Z","updated_at":"2023-09-16T17:57:41.000000Z"},{"id":33,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"best","created_at":"2023-09-16T17:54:19.000000Z","updated_at":"2023-09-16T17:54:19.000000Z"},{"id":34,"booking_id":"39","property_id":"146","property_name":"Hotel Shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"beautiful","created_at":"2023-09-16T17:54:19.000000Z","updated_at":"2023-09-16T17:54:19.000000Z"},{"id":31,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"confortable","created_at":"2023-09-16T17:52:21.000000Z","updated_at":"2023-09-16T17:52:26.000000Z"},{"id":32,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"cool","created_at":"2023-09-16T17:52:01.000000Z","updated_at":"2023-09-16T17:52:15.000000Z"},{"id":30,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"kuch bhi","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"yjuyu","created_at":"2023-09-16T11:12:49.000000Z","updated_at":"2023-09-16T11:12:49.000000Z"},{"id":29,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"210","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"4","message":"sfrd","created_at":"2023-09-16T11:06:00.000000Z","updated_at":"2023-09-16T11:06:00.000000Z"},{"id":28,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"3","message":"dgfdg","created_at":"2023-09-16T10:07:16.000000Z","updated_at":"2023-09-16T10:07:16.000000Z"},{"id":27,"booking_id":"39","property_id":"146","property_name":"Hotel shine","guest_id":"210","guest_name":"Tukki Application","guest_image":"https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg","rating":"2","message":"fgfhfg","created_at":"2023-09-16T10:02:50.000000Z","updated_at":"2023-09-16T10:02:50.000000Z"}]
/// limit : "10"
/// offset : 10

class Data {
  Data({
      List<Reviews>? reviews, 
      // dynamic limit,
      num? offset,}){
    _reviews = reviews;
    // _limit = limit;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    // _limit = json['limit'];
    _offset = json['offset'];
  }
  List<Reviews>? _reviews;
  // String? _limit;
  num? _offset;
  List<Reviews>? get reviews => _reviews;
  // String? get limit => _limit;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    // map['limit'] = _limit;
    map['offset'] = _offset;
    return map;
  }

}

/// id : 35
/// booking_id : "39"
/// property_id : "146"
/// property_name : "Hotel Shine"
/// guest_id : "210"
/// guest_name : "Tukki Application"
/// guest_image : "https://tukki.cssrender.com/storage/app/public/572/image_6500397412f5c.jpeg"
/// rating : "4"
/// message : "good"
/// created_at : "2023-09-16T17:57:41.000000Z"
/// updated_at : "2023-09-16T17:57:41.000000Z"

class Reviews {
  Reviews({
      num? id, 
      String? bookingId, 
      String? propertyId, 
      String? propertyName, 
      String? guestId, 
      String? guestName, 
      String? guestImage, 
      String? rating, 
      String? message, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _bookingId = bookingId;
    _propertyId = propertyId;
    _propertyName = propertyName;
    _guestId = guestId;
    _guestName = guestName;
    _guestImage = guestImage;
    _rating = rating;
    _message = message;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Reviews.fromJson(dynamic json) {
    _id = json['id'];
    _bookingId = json['booking_id'];
    _propertyId = json['property_id'];
    _propertyName = json['property_name'];
    _guestId = json['guest_id'];
    _guestName = json['guest_name'];
    _guestImage = json['guest_image'];
    _rating = json['rating'];
    _message = json['message'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _bookingId;
  String? _propertyId;
  String? _propertyName;
  String? _guestId;
  String? _guestName;
  String? _guestImage;
  String? _rating;
  String? _message;
  String? _createdAt;
  String? _updatedAt;
Reviews copyWith({  num? id,
  String? bookingId,
  String? propertyId,
  String? propertyName,
  String? guestId,
  String? guestName,
  String? guestImage,
  String? rating,
  String? message,
  String? createdAt,
  String? updatedAt,
}) => Reviews(  id: id ?? _id,
  bookingId: bookingId ?? _bookingId,
  propertyId: propertyId ?? _propertyId,
  propertyName: propertyName ?? _propertyName,
  guestId: guestId ?? _guestId,
  guestName: guestName ?? _guestName,
  guestImage: guestImage ?? _guestImage,
  rating: rating ?? _rating,
  message: message ?? _message,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get bookingId => _bookingId;
  String? get propertyId => _propertyId;
  String? get propertyName => _propertyName;
  String? get guestId => _guestId;
  String? get guestName => _guestName;
  String? get guestImage => _guestImage;
  String? get rating => _rating;
  String? get message => _message;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['booking_id'] = _bookingId;
    map['property_id'] = _propertyId;
    map['property_name'] = _propertyName;
    map['guest_id'] = _guestId;
    map['guest_name'] = _guestName;
    map['guest_image'] = _guestImage;
    map['rating'] = _rating;
    map['message'] = _message;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}