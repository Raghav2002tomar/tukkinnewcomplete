/// status : 200
/// message : "global.Result_found"
/// data : {"properties":[{"id":13,"name":"Residence Eburnea","bedrooms":"3","beds":"5","bathroom":"3","property_sqft":"232","property_rating":"4.08","mobile":"08457624267","person_allowed":"4","address":"Banco Nord Abidjan Côte d’Ivoire, Yopougon, Vallée du Bandama, Côte ivory cost","state_region":"Africa","city":"Africa","zip_postal_code":"CAPE TOWN","price":"421.00","latitude":"5.345521","longitude":"-4.054149","status":"1","property_type_id":"3","image":"https://tukki.cssrender.com/storage/app/public/212/conversions/64edb88bc56be_image07-thumb.jpg","is_in_wishlist":false,"property_type":"Treehouse"},{"id":144,"name":"Hotel great palace","bedrooms":"2","beds":"7","bathroom":"6","property_sqft":"638","property_rating":"0.00","mobile":null,"person_allowed":"6","address":"Grand-Bassam, Côte d'Ivoire","state_region":null,"city":null,"zip_postal_code":null,"price":"519.00","latitude":"5.225936","longitude":"-3.735980","status":"1","property_type_id":"2","image":"https://tukki.cssrender.com/storage/app/public/517/conversions/image_64fae8528a6e5-thumb.jpg","is_in_wishlist":false,"property_type":"Villa"},{"id":145,"name":"Shree ji palace","bedrooms":"3","beds":"5","bathroom":"5","property_sqft":"765","property_rating":"0.00","mobile":null,"person_allowed":"5","address":"Bouake, Côte d'Ivoire","state_region":null,"city":null,"zip_postal_code":null,"price":"459.00","latitude":"7.683333","longitude":"-5.016667","status":"1","property_type_id":"14","image":"https://tukki.cssrender.com/storage/app/public/523/conversions/image_64faeaa75b1b1-thumb.jpg","is_in_wishlist":false,"property_type":"Island"},{"id":216,"name":"abcdef","bedrooms":"2","beds":"2","bathroom":"2","property_sqft":"38","property_rating":"2.00","mobile":"09865984758","person_allowed":"2","address":"Riviera golf 4 beverly hills , Abidjan, Ivory Coast","state_region":"California","city":"California","zip_postal_code":"0025","price":"205.00","latitude":"5.88669","longitude":"-4.024429","status":"1","property_type_id":"2","image":"https://tukki.cssrender.com/storage/app/public/629/conversions/6509426e71716_1694700832242_3001865-full_size_3x2-t1694701031-thumb.jpg","is_in_wishlist":false,"property_type":"Villa"},{"id":217,"name":"Large furnished villa for rent at Riviera golf 4 1","bedrooms":null,"beds":"3","bathroom":"3","property_sqft":"38","property_rating":"4.00","mobile":"09876548965","person_allowed":"3","address":"64 Jones Road, Kempton Park, OR Tambo International Airport, Greater OR Tambo","state_region":null,"city":null,"zip_postal_code":null,"price":"547.00","latitude":"5.345317","longitude":"-4.024429","status":"1","property_type_id":"3","image":"https://tukki.cssrender.com/storage/app/public/661/conversions/650da14b50f32_330281531-thumb.jpg","is_in_wishlist":false,"property_type":"Treehouse"}],"offset":5}
/// error : ""

class GetUserProperties {
  GetUserProperties({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetUserProperties.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetUserProperties copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetUserProperties(  status: status ?? _status,
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

/// properties : [{"id":13,"name":"Residence Eburnea","bedrooms":"3","beds":"5","bathroom":"3","property_sqft":"232","property_rating":"4.08","mobile":"08457624267","person_allowed":"4","address":"Banco Nord Abidjan Côte d’Ivoire, Yopougon, Vallée du Bandama, Côte ivory cost","state_region":"Africa","city":"Africa","zip_postal_code":"CAPE TOWN","price":"421.00","latitude":"5.345521","longitude":"-4.054149","status":"1","property_type_id":"3","image":"https://tukki.cssrender.com/storage/app/public/212/conversions/64edb88bc56be_image07-thumb.jpg","is_in_wishlist":false,"property_type":"Treehouse"},{"id":144,"name":"Hotel great palace","bedrooms":"2","beds":"7","bathroom":"6","property_sqft":"638","property_rating":"0.00","mobile":null,"person_allowed":"6","address":"Grand-Bassam, Côte d'Ivoire","state_region":null,"city":null,"zip_postal_code":null,"price":"519.00","latitude":"5.225936","longitude":"-3.735980","status":"1","property_type_id":"2","image":"https://tukki.cssrender.com/storage/app/public/517/conversions/image_64fae8528a6e5-thumb.jpg","is_in_wishlist":false,"property_type":"Villa"},{"id":145,"name":"Shree ji palace","bedrooms":"3","beds":"5","bathroom":"5","property_sqft":"765","property_rating":"0.00","mobile":null,"person_allowed":"5","address":"Bouake, Côte d'Ivoire","state_region":null,"city":null,"zip_postal_code":null,"price":"459.00","latitude":"7.683333","longitude":"-5.016667","status":"1","property_type_id":"14","image":"https://tukki.cssrender.com/storage/app/public/523/conversions/image_64faeaa75b1b1-thumb.jpg","is_in_wishlist":false,"property_type":"Island"},{"id":216,"name":"abcdef","bedrooms":"2","beds":"2","bathroom":"2","property_sqft":"38","property_rating":"2.00","mobile":"09865984758","person_allowed":"2","address":"Riviera golf 4 beverly hills , Abidjan, Ivory Coast","state_region":"California","city":"California","zip_postal_code":"0025","price":"205.00","latitude":"5.88669","longitude":"-4.024429","status":"1","property_type_id":"2","image":"https://tukki.cssrender.com/storage/app/public/629/conversions/6509426e71716_1694700832242_3001865-full_size_3x2-t1694701031-thumb.jpg","is_in_wishlist":false,"property_type":"Villa"},{"id":217,"name":"Large furnished villa for rent at Riviera golf 4 1","bedrooms":null,"beds":"3","bathroom":"3","property_sqft":"38","property_rating":"4.00","mobile":"09876548965","person_allowed":"3","address":"64 Jones Road, Kempton Park, OR Tambo International Airport, Greater OR Tambo","state_region":null,"city":null,"zip_postal_code":null,"price":"547.00","latitude":"5.345317","longitude":"-4.024429","status":"1","property_type_id":"3","image":"https://tukki.cssrender.com/storage/app/public/661/conversions/650da14b50f32_330281531-thumb.jpg","is_in_wishlist":false,"property_type":"Treehouse"}]
/// offset : 5

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
Data copyWith({  List<Properties>? properties,
  num? offset,
}) => Data(  properties: properties ?? _properties,
  offset: offset ?? _offset,
);
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

/// id : 13
/// name : "Residence Eburnea"
/// bedrooms : "3"
/// beds : "5"
/// bathroom : "3"
/// property_sqft : "232"
/// property_rating : "4.08"
/// mobile : "08457624267"
/// person_allowed : "4"
/// address : "Banco Nord Abidjan Côte d’Ivoire, Yopougon, Vallée du Bandama, Côte ivory cost"
/// state_region : "Africa"
/// city : "Africa"
/// zip_postal_code : "CAPE TOWN"
/// price : "421.00"
/// latitude : "5.345521"
/// longitude : "-4.054149"
/// status : "1"
/// property_type_id : "3"
/// image : "https://tukki.cssrender.com/storage/app/public/212/conversions/64edb88bc56be_image07-thumb.jpg"
/// is_in_wishlist : false
/// property_type : "Treehouse"

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
Properties copyWith({  num? id,
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
  String? propertyType,
}) => Properties(  id: id ?? _id,
  name: name ?? _name,
  bedrooms: bedrooms ?? _bedrooms,
  beds: beds ?? _beds,
  bathroom: bathroom ?? _bathroom,
  propertySqft: propertySqft ?? _propertySqft,
  propertyRating: propertyRating ?? _propertyRating,
  mobile: mobile ?? _mobile,
  personAllowed: personAllowed ?? _personAllowed,
  address: address ?? _address,
  stateRegion: stateRegion ?? _stateRegion,
  city: city ?? _city,
  zipPostalCode: zipPostalCode ?? _zipPostalCode,
  price: price ?? _price,
  latitude: latitude ?? _latitude,
  longitude: longitude ?? _longitude,
  status: status ?? _status,
  propertyTypeId: propertyTypeId ?? _propertyTypeId,
  image: image ?? _image,
  isInWishlist: isInWishlist ?? _isInWishlist,
  propertyType: propertyType ?? _propertyType,
);
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