
class PropertyModel {
  PropertyModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PropertyModel.fromJson(dynamic json) {
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
      List<Properties>? properties, 
      num? offset,}){
    _properties = properties;
    _offset = offset;
}

  Data.fromJson(dynamic json) {
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    _offset = json['offset'];
  }
  List<Properties>? _properties;
  num? _offset;

  List<Properties>? get properties => _properties;
  num? get offset => _offset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    return map;
  }

}

class Properties {
  Properties({
      num? id, 
      String? name, 
      String? bedrooms, 
      String? beds, 
      String? bathroom, 
      String? propertySqft, 
      String? propertyRating, 
      String? mobile, 
      String? personAllowed, 
      String? address, 
      String? stateRegion, 
      String? city, 
      String? zipPostalCode, 
      String? price, 
      String? latitude, 
      String? longitude, 
      String? status, 
      String? propertyTypeId, 
      String? image, 
      bool? isInWishlist, 
      String? propertyType,}){
    _id = id;
    _name = name;
    _bedrooms = bedrooms;
    _beds = beds;
    _bathroom = bathroom;
    _propertySqft = propertySqft;
    _propertyRating = propertyRating;
    _mobile = mobile;
    _personAllowed = personAllowed;
    _address = address;
    _stateRegion = stateRegion;
    _city = city;
    _zipPostalCode = zipPostalCode;
    _price = price;
    _latitude = latitude;
    _longitude = longitude;
    _status = status;
    _propertyTypeId = propertyTypeId;
    _image = image;
    _isInWishlist = isInWishlist;
    _propertyType = propertyType;
}

  Properties.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _bedrooms = json['bedrooms'];
    _beds = json['beds'];
    _bathroom = json['bathroom'];
    _propertySqft = json['property_sqft'];
    _propertyRating = json['property_rating'];
    _mobile = json['mobile'];
    _personAllowed = json['person_allowed'];
    _address = json['address'];
    _stateRegion = json['state_region'];
    _city = json['city'];
    _zipPostalCode = json['zip_postal_code'];
    _price = json['price'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _status = json['status'];
    _propertyTypeId = json['property_type_id'];
    _image = json['image'];
    _isInWishlist = json['is_in_wishlist'];
    _propertyType = json['property_type'];
  }
  num? _id;
  String? _name;
  String? _bedrooms;
  String? _beds;
  String? _bathroom;
  String? _propertySqft;
  String? _propertyRating;
  String? _mobile;
  String? _personAllowed;
  String? _address;
  String? _stateRegion;
  String? _city;
  String? _zipPostalCode;
  String? _price;
  String? _latitude;
  String? _longitude;
  String? _status;
  String? _propertyTypeId;
  String? _image;
  bool? _isInWishlist;
  String? _propertyType;

  num? get id => _id;
  String? get name => _name;
  String? get bedrooms => _bedrooms;
  String? get beds => _beds;
  String? get bathroom => _bathroom;
  String? get propertySqft => _propertySqft;
  String? get propertyRating => _propertyRating;
  String? get mobile => _mobile;
  String? get personAllowed => _personAllowed;
  String? get address => _address;
  String? get stateRegion => _stateRegion;
  String? get city => _city;
  String? get zipPostalCode => _zipPostalCode;
  String? get price => _price;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get status => _status;
  String? get propertyTypeId => _propertyTypeId;
  String? get image => _image;
  bool? get isInWishlist => _isInWishlist;
  String? get propertyType => _propertyType;

  set wishlistSetter(bool value){
    _isInWishlist=value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['bedrooms'] = _bedrooms;
    map['beds'] = _beds;
    map['bathroom'] = _bathroom;
    map['property_sqft'] = _propertySqft;
    map['property_rating'] = _propertyRating;
    map['mobile'] = _mobile;
    map['person_allowed'] = _personAllowed;
    map['address'] = _address;
    map['state_region'] = _stateRegion;
    map['city'] = _city;
    map['zip_postal_code'] = _zipPostalCode;
    map['price'] = _price;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['status'] = _status;
    map['property_type_id'] = _propertyTypeId;
    map['image'] = _image;
    map['is_in_wishlist'] = _isInWishlist;
    map['property_type'] = _propertyType;
    return map;
  }

}