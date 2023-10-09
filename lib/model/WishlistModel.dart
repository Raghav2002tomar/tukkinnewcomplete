
class WishlistModel {
  WishlistModel({
      num? status, 
      String? message, 
      String? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  WishlistModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
    _error = json['error'];
  }
  num? _status;
  String? _message;
  String? _data;
  String? _error;

  num? get status => _status;
  String? get message => _message;
  String? get data => _data;
  String? get error => _error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    map['error'] = _error;
    return map;
  }

}