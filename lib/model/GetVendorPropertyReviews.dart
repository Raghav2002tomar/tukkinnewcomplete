/// status : 200
/// message : "global.Reviews retrieved successfully."
/// data : {"reviews":[{"property_id":"217","property_name":null,"guest_response":{"guest_name":null,"guest_rating":"0","guest_message":"best design","guest_profile":"https://tukki.cssrender.com/storage/app/public/653/conversions/image_650cc274c887b.-preview.jpg"},"host_response":{"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-20T10:15:41.000000Z"},{"property_id":"217","property_name":null,"guest_response":{"guest_name":null,"guest_rating":"0","guest_message":"best design","guest_profile":"https://tukki.cssrender.com/storage/app/public/653/conversions/image_650cc274c887b.-preview.jpg"},"host_response":{"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-20T10:14:44.000000Z"},{"property_id":"114","property_name":null,"guest_response":{"guest_name":null,"guest_rating":"0","guest_message":"sdfsdf","guest_profile":null},"host_response":{"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-20T07:47:33.000000Z"},{"property_id":"13","property_name":"Residence Eburnea","guest_response":{"guest_name":"tom sizh sizh","guest_rating":"3","guest_message":"experience was so good","guest_profile":null},"host_response":{"host_name":"tom sizh sizh","host_rating":"5","host_message":"Great person good sense of mind","host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-08T11:51:23.000000Z"}],"offset":4}
/// error : ""

class GetVendorPropertyReviews {
  GetVendorPropertyReviews({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetVendorPropertyReviews.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetVendorPropertyReviews copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetVendorPropertyReviews(  status: status ?? _status,
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

/// reviews : [{"property_id":"217","property_name":null,"guest_response":{"guest_name":null,"guest_rating":"0","guest_message":"best design","guest_profile":"https://tukki.cssrender.com/storage/app/public/653/conversions/image_650cc274c887b.-preview.jpg"},"host_response":{"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-20T10:15:41.000000Z"},{"property_id":"217","property_name":null,"guest_response":{"guest_name":null,"guest_rating":"0","guest_message":"best design","guest_profile":"https://tukki.cssrender.com/storage/app/public/653/conversions/image_650cc274c887b.-preview.jpg"},"host_response":{"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-20T10:14:44.000000Z"},{"property_id":"114","property_name":null,"guest_response":{"guest_name":null,"guest_rating":"0","guest_message":"sdfsdf","guest_profile":null},"host_response":{"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-20T07:47:33.000000Z"},{"property_id":"13","property_name":"Residence Eburnea","guest_response":{"guest_name":"tom sizh sizh","guest_rating":"3","guest_message":"experience was so good","guest_profile":null},"host_response":{"host_name":"tom sizh sizh","host_rating":"5","host_message":"Great person good sense of mind","host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"},"created_at":"2023-09-08T11:51:23.000000Z"}]
/// offset : 4

class Data {
  Data({
      List<Reviews>? reviews, 
      num? offset,}){
    _reviews = reviews;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<Reviews>? _reviews;
  num? _offset;
Data copyWith({  List<Reviews>? reviews,
  num? offset,
}) => Data(  reviews: reviews ?? _reviews,
  offset: offset ?? _offset,
);
  List<Reviews>? get reviews => _reviews;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    return map;
  }

}

/// property_id : "217"
/// property_name : null
/// guest_response : {"guest_name":null,"guest_rating":"0","guest_message":"best design","guest_profile":"https://tukki.cssrender.com/storage/app/public/653/conversions/image_650cc274c887b.-preview.jpg"}
/// host_response : {"host_name":null,"host_rating":"0","host_message":null,"host_profile":"https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"}
/// created_at : "2023-09-20T10:15:41.000000Z"

class Reviews {
  Reviews({
      String? propertyId, 
      dynamic propertyName, 
      GuestResponse? guestResponse, 
      HostResponse? hostResponse, 
      String? createdAt,}){
    _propertyId = propertyId;
    _propertyName = propertyName;
    _guestResponse = guestResponse;
    _hostResponse = hostResponse;
    _createdAt = createdAt;
}

  Reviews.fromJson(dynamic json) {
    _propertyId = json['property_id'];
    _propertyName = json['property_name'];
    _guestResponse = json['guest_response'] != null ? GuestResponse.fromJson(json['guest_response']) : null;
    _hostResponse = json['host_response'] != null ? HostResponse.fromJson(json['host_response']) : null;
    _createdAt = json['created_at'];
  }
  String? _propertyId;
  dynamic _propertyName;
  GuestResponse? _guestResponse;
  HostResponse? _hostResponse;
  String? _createdAt;
Reviews copyWith({  String? propertyId,
  dynamic propertyName,
  GuestResponse? guestResponse,
  HostResponse? hostResponse,
  String? createdAt,
}) => Reviews(  propertyId: propertyId ?? _propertyId,
  propertyName: propertyName ?? _propertyName,
  guestResponse: guestResponse ?? _guestResponse,
  hostResponse: hostResponse ?? _hostResponse,
  createdAt: createdAt ?? _createdAt,
);
  String? get propertyId => _propertyId;
  dynamic get propertyName => _propertyName;
  GuestResponse? get guestResponse => _guestResponse;
  HostResponse? get hostResponse => _hostResponse;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_id'] = _propertyId;
    map['property_name'] = _propertyName;
    if (_guestResponse != null) {
      map['guest_response'] = _guestResponse?.toJson();
    }
    if (_hostResponse != null) {
      map['host_response'] = _hostResponse?.toJson();
    }
    map['created_at'] = _createdAt;
    return map;
  }

}

/// host_name : null
/// host_rating : "0"
/// host_message : null
/// host_profile : "https://tukki.cssrender.com/storage/app/public/646/conversions/image_650b0764957ba.-preview.jpg"

class HostResponse {
  HostResponse({
      dynamic hostName, 
      String? hostRating, 
      dynamic hostMessage, 
      String? hostProfile,}){
    _hostName = hostName;
    _hostRating = hostRating;
    _hostMessage = hostMessage;
    _hostProfile = hostProfile;
}

  HostResponse.fromJson(dynamic json) {
    _hostName = json['host_name'];
    _hostRating = json['host_rating'];
    _hostMessage = json['host_message'];
    _hostProfile = json['host_profile'];
  }
  dynamic _hostName;
  String? _hostRating;
  dynamic _hostMessage;
  String? _hostProfile;
HostResponse copyWith({  dynamic hostName,
  String? hostRating,
  dynamic hostMessage,
  String? hostProfile,
}) => HostResponse(  hostName: hostName ?? _hostName,
  hostRating: hostRating ?? _hostRating,
  hostMessage: hostMessage ?? _hostMessage,
  hostProfile: hostProfile ?? _hostProfile,
);
  dynamic get hostName => _hostName;
  String? get hostRating => _hostRating;
  dynamic get hostMessage => _hostMessage;
  String? get hostProfile => _hostProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['host_name'] = _hostName;
    map['host_rating'] = _hostRating;
    map['host_message'] = _hostMessage;
    map['host_profile'] = _hostProfile;
    return map;
  }

}

/// guest_name : null
/// guest_rating : "0"
/// guest_message : "best design"
/// guest_profile : "https://tukki.cssrender.com/storage/app/public/653/conversions/image_650cc274c887b.-preview.jpg"

class GuestResponse {
  GuestResponse({
      dynamic guestName, 
      String? guestRating, 
      String? guestMessage, 
      String? guestProfile,}){
    _guestName = guestName;
    _guestRating = guestRating;
    _guestMessage = guestMessage;
    _guestProfile = guestProfile;
}

  GuestResponse.fromJson(dynamic json) {
    _guestName = json['guest_name'];
    _guestRating = json['guest_rating'];
    _guestMessage = json['guest_message'];
    _guestProfile = json['guest_profile'];
  }
  dynamic _guestName;
  String? _guestRating;
  String? _guestMessage;
  String? _guestProfile;
GuestResponse copyWith({  dynamic guestName,
  String? guestRating,
  String? guestMessage,
  String? guestProfile,
}) => GuestResponse(  guestName: guestName ?? _guestName,
  guestRating: guestRating ?? _guestRating,
  guestMessage: guestMessage ?? _guestMessage,
  guestProfile: guestProfile ?? _guestProfile,
);
  dynamic get guestName => _guestName;
  String? get guestRating => _guestRating;
  String? get guestMessage => _guestMessage;
  String? get guestProfile => _guestProfile;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['guest_name'] = _guestName;
    map['guest_rating'] = _guestRating;
    map['guest_message'] = _guestMessage;
    map['guest_profile'] = _guestProfile;
    return map;
  }

}