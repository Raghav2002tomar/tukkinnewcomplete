
class MyPropertiesModel {
  MyPropertiesModel({
      num? status,
      String? message,
      Data? data,
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  MyPropertiesModel.fromJson(dynamic json) {
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
      num? offset,
      String? limit,}){
    _properties = properties;
    _offset = offset;
    _limit = limit;
}

  Data.fromJson(dynamic json) {
    if (json['properties'] != null) {
      _properties = [];
      json['properties'].forEach((v) {
        _properties?.add(Properties.fromJson(v));
      });
    }
    _offset = json['offset'];
    _limit = json['limit'];
  }
  List<Properties>? _properties;
  num? _offset;
  dynamic _limit;

  List<Properties>? get properties => _properties;
  num? get offset => _offset;
  dynamic get limit => _limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_properties != null) {
      map['properties'] = _properties?.map((v) => v.toJson()).toList();
    }
    map['offset'] = _offset;
    map['limit'] = _limit;
    return map;
  }

}

class Properties {
  Properties({
      num? id,
      String? title,
      String? description,
      String? bedrooms,
      String? beds,
      String? bathroom,
      String? propertySqft,
      String? propertyRating,
      String? mobile,
      String? status,
      String? personAllowed,
      String? price,
      String? address,
      String? stateRegion,
      String? zipPostalCode,
      String? city,
      String? country,
      String? latitude,
      String? longitude,
      String? weeklyDiscount,
      String? weeklyDiscountType,
      String? monthlyDiscount,
      String? monthlyDiscountType,
      String? propertyTypeId,
      String? amenitiesId,
      String? placeId,
      String? bookingPoliciesId,
      String? propertyType,
      FrontImage? frontImage,
      List<Gallery>? gallery,
    String? availableDates,
    List<NotAvailableDates>? notAvailableDates,
    List<BookedDates>? bookedDates,
  }){
    _id = id;
    _title = title;
    _description = description;
    _bedrooms = bedrooms;
    _beds = beds;
    _bathroom = bathroom;
    _propertySqft = propertySqft;
    _propertyRating = propertyRating;
    _mobile = mobile;
    _status = status;
    _personAllowed = personAllowed;
    _price = price;
    _address = address;
    _stateRegion = stateRegion;
    _zipPostalCode = zipPostalCode;
    _city = city;
    _country = country;
    _latitude = latitude;
    _longitude = longitude;
    _weeklyDiscount = weeklyDiscount;
    _weeklyDiscountType = weeklyDiscountType;
    _monthlyDiscount = monthlyDiscount;
    _monthlyDiscountType = monthlyDiscountType;
    _propertyTypeId = propertyTypeId;
    _amenitiesId = amenitiesId;
    _placeId = placeId;
    _bookingPoliciesId = bookingPoliciesId;
    _propertyType = propertyType;
    _frontImage = frontImage;
    _gallery = gallery;
    _availableDates = availableDates;
    _notAvailableDates = notAvailableDates;
    _bookedDates = bookedDates;
}

  Properties.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _bedrooms = json['bedrooms'];
    _beds = json['beds'];
    _bathroom = json['bathroom'];
    _propertySqft = json['property_sqft'];
    _propertyRating = json['property_rating'];
    _mobile = json['mobile'];
    _status = json['status'];
    _personAllowed = json['person_allowed'];
    _price = json['price'];
    _address = json['address'];
    _stateRegion = json['state_region'];
    _zipPostalCode = json['zip_postal_code'];
    _city = json['city'];
    _country = json['country'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _weeklyDiscount = json['weekly_discount'];
    _weeklyDiscountType = json['weekly_discount_type'];
    _monthlyDiscount = json['monthly_discount'];
    _monthlyDiscountType = json['monthly_discount_type'];
    _propertyTypeId = json['property_type_id'];
    _amenitiesId = json['amenities_id'];
    _placeId = json['place_id'];
    _bookingPoliciesId = json['booking_policies_id'];
    _propertyType = json['property_type'];
    _frontImage = json['front_image'] != null ? FrontImage.fromJson(json['front_image']) : null;

    if (json['gallery'] != null) {
      _gallery = [];
      json['gallery'].forEach((v) {
        _gallery?.add(Gallery.fromJson(v));
      });
    }
    _availableDates=json['available_dates'];
    // if (json['available_dates'] != null) {
    //   _availableDates = [];
    //   json['available_dates'].forEach((v) {
    //     _availableDates?.add(AvailableDates.fromJson(v));
    //   });
    // }
    if (json['not_available_dates'] != null) {
      _notAvailableDates = [];
      json['not_available_dates'].forEach((v) {
        _notAvailableDates?.add(NotAvailableDates.fromJson(v));
      });
    }
    if (json['booked_dates'] != null) {
      _bookedDates = [];
      json['booked_dates'].forEach((v) {
        _bookedDates?.add(BookedDates.fromJson(v));
      });
    }

  }
  num? _id;
  String? _title;
  String? _description;
  String? _bedrooms;
  String? _beds;
  String? _bathroom;
  String? _propertySqft;
  String? _propertyRating;
  String? _mobile;
  String? _status;
  String? _personAllowed;
  String? _price;
  String? _address;
  String? _stateRegion;
  String? _city;
  String? _zipPostalCode;
  String? _country;
  String? _latitude;
  String? _longitude;
  String? _weeklyDiscount;
  String? _weeklyDiscountType;
  String? _monthlyDiscount;
  String? _monthlyDiscountType;
  String? _propertyTypeId;
  String? _amenitiesId;
  String? _placeId;
  String? _bookingPoliciesId;
  String? _propertyType;
  FrontImage? _frontImage;
  List<Gallery>? _gallery;
  String? _availableDates;
  List<NotAvailableDates>? _notAvailableDates;
  List<BookedDates>? _bookedDates;

  num? get id => _id;
  String? get title => _title;
  String? get description => _description;
  String? get bedrooms => _bedrooms;
  String? get beds => _beds;
  String? get bathroom => _bathroom;
  String? get propertySqft => _propertySqft;
  String? get propertyRating => _propertyRating;
  String? get mobile => _mobile;
  String? get status => _status;
  String? get personAllowed => _personAllowed;
  String? get price => _price;
  String? get address => _address;
  String? get stateRegion => _stateRegion;
  String? get zipPostalCode => _zipPostalCode;
  String? get city => _city;
  String? get country => _country;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get weeklyDiscount => _weeklyDiscount;
  String? get weeklyDiscountType => _weeklyDiscountType;
  String? get monthlyDiscount => _monthlyDiscount;
  String? get monthlyDiscountType => _monthlyDiscountType;
  String? get propertyTypeId => _propertyTypeId;
  String? get amenitiesId => _amenitiesId;
  String? get placeId => _placeId;
  String? get bookingPoliciesId => _bookingPoliciesId;
  String? get propertyType => _propertyType;
  FrontImage? get frontImage => _frontImage;
  List<Gallery>? get gallery => _gallery;
  String? get availableDates => _availableDates;
  List<NotAvailableDates>? get notAvailableDates => _notAvailableDates;
  List<BookedDates>? get bookedDates => _bookedDates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['bedrooms'] = _bedrooms;
    map['beds'] = _beds;
    map['bathroom'] = _bathroom;
    map['property_sqft'] = _propertySqft;
    map['property_rating'] = _propertyRating;
    map['mobile'] = _mobile;
    map['status'] = _status;
    map['person_allowed'] = _personAllowed;
    map['price'] = _price;
    map['address'] = _address;
    map['state_region'] = _stateRegion;
    map['zip_postal_code'] = _zipPostalCode;
    map['city'] = _city;
    map['country'] = _country;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['weekly_discount'] = _weeklyDiscount;
    map['weekly_discount_type'] = _weeklyDiscountType;
    map['monthly_discount'] = _monthlyDiscount;
    map['monthly_discount_type'] = _monthlyDiscountType;
    map['property_type_id'] = _propertyTypeId;
    map['amenities_id'] = _amenitiesId;
    map['place_id'] = _placeId;
    map['booking_policies_id'] = _bookingPoliciesId;
    map['property_type'] = _propertyType;


    if (_frontImage != null) {
      map['front_image'] = _frontImage?.toJson();
    }
    if (_gallery != null) {
      map['gallery'] = _gallery?.map((v) => v.toJson()).toList();
    }

    map['available_dates']=_availableDates;
    // if (_availableDates != null) {
    //   map['available_dates'] = _availableDates?.map((v) => v.toJson()).toList();
    // }
    if (_notAvailableDates != null) {
      map['not_available_dates'] = _notAvailableDates?.map((v) => v.toJson()).toList();
    }
    if (_bookedDates != null) {
      map['booked_dates'] = _bookedDates?.map((v) => v.toJson()).toList();
    }

    return map;
  }

}

class Gallery {
  Gallery({
      num? id,
      String? modelType,
      String? modelId,
      String? uuid,
      String? collectionName,
      String? name,
      String? fileName,
      String? mimeType,
      String? disk,
      String? conversionsDisk,
      String? size,
      String? orderColumn,
      String? createdAt,
      String? updatedAt,
      String? url,
      String? thumbnail,
      String? preview,
      String? originalUrl,
      String? previewUrl,}){
    _id = id;
    _modelType = modelType;
    _modelId = modelId;
    _uuid = uuid;
    _collectionName = collectionName;
    _name = name;
    _fileName = fileName;
    _mimeType = mimeType;
    _disk = disk;
    _conversionsDisk = conversionsDisk;
    _size = size;
    _orderColumn = orderColumn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _url = url;
    _thumbnail = thumbnail;
    _preview = preview;
    _originalUrl = originalUrl;
    _previewUrl = previewUrl;
}

  Gallery.fromJson(dynamic json) {
    _id = json['id'];
    _modelType = json['model_type'];
    _modelId = json['model_id'];
    _uuid = json['uuid'];
    _collectionName = json['collection_name'];
    _name = json['name'];
    _fileName = json['file_name'];
    _mimeType = json['mime_type'];
    _disk = json['disk'];
    _conversionsDisk = json['conversions_disk'];
    _size = json['size'];
    _orderColumn = json['order_column'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _url = json['url'];
    _thumbnail = json['thumbnail'];
    _preview = json['preview'];
    _originalUrl = json['original_url'];
    _previewUrl = json['preview_url'];
  }
  num? _id;
  String? _modelType;
  String? _modelId;
  String? _uuid;
  String? _collectionName;
  String? _name;
  String? _fileName;
  String? _mimeType;
  String? _disk;
  String? _conversionsDisk;
  String? _size;
  List<dynamic>? _manipulations;
  List<dynamic>? _customProperties;
  List<dynamic>? _responsiveImages;
  String? _orderColumn;
  String? _createdAt;
  String? _updatedAt;
  String? _url;
  String? _thumbnail;
  String? _preview;
  String? _originalUrl;
  String? _previewUrl;

  num? get id => _id;
  String? get modelType => _modelType;
  String? get modelId => _modelId;
  String? get uuid => _uuid;
  String? get collectionName => _collectionName;
  String? get name => _name;
  String? get fileName => _fileName;
  String? get mimeType => _mimeType;
  String? get disk => _disk;
  String? get conversionsDisk => _conversionsDisk;
  String? get size => _size;
  List<dynamic>? get manipulations => _manipulations;
  List<dynamic>? get customProperties => _customProperties;
  List<dynamic>? get responsiveImages => _responsiveImages;
  String? get orderColumn => _orderColumn;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get url => _url;
  String? get thumbnail => _thumbnail;
  String? get preview => _preview;
  String? get originalUrl => _originalUrl;
  String? get previewUrl => _previewUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['model_type'] = _modelType;
    map['model_id'] = _modelId;
    map['uuid'] = _uuid;
    map['collection_name'] = _collectionName;
    map['name'] = _name;
    map['file_name'] = _fileName;
    map['mime_type'] = _mimeType;
    map['disk'] = _disk;
    map['conversions_disk'] = _conversionsDisk;
    map['size'] = _size;
    if (_manipulations != null) {
      map['manipulations'] = _manipulations?.map((v) => v.toJson()).toList();
    }
    if (_customProperties != null) {
      map['custom_properties'] = _customProperties?.map((v) => v.toJson()).toList();
    }
    if (_responsiveImages != null) {
      map['responsive_images'] = _responsiveImages?.map((v) => v.toJson()).toList();
    }
    map['order_column'] = _orderColumn;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    map['thumbnail'] = _thumbnail;
    map['preview'] = _preview;
    map['original_url'] = _originalUrl;
    map['preview_url'] = _previewUrl;
    return map;
  }

}

class FrontImage {
  FrontImage({
      num? id,
      String? modelType,
      String? modelId,
      String? uuid,
      String? collectionName,
      String? name,
      String? fileName,
      String? mimeType,
      String? disk,
      String? conversionsDisk,
      String? size,
      List<dynamic>? manipulations,
      List<dynamic>? customProperties,
      List<dynamic>? responsiveImages,
      String? orderColumn,
      String? createdAt,
      String? updatedAt,
      String? url,
      String? thumbnail,
      String? preview,
      String? originalUrl,
      String? previewUrl,}){
    _id = id;
    _modelType = modelType;
    _modelId = modelId;
    _uuid = uuid;
    _collectionName = collectionName;
    _name = name;
    _fileName = fileName;
    _mimeType = mimeType;
    _disk = disk;
    _conversionsDisk = conversionsDisk;
    _size = size;
    _manipulations = manipulations;
    _customProperties = customProperties;
    _responsiveImages = responsiveImages;
    _orderColumn = orderColumn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _url = url;
    _thumbnail = thumbnail;
    _preview = preview;
    _originalUrl = originalUrl;
    _previewUrl = previewUrl;
}

  FrontImage.fromJson(dynamic json) {
    _id = json['id'];
    _modelType = json['model_type'];
    _modelId = json['model_id'];
    _uuid = json['uuid'];
    _collectionName = json['collection_name'];
    _name = json['name'];
    _fileName = json['file_name'];
    _mimeType = json['mime_type'];
    _disk = json['disk'];
    _conversionsDisk = json['conversions_disk'];
    _size = json['size'];
    _orderColumn = json['order_column'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _url = json['url'];
    _thumbnail = json['thumbnail'];
    _preview = json['preview'];
    _originalUrl = json['original_url'];
    _previewUrl = json['preview_url'];
  }
  num? _id;
  String? _modelType;
  String? _modelId;
  String? _uuid;
  String? _collectionName;
  String? _name;
  String? _fileName;
  String? _mimeType;
  String? _disk;
  String? _conversionsDisk;
  String? _size;
  List<dynamic>? _manipulations;
  List<dynamic>? _customProperties;
  List<dynamic>? _responsiveImages;
  String? _orderColumn;
  String? _createdAt;
  String? _updatedAt;
  String? _url;
  String? _thumbnail;
  String? _preview;
  String? _originalUrl;
  String? _previewUrl;

  num? get id => _id;
  String? get modelType => _modelType;
  String? get modelId => _modelId;
  String? get uuid => _uuid;
  String? get collectionName => _collectionName;
  String? get name => _name;
  String? get fileName => _fileName;
  String? get mimeType => _mimeType;
  String? get disk => _disk;
  String? get conversionsDisk => _conversionsDisk;
  String? get size => _size;
  List<dynamic>? get manipulations => _manipulations;
  List<dynamic>? get customProperties => _customProperties;
  List<dynamic>? get responsiveImages => _responsiveImages;
  String? get orderColumn => _orderColumn;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get url => _url;
  String? get thumbnail => _thumbnail;
  String? get preview => _preview;
  String? get originalUrl => _originalUrl;
  String? get previewUrl => _previewUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['model_type'] = _modelType;
    map['model_id'] = _modelId;
    map['uuid'] = _uuid;
    map['collection_name'] = _collectionName;
    map['name'] = _name;
    map['file_name'] = _fileName;
    map['mime_type'] = _mimeType;
    map['disk'] = _disk;
    map['conversions_disk'] = _conversionsDisk;
    map['size'] = _size;
    if (_manipulations != null) {
      map['manipulations'] = _manipulations?.map((v) => v.toJson()).toList();
    }
    if (_customProperties != null) {
      map['custom_properties'] = _customProperties?.map((v) => v.toJson()).toList();
    }
    if (_responsiveImages != null) {
      map['responsive_images'] = _responsiveImages?.map((v) => v.toJson()).toList();
    }
    map['order_column'] = _orderColumn;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['url'] = _url;
    map['thumbnail'] = _thumbnail;
    map['preview'] = _preview;
    map['original_url'] = _originalUrl;
    map['preview_url'] = _previewUrl;
    return map;
  }

}



class NotAvailableDates {
  NotAvailableDates({
    String? date,
    String? price,}){
    _date = date;
    _price = price;
  }

  NotAvailableDates.fromJson(dynamic json) {
    _date = json['date'];
    _price = json['price'];
  }
  String? _date;
  String? _price;
  NotAvailableDates copyWith({  String? date,
    String? price,
  }) => NotAvailableDates(  date: date ?? _date,
    price: price ?? _price,
  );
  String? get date => _date;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['price'] = _price;
    return map;
  }

}

/// date : "2023-01-18"
/// price : "250.00"

// class AvailableDates {
//   AvailableDates({
//     String? date,
//     String? price,}){
//     _date = date;
//     _price = price;
//   }
//
//   AvailableDates.fromJson(dynamic json) {
//     _date = json['date'];
//     _price = json['price'];
//   }
//   String? _date;
//   String? _price;
//   AvailableDates copyWith({  String? date,
//     String? price,
//   }) => AvailableDates(  date: date ?? _date,
//     price: price ?? _price,
//   );
//   String? get date => _date;
//   String? get price => _price;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['date'] = _date;
//     map['price'] = _price;
//     return map;
//   }
//
// }


class BookedDates {
  BookedDates({
    String? date,
    String? price,}){
    _date = date;
    _price = price;
  }

  BookedDates.fromJson(dynamic json) {
    _date = json['date'];
    _price = json['price'];
  }
  String? _date;
  String? _price;
  BookedDates copyWith({  String? date,
    String? price,
  }) => BookedDates(  date: date ?? _date,
    price: price ?? _price,
  );
  String? get date => _date;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['price'] = _price;
    return map;
  }

}


