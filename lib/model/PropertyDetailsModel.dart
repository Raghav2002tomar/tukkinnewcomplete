
class PropertyDetailsModel {
  PropertyDetailsModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  PropertyDetailsModel.fromJson(dynamic json) {
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
      PropertyDetails? propertyDetails,}){
    _propertyDetails = propertyDetails;
}

  Data.fromJson(dynamic json) {
    _propertyDetails = json['PropertyDetails'] != null ? PropertyDetails.fromJson(json['PropertyDetails']) : null;
  }
  PropertyDetails? _propertyDetails;

  PropertyDetails? get propertyDetails => _propertyDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_propertyDetails != null) {
      map['PropertyDetails'] = _propertyDetails?.toJson();
    }
    return map;
  }

}

class PropertyDetails {
  PropertyDetails({
      num? propertyId, 
      String? title, 
      String? price, 
      String? description, 
      String? bedrooms, 
      String? beds, 
      String? bathroom, 
      String? propertySqft, 
      String? propertyRating, 
      String? mobile, 
      String? status, 
      String? personAllowed, 
      String? address, 
      String? stateRegion, 
      String? zipPostalCode, 
      String? latitude, 
      String? longitude, 
      String? isVerified, 
      String? isFeatured, 
      String? weeklyDiscount, 
      String? weeklyDiscountType, 
      String? monthlyDiscount, 
      String? monthlyDiscountType, 
      String? propertyType, 
      dynamic cancellationReason, 
      String? bedType, 
      String? city, 
      List<Amenities>? amenities, 
      List<AvailableDates>? availableDates,
      String? hostId,
      String? hostFirstName, 
      String? hostLastName, 
      String? hostEmail,
    String? hostProfileImage,
      String? frontImageUrl, 
      List<String>? galleryImageUrls, 
      List<Reviews>? reviews, 
      num? totalReviews,
      String? itemData,

  }){
    _propertyId = propertyId;
    _title = title;
    _price = price;
    _description = description;
    _bedrooms = bedrooms;
    _beds = beds;
    _bathroom = bathroom;
    _propertySqft = propertySqft;
    _propertyRating = propertyRating;
    _mobile = mobile;
    _status = status;
    _personAllowed = personAllowed;
    _address = address;
    _stateRegion = stateRegion;
    _zipPostalCode = zipPostalCode;
    _latitude = latitude;
    _longitude = longitude;
    _isVerified = isVerified;
    _isFeatured = isFeatured;
    _weeklyDiscount = weeklyDiscount;
    _weeklyDiscountType = weeklyDiscountType;
    _monthlyDiscount = monthlyDiscount;
    _monthlyDiscountType = monthlyDiscountType;
    _propertyType = propertyType;
    _cancellationReason = cancellationReason;
    _bedType = bedType;
    _city = city;
    _amenities = amenities;
    _availableDates = availableDates;
    _hostId = hostId;
    _hostFirstName = hostFirstName;
    _hostLastName = hostLastName;
    _hostEmail = hostEmail;
    _hostProfileImage = hostProfileImage;
    _frontImageUrl = frontImageUrl;
    _galleryImageUrls = galleryImageUrls;
    _reviews = reviews;
    _totalReviews = totalReviews;
    _itemData = itemData;
}

  PropertyDetails.fromJson(dynamic json) {
    _propertyId = json['property_id'];
    _title = json['title'];
    _price = json['price'];
    _description = json['description'];
    _bedrooms = json['bedrooms'];
    _beds = json['beds'];
    _bathroom = json['bathroom'];
    _propertySqft = json['property_sqft'];
    _propertyRating = json['property_rating'];
    _mobile = json['mobile'];
    _status = json['status'];
    _personAllowed = json['person_allowed'];
    _address = json['address'];
    _stateRegion = json['state_region'];
    _zipPostalCode = json['zip_postal_code'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
    _isVerified = json['is_verified'];
    _isFeatured = json['is_featured'];
    _weeklyDiscount = json['weekly_discount'];
    _weeklyDiscountType = json['weekly_discount_type'];
    _monthlyDiscount = json['monthly_discount'];
    _monthlyDiscountType = json['monthly_discount_type'];
    _propertyType = json['property_type'];
    _cancellationReason = json['cancellation_reason'];
    _bedType = json['bed_type'];
    _city = json['city'];
    if (json['amenities'] != null) {
      _amenities = [];
      json['amenities'].forEach((v) {
        _amenities?.add(Amenities.fromJson(v));
      });
    }
    if (json['available_dates'] != null) {
      _availableDates = [];
      json['available_dates'].forEach((v) {
        _availableDates?.add(AvailableDates.fromJson(v));
      });
    }
    _hostId = json['host_id'];
    _hostFirstName = json['host_first_name'];
    _hostLastName = json['host_last_name'];
    _hostEmail = json['host_email'];
    _hostProfileImage = json['host_profile_image'];
    _frontImageUrl = json['front_image_url'];
    _galleryImageUrls = json['gallery_image_urls'] != null ? json['gallery_image_urls'].cast<String>() : [];
    if (json['reviews'] != null) {
      _reviews = [];
      json['reviews'].forEach((v) {
        _reviews?.add(Reviews.fromJson(v));
      });
    }
    _totalReviews = json['total_reviews'];
    _itemData = json['item_data'];
  }
  num? _propertyId;
  String? _title;
  String? _price;
  String? _description;
  String? _bedrooms;
  String? _beds;
  String? _bathroom;
  String? _propertySqft;
  String? _propertyRating;
  String? _mobile;
  String? _status;
  String? _personAllowed;
  String? _address;
  String? _stateRegion;
  String? _zipPostalCode;
  String? _latitude;
  String? _longitude;
  String? _isVerified;
  String? _isFeatured;
  String? _weeklyDiscount;
  String? _weeklyDiscountType;
  String? _monthlyDiscount;
  String? _monthlyDiscountType;
  String? _propertyType;
  dynamic _cancellationReason;
  String? _bedType;
  String? _city;
  List<Amenities>? _amenities;
  List<AvailableDates>? _availableDates;
  String? _hostId;
  String? _hostFirstName;
  String? _hostLastName;
  String? _hostEmail;
  String? _hostProfileImage;
  String? _frontImageUrl;
  List<String>? _galleryImageUrls;
  List<Reviews>? _reviews;
  num? _totalReviews;
  String? _itemData;

  num? get propertyId => _propertyId;
  String? get title => _title;
  String? get price => _price;
  String? get description => _description;
  String? get bedrooms => _bedrooms;
  String? get beds => _beds;
  String? get bathroom => _bathroom;
  String? get propertySqft => _propertySqft;
  String? get propertyRating => _propertyRating;
  String? get mobile => _mobile;
  String? get status => _status;
  String? get personAllowed => _personAllowed;
  String? get address => _address;
  String? get stateRegion => _stateRegion;
  String? get zipPostalCode => _zipPostalCode;
  String? get latitude => _latitude;
  String? get longitude => _longitude;
  String? get isVerified => _isVerified;
  String? get isFeatured => _isFeatured;
  String? get weeklyDiscount => _weeklyDiscount;
  String? get weeklyDiscountType => _weeklyDiscountType;
  String? get monthlyDiscount => _monthlyDiscount;
  String? get monthlyDiscountType => _monthlyDiscountType;
  String? get propertyType => _propertyType;
  dynamic get cancellationReason => _cancellationReason;
  String? get bedType => _bedType;
  String? get city => _city;
  List<Amenities>? get amenities => _amenities;
  List<AvailableDates>? get availableDates => _availableDates;
  String? get hostId => _hostId;
  String? get hostFirstName => _hostFirstName;
  String? get hostLastName => _hostLastName;
  String? get hostEmail => _hostEmail;
  String? get hostProfileImage => _hostProfileImage;
  String? get frontImageUrl => _frontImageUrl;
  List<String>? get galleryImageUrls => _galleryImageUrls;
  List<Reviews>? get reviews => _reviews;
  num? get totalReviews => _totalReviews;
  String? get itemData => _itemData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['property_id'] = _propertyId;
    map['title'] = _title;
    map['price'] = _price;
    map['description'] = _description;
    map['bedrooms'] = _bedrooms;
    map['beds'] = _beds;
    map['bathroom'] = _bathroom;
    map['property_sqft'] = _propertySqft;
    map['property_rating'] = _propertyRating;
    map['mobile'] = _mobile;
    map['status'] = _status;
    map['person_allowed'] = _personAllowed;
    map['address'] = _address;
    map['state_region'] = _stateRegion;
    map['zip_postal_code'] = _zipPostalCode;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    map['is_verified'] = _isVerified;
    map['is_featured'] = _isFeatured;
    map['weekly_discount'] = _weeklyDiscount;
    map['weekly_discount_type'] = _weeklyDiscountType;
    map['monthly_discount'] = _monthlyDiscount;
    map['monthly_discount_type'] = _monthlyDiscountType;
    map['property_type'] = _propertyType;
    map['cancellation_reason'] = _cancellationReason;
    map['bed_type'] = _bedType;
    map['city'] = _city;
    if (_amenities != null) {
      map['amenities'] = _amenities?.map((v) => v.toJson()).toList();
    }
    if (_availableDates != null) {
      map['available_dates'] = _availableDates?.map((v) => v.toJson()).toList();
    }
    map['host_id'] = _hostId;
    map['host_first_name'] = _hostFirstName;
    map['host_last_name'] = _hostLastName;
    map['host_email'] = _hostEmail;
    map['host_profile_image'] = _hostProfileImage;
    map['front_image_url'] = _frontImageUrl;
    map['gallery_image_urls'] = _galleryImageUrls;
    if (_reviews != null) {
      map['reviews'] = _reviews?.map((v) => v.toJson()).toList();
    }
    map['total_reviews'] = _totalReviews;
    map['item_data'] = _itemData;
    return map;
  }

}

class Reviews {
  Reviews({
      num? id, 
      String? bookingId, 
      String? guestId, 
      String? guestName, 
      String? guestProfileImage, 
      String? rating, 
      String? message, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _bookingId = bookingId;
    _guestId = guestId;
    _guestName = guestName;
    _guestProfileImage = guestProfileImage;
    _rating = rating;
    _message = message;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Reviews.fromJson(dynamic json) {
    _id = json['id'];
    _bookingId = json['booking_id'];
    _guestId = json['guest_id'];
    _guestName = json['guest_name'];
    _guestProfileImage = json['guest_profile_image'];
    _rating = json['rating'];
    _message = json['message'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _bookingId;
  String? _guestId;
  String? _guestName;
  String? _guestProfileImage;
  String? _rating;
  String? _message;
  String? _createdAt;
  String? _updatedAt;

  num? get id => _id;
  String? get bookingId => _bookingId;
  String? get guestId => _guestId;
  String? get guestName => _guestName;
  String? get guestProfileImage => _guestProfileImage;
  String? get rating => _rating;
  String? get message => _message;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['booking_id'] = _bookingId;
    map['guest_id'] = _guestId;
    map['guest_name'] = _guestName;
    map['guest_profile_image'] = _guestProfileImage;
    map['rating'] = _rating;
    map['message'] = _message;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}

class Amenities {
  Amenities({
      num? id, 
      String? name, 
      String? imageUrl,}){
    _id = id;
    _name = name;
    _imageUrl = imageUrl;
}

  Amenities.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _imageUrl = json['image_url'];
  }
  num? _id;
  String? _name;
  String? _imageUrl;

  num? get id => _id;
  String? get name => _name;
  String? get imageUrl => _imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['image_url'] = _imageUrl;
    return map;
  }

}

class AvailableDates {
  AvailableDates({
      String? date,
      String? price,}){
    _date = date;
    _price = price;}

  AvailableDates.fromJson(dynamic json) {
    _date = json['date'];
    _price = json['price'];
  }
  String? _date;
  String? _price;

  String? get date => _date;
  String? get price => _price;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['price'] = _price;
    return map;
  }

}