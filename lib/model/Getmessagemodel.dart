/// status : 200
/// message : "Conversations retrieved successfully"
/// data : {"conversations":[{"id":45,"user_id":"203","vendor_id":"178","property_id":"146","property_title":"Hotel shine","last_message_at":"2023-09-20 10:25:30","created_at":"2023-09-16T12:23:16.000000Z","updated_at":"2023-09-20T10:25:30.000000Z","frontImage":"https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg","latest_message":"bye"},{"id":47,"user_id":"210","vendor_id":"178","property_id":"146","property_title":"Hotel shine","last_message_at":"2023-09-18 13:08:32","created_at":"2023-09-18T13:08:18.000000Z","updated_at":"2023-09-18T13:08:32.000000Z","frontImage":"https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg","latest_message":"hello sir"},{"id":50,"user_id":"4","vendor_id":"178","property_id":"146","property_title":"Hotel shine","last_message_at":"2023-09-20 12:37:44","created_at":"2023-09-20T12:09:31.000000Z","updated_at":"2023-09-20T12:37:44.000000Z","frontImage":"https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg","latest_message":"4"}],"offset":-1}
/// error : ""

class GetMessageModel {
  GetMessageModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetMessageModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetMessageModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetMessageModel(  status: status ?? _status,
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

/// conversations : [{"id":45,"user_id":"203","vendor_id":"178","property_id":"146","property_title":"Hotel shine","last_message_at":"2023-09-20 10:25:30","created_at":"2023-09-16T12:23:16.000000Z","updated_at":"2023-09-20T10:25:30.000000Z","frontImage":"https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg","latest_message":"bye"},{"id":47,"user_id":"210","vendor_id":"178","property_id":"146","property_title":"Hotel shine","last_message_at":"2023-09-18 13:08:32","created_at":"2023-09-18T13:08:18.000000Z","updated_at":"2023-09-18T13:08:32.000000Z","frontImage":"https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg","latest_message":"hello sir"},{"id":50,"user_id":"4","vendor_id":"178","property_id":"146","property_title":"Hotel shine","last_message_at":"2023-09-20 12:37:44","created_at":"2023-09-20T12:09:31.000000Z","updated_at":"2023-09-20T12:37:44.000000Z","frontImage":"https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg","latest_message":"4"}]
/// offset : -1

class Data {
  Data({
      List<Conversations>? conversations, 
      num? offset,}){
    _conversations = conversations;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['conversations'] != null) {
      _conversations = [];
      json['conversations'].forEach((v) {
        _conversations?.add(Conversations.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<Conversations>? _conversations;
  num? _offset;
Data copyWith({  List<Conversations>? conversations,
  num? offset,
}) => Data(  conversations: conversations ?? _conversations,
  offset: offset ?? _offset,
);
  List<Conversations>? get conversations => _conversations;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_conversations != null) {
      map['conversations'] = _conversations?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    return map;
  }

}

/// id : 45
/// user_id : "203"
/// vendor_id : "178"
/// property_id : "146"
/// property_title : "Hotel shine"
/// last_message_at : "2023-09-20 10:25:30"
/// created_at : "2023-09-16T12:23:16.000000Z"
/// updated_at : "2023-09-20T10:25:30.000000Z"
/// frontImage : "https://tukki.cssrender.com/storage/app/public/526/image_64faee5957bda.jpeg"
/// latest_message : "bye"

class Conversations {
  Conversations({
      num? id, 
      String? userId, 
      String? vendorId, 
      String? propertyId, 
      String? propertyTitle, 
      String? lastMessageAt, 
      String? createdAt, 
      String? updatedAt, 
      String? frontImage, 
      String? latestMessage,
      int? readStatus,
      }){
    _id = id;
    _userId = userId;
    _vendorId = vendorId;
    _propertyId = propertyId;
    _propertyTitle = propertyTitle;
    _lastMessageAt = lastMessageAt;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _frontImage = frontImage;
    _latestMessage = latestMessage;
    _readStatus = readStatus;
}

  Conversations.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _vendorId = json['vendor_id'];
    _propertyId = json['property_id'];
    _propertyTitle = json['property_title'];
    _lastMessageAt = json['last_message_at'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _frontImage = json['frontImage'];
    _latestMessage = json['latest_message'];
    _readStatus = json['read_status'];
  }
  num? _id;
  String? _userId;
  String? _vendorId;
  String? _propertyId;
  String? _propertyTitle;
  String? _lastMessageAt;
  String? _createdAt;
  String? _updatedAt;
  String? _frontImage;
  String? _latestMessage;
  int? _readStatus;
Conversations copyWith({  num? id,
  String? userId,
  String? vendorId,
  String? propertyId,
  String? propertyTitle,
  String? lastMessageAt,
  String? createdAt,
  String? updatedAt,
  String? frontImage,
  String? latestMessage,
  int? readStatus,
}) => Conversations(  id: id ?? _id,
  userId: userId ?? _userId,
  vendorId: vendorId ?? _vendorId,
  propertyId: propertyId ?? _propertyId,
  propertyTitle: propertyTitle ?? _propertyTitle,
  lastMessageAt: lastMessageAt ?? _lastMessageAt,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  frontImage: frontImage ?? _frontImage,
  latestMessage: latestMessage ?? _latestMessage,
  readStatus: readStatus ?? _readStatus,
);
  num? get id => _id;
  String? get userId => _userId;
  String? get vendorId => _vendorId;
  String? get propertyId => _propertyId;
  String? get propertyTitle => _propertyTitle;
  String? get lastMessageAt => _lastMessageAt;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get frontImage => _frontImage;
  String? get latestMessage => _latestMessage;
  int? get readStatus => _readStatus;

  set readSetter(value){
    _readStatus=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['vendor_id'] = _vendorId;
    map['property_id'] = _propertyId;
    map['property_title'] = _propertyTitle;
    map['last_message_at'] = _lastMessageAt;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['frontImage'] = _frontImage;
    map['latest_message'] = _latestMessage;
    map['read_status'] = _readStatus;
    return map;
  }

}