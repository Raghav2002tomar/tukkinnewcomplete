

class LoginModel {
  LoginModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  LoginModel.fromJson(dynamic json) {
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
      num? id, 
      String? firstName, 
      dynamic middle, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? phoneCountry, 
      dynamic defaultCountry, 
      dynamic intro,
      dynamic langauge,
      dynamic country,
      dynamic wallet,
      String? otpValue, 
      String? token, 
      String? resetToken, 
      String? verified, 
      dynamic loginType, 
      String? birthdate, 
      dynamic socialId, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic packageId, 
      dynamic fcm, 
      dynamic deviceId, 
      dynamic identityImage,
      dynamic profileImage,
      // List<dynamic>? media,
  }){
    _id = id;
    _firstName = firstName;
    _middle = middle;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _phoneCountry = phoneCountry;
    _defaultCountry = defaultCountry;
    _intro = intro;
    _langauge = langauge;
    _country = country;
    _wallet = wallet;
    _otpValue = otpValue;
    _token = token;
    _resetToken = resetToken;
    _verified = verified;
    _loginType = loginType;
    _birthdate = birthdate;
    _socialId = socialId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _packageId = packageId;
    _fcm = fcm;
    _deviceId = deviceId;
    _identityImage = identityImage;
    _profileImage = profileImage;
    // _media = media;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _middle = json['middle'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _phoneCountry = json['phone_country'];
    _defaultCountry = json['default_country'];
    _intro = json['intro'];
    _langauge = json['langauge'];
    _country = json['country'];
    _wallet = json['wallet'];
    _otpValue = json['otp_value'];
    _token = json['token'];
    _resetToken = json['reset_token'];
    _verified = json['verified'];
    _loginType = json['login_type'];
    _birthdate = json['birthdate'];
    _socialId = json['social_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _packageId = json['package_id'];
    _fcm = json['fcm'];
    _deviceId = json['device_id'];
    _identityImage = json['identity_image'];
    _profileImage = json['profile_image'];
    // if (json['media'] != null) {
    //   _media = [];
    //   json['media'].forEach((v) {
    //     // _media?.add(Dynamic.fromJson(v));
    //   });
    // }
  }
  num? _id;
  String? _firstName;
  dynamic _middle;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _phoneCountry;
  dynamic _defaultCountry;
  dynamic _intro;
  dynamic _langauge;
  dynamic _country;
  dynamic _wallet;
  String? _otpValue;
  String? _token;
  String? _resetToken;
  String? _verified;
  dynamic _loginType;
  String? _birthdate;
  dynamic _socialId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _packageId;
  dynamic _fcm;
  dynamic _deviceId;
  dynamic _identityImage;
  dynamic _profileImage;
  // List<dynamic>? _media;
  num? get id => _id;
  String? get firstName => _firstName;
  dynamic get middle => _middle;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get phoneCountry => _phoneCountry;
  dynamic get defaultCountry => _defaultCountry;
  dynamic get intro => _intro;
  dynamic get langauge => _langauge;
  dynamic get country => _country;
  dynamic get wallet => _wallet;
  String? get otpValue => _otpValue;
  String? get token => _token;
  String? get resetToken => _resetToken;
  String? get verified => _verified;
  dynamic get loginType => _loginType;
  String? get birthdate => _birthdate;
  dynamic get socialId => _socialId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get packageId => _packageId;
  dynamic get fcm => _fcm;
  dynamic get deviceId => _deviceId;
  dynamic get identityImage => _identityImage;
  dynamic get profileImage => _profileImage;
  // List<dynamic>? get media => _media;

  set firstNameSetter(value){
    _firstName =value;
  }
  set lastNameSetter(value){
    _lastName =value;
  }
  set birthdateSetter(value){
    _birthdate =value;
  }
  set profileImageSetter(value){
    _profileImage = {"url":value};
  }

  set languageSetter(value){
    _langauge = value;
  }
  set introSetter(value){
    _intro = value;
  }

  set countrySetter(value){
    _country = value;
  }
  set identitySetter(value){
    _identityImage = value;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['middle'] = _middle;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['phone_country'] = _phoneCountry;
    map['default_country'] = _defaultCountry;
    map['intro'] = _intro;
    map['langauge'] = _langauge;
    map['country'] = _country;
    map['wallet'] = _wallet;
    map['otp_value'] = _otpValue;
    map['token'] = _token;
    map['reset_token'] = _resetToken;
    map['verified'] = _verified;
    map['login_type'] = _loginType;
    map['birthdate'] = _birthdate;
    map['social_id'] = _socialId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['package_id'] = _packageId;
    map['fcm'] = _fcm;
    map['device_id'] = _deviceId;
    map['identity_image'] = _identityImage;
    map['profile_image'] = _profileImage;
    // if (_media != null) {
    //   map['media'] = _media?.map((v) => v.toJson()).toList();
    // }
    return map;
  }

}