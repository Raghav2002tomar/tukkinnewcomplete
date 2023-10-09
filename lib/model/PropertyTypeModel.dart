
class PropertyTypeModel {
  PropertyTypeModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PropertyTypeModel.fromJson(dynamic json) {
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
      List<PropertyTypes>? propertyTypes,}){
    _propertyTypes = propertyTypes;
}

  Data.fromJson(dynamic json) {
    if (json['propertyTypes'] != null) {
      _propertyTypes = [];
      json['propertyTypes'].forEach((v) {
        _propertyTypes?.add(PropertyTypes.fromJson(v));
      });
    }
  }
  List<PropertyTypes>? _propertyTypes;

  List<PropertyTypes>? get propertyTypes => _propertyTypes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_propertyTypes != null) {
      map['propertyTypes'] = _propertyTypes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}


class PropertyTypes {
  PropertyTypes({
      num? id, 
      String? name, 
      String? description, 
      String? status, 
      dynamic image,}){
    _id = id;
    _name = name;
    _description = description;
    _status = status;
    _image = image;
}

  PropertyTypes.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _description = json['description'];
    _status = json['status'];
    _image = json['image'];
  }
  num? _id;
  String? _name;
  String? _description;
  String? _status;
  dynamic _image;

  num? get id => _id;
  String? get name => _name;
  String? get description => _description;
  String? get status => _status;
  dynamic get image => _image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['description'] = _description;
    map['status'] = _status;
    map['image'] = _image;
    return map;
  }

}