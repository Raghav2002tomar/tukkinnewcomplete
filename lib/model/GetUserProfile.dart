/// status : 200
/// message : "global.Profile_Retrieved_Successfully"
/// data : {"name":"sizhitsolution  solutions","profile_image":"https://tukki.cssrender.com/storage/app/public/505/conversions/image_64f95ed67d25d-preview.jpg","profile_background":"https://tukki.cssrender.com/storage/app/public/505/conversions/image_64f95ed67d25d-preview.jpg","intro_text":"","total_reviews_on_properties":0,"average_rating_on_properties":0,"years_of_hosting":"10 day(s)","languages":"English","livecity":"ivory coast","age":"18 years","verified_identity":"1","verified_email":"1","verified_phone":"1"}
/// error : ""

class GetUserProfile {
  GetUserProfile({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GetUserProfile.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GetUserProfile copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GetUserProfile(  status: status ?? _status,
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

/// name : "sizhitsolution  solutions"
/// profile_image : "https://tukki.cssrender.com/storage/app/public/505/conversions/image_64f95ed67d25d-preview.jpg"
/// profile_background : "https://tukki.cssrender.com/storage/app/public/505/conversions/image_64f95ed67d25d-preview.jpg"
/// intro_text : ""
/// total_reviews_on_properties : 0
/// average_rating_on_properties : 0
/// years_of_hosting : "10 day(s)"
/// languages : "English"
/// livecity : "ivory coast"
/// age : "18 years"
/// verified_identity : "1"
/// verified_email : "1"
/// verified_phone : "1"

class Data {
  Data({
      String? name, 
      String? profileImage, 
      String? profileBackground, 
      String? introText, 
      num? totalReviewsOnProperties, 
      num? averageRatingOnProperties, 
      String? yearsOfHosting, 
      String? languages, 
      String? livecity, 
      String? age, 
      String? verifiedIdentity, 
      String? verifiedEmail, 
      String? verifiedPhone,}){
    _name = name;
    _profileImage = profileImage;
    _profileBackground = profileBackground;
    _introText = introText;
    _totalReviewsOnProperties = totalReviewsOnProperties;
    _averageRatingOnProperties = averageRatingOnProperties;
    _yearsOfHosting = yearsOfHosting;
    _languages = languages;
    _livecity = livecity;
    _age = age;
    _verifiedIdentity = verifiedIdentity;
    _verifiedEmail = verifiedEmail;
    _verifiedPhone = verifiedPhone;
}

  Data.fromJson(dynamic json) {
    _name = json['name'];
    _profileImage = json['profile_image'];
    _profileBackground = json['profile_background'];
    _introText = json['intro_text'];
    _totalReviewsOnProperties = json['total_reviews_on_properties'];
    _averageRatingOnProperties = json['average_rating_on_properties'];
    _yearsOfHosting = json['years_of_hosting'];
    _languages = json['languages'];
    _livecity = json['livecity'];
    _age = json['age'];
    _verifiedIdentity = json['verified_identity'];
    _verifiedEmail = json['verified_email'];
    _verifiedPhone = json['verified_phone'];
  }
  String? _name;
  String? _profileImage;
  String? _profileBackground;
  String? _introText;
  num? _totalReviewsOnProperties;
  num? _averageRatingOnProperties;
  String? _yearsOfHosting;
  String? _languages;
  String? _livecity;
  String? _age;
  String? _verifiedIdentity;
  String? _verifiedEmail;
  String? _verifiedPhone;
Data copyWith({  String? name,
  String? profileImage,
  String? profileBackground,
  String? introText,
  num? totalReviewsOnProperties,
  num? averageRatingOnProperties,
  String? yearsOfHosting,
  String? languages,
  String? livecity,
  String? age,
  String? verifiedIdentity,
  String? verifiedEmail,
  String? verifiedPhone,
}) => Data(  name: name ?? _name,
  profileImage: profileImage ?? _profileImage,
  profileBackground: profileBackground ?? _profileBackground,
  introText: introText ?? _introText,
  totalReviewsOnProperties: totalReviewsOnProperties ?? _totalReviewsOnProperties,
  averageRatingOnProperties: averageRatingOnProperties ?? _averageRatingOnProperties,
  yearsOfHosting: yearsOfHosting ?? _yearsOfHosting,
  languages: languages ?? _languages,
  livecity: livecity ?? _livecity,
  age: age ?? _age,
  verifiedIdentity: verifiedIdentity ?? _verifiedIdentity,
  verifiedEmail: verifiedEmail ?? _verifiedEmail,
  verifiedPhone: verifiedPhone ?? _verifiedPhone,
);
  String? get name => _name;
  String? get profileImage => _profileImage;
  String? get profileBackground => _profileBackground;
  String? get introText => _introText;
  num? get totalReviewsOnProperties => _totalReviewsOnProperties;
  num? get averageRatingOnProperties => _averageRatingOnProperties;
  String? get yearsOfHosting => _yearsOfHosting;
  String? get languages => _languages;
  String? get livecity => _livecity;
  String? get age => _age;
  String? get verifiedIdentity => _verifiedIdentity;
  String? get verifiedEmail => _verifiedEmail;
  String? get verifiedPhone => _verifiedPhone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['profile_image'] = _profileImage;
    map['profile_background'] = _profileBackground;
    map['intro_text'] = _introText;
    map['total_reviews_on_properties'] = _totalReviewsOnProperties;
    map['average_rating_on_properties'] = _averageRatingOnProperties;
    map['years_of_hosting'] = _yearsOfHosting;
    map['languages'] = _languages;
    map['livecity'] = _livecity;
    map['age'] = _age;
    map['verified_identity'] = _verifiedIdentity;
    map['verified_email'] = _verifiedEmail;
    map['verified_phone'] = _verifiedPhone;
    return map;
  }

}