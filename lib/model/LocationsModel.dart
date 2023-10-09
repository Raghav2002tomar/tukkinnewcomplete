/// status : 200
/// message : "global.yourLocations_found"
/// data : {"Locations":[{"id":7,"city_name":"Lagunes","description":"<p>Lagunes</p>","image":"https://tukki.cssrender.com/storage/app/public/12/64a42b93a5a1e_images.jpeg","latitude":"","longitude":null},{"id":8,"city_name":"Montagnes","description":"<p>Montagnes</p>","image":"https://tukki.cssrender.com/storage/app/public/11/64a42b62aae21_download-(2).jpeg","latitude":"","longitude":null},{"id":9,"city_name":"Sassandra","description":"<p>Sassandra-Marahoué</p>","image":"https://tukki.cssrender.com/storage/app/public/10/64a42b354404f_download-(1).jpeg","latitude":"","longitude":null},{"id":10,"city_name":"Savanes","description":"<p>Savanes</p>","image":"https://tukki.cssrender.com/storage/app/public/9/64a42b01f26bc_download.jpeg","latitude":"","longitude":null},{"id":11,"city_name":"Vallée du Bandama","description":"<p>Vallée du Bandama</p>","image":"https://tukki.cssrender.com/storage/app/public/8/64a42a9dcc03b_Vallée-du-Bandama.jpeg","latitude":"","longitude":null},{"id":12,"city_name":"Woroba","description":"<p>Woroba</p>","image":"https://tukki.cssrender.com/storage/app/public/7/64a42a7b2d915_ivory.jpeg","latitude":"","longitude":null},{"id":13,"city_name":"Yamoussoukro","description":"<p>Yamoussoukro</p>","image":"https://tukki.cssrender.com/storage/app/public/6/64a429e2362e0_irony1.jpeg","latitude":"","longitude":null},{"id":14,"city_name":"Zanzan","description":"<p>Zanzan</p>","image":"https://tukki.cssrender.com/storage/app/public/13/64a42bb9be90b_images-(1).jpeg","latitude":"","longitude":null}]}
/// error : ""

class LocationsModel {
  LocationsModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  LocationsModel.fromJson(dynamic json) {
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
      List<Locations>? locations,}){
    _locations = locations;
}

  Data.fromJson(dynamic json) {
    if (json['Locations'] != null) {
      _locations = [];
      json['Locations'].forEach((v) {
        _locations?.add(Locations.fromJson(v));
      });
    }
  }
  List<Locations>? _locations;
  List<Locations>? get locations => _locations;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_locations != null) {
      map['Locations'] = _locations?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Locations {
  Locations({
      num? id, 
      String? cityName, 
      String? description, 
      String? image, 
      String? latitude, 
      dynamic longitude,}){
    _id = id;
    _cityName = cityName;
    _description = description;
    _image = image;
    _latitude = latitude;
    _longitude = longitude;
}

  Locations.fromJson(dynamic json) {
    _id = json['id'];
    _cityName = json['city_name'];
    _description = json['description'];
    _image = json['image'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  num? _id;
  String? _cityName;
  String? _description;
  String? _image;
  String? _latitude;
  dynamic _longitude;

  num? get id => _id;
  String? get cityName => _cityName;
  String? get description => _description;
  String? get image => _image;
  String? get latitude => _latitude;
  dynamic get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['city_name'] = _cityName;
    map['description'] = _description;
    map['image'] = _image;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}