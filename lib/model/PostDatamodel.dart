/// status : 200
/// message : "Latest messages retrieved successfully"
/// data : {"latest_message":[{"Name":"Raghav Tomar","Message":"bye","senderid":"178","frontImage":""},{"Name":"Raghav Tomar","Message":"hhh","senderid":"178","frontImage":""},{"Name":"Raghav Tomar","Message":"hello","senderid":"178","frontImage":""},{"Name":"tom sizh","Message":"hhh","senderid":"203","frontImage":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"},{"Name":"tom sizh","Message":"hii","senderid":"203","frontImage":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"}],"offset":-1}
/// error : ""

class PostDataModel {
  PostDataModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PostDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
PostDataModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => PostDataModel(  status: status ?? _status,
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

/// latest_message : [{"Name":"Raghav Tomar","Message":"bye","senderid":"178","frontImage":""},{"Name":"Raghav Tomar","Message":"hhh","senderid":"178","frontImage":""},{"Name":"Raghav Tomar","Message":"hello","senderid":"178","frontImage":""},{"Name":"tom sizh","Message":"hhh","senderid":"203","frontImage":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"},{"Name":"tom sizh","Message":"hii","senderid":"203","frontImage":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"}]
/// offset : -1

class Data {
  Data({
      List<LatestMessage>? latestMessage, 
      num? offset,}){
    _latestMessage = latestMessage;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['latest_message'] != null) {
      _latestMessage = [];
      json['latest_message'].forEach((v) {
        _latestMessage?.add(LatestMessage.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<LatestMessage>? _latestMessage;
  num? _offset;
Data copyWith({  List<LatestMessage>? latestMessage,
  num? offset,
}) => Data(  latestMessage: latestMessage ?? _latestMessage,
  offset: offset ?? _offset,
);
  List<LatestMessage>? get latestMessage => _latestMessage;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_latestMessage != null) {
      map['latest_message'] = _latestMessage?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    return map;
  }

}

/// Name : "Raghav Tomar"
/// Message : "bye"
/// senderid : "178"
/// frontImage : ""

class LatestMessage {
  LatestMessage({
      String? name, 
      String? message, 
      String? senderid, 
      String? frontImage,}){
    _name = name;
    _message = message;
    _senderid = senderid;
    _frontImage = frontImage;
}

  LatestMessage.fromJson(dynamic json) {
    _name = json['Name'];
    _message = json['Message'];
    _senderid = json['senderid'];
    _frontImage = json['frontImage'];
  }
  String? _name;
  String? _message;
  String? _senderid;
  String? _frontImage;
LatestMessage copyWith({  String? name,
  String? message,
  String? senderid,
  String? frontImage,
}) => LatestMessage(  name: name ?? _name,
  message: message ?? _message,
  senderid: senderid ?? _senderid,
  frontImage: frontImage ?? _frontImage,
);
  String? get name => _name;
  String? get message => _message;
  String? get senderid => _senderid;
  String? get frontImage => _frontImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Message'] = _message;
    map['senderid'] = _senderid;
    map['frontImage'] = _frontImage;
    return map;
  }

}