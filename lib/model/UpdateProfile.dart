/// status : 200
/// message : "global.profile_updated_successfully"
/// data : {"user":{"id":324,"first_name":"Shubham","middle":null,"last_name":"Qerty","email":"shubham@gmail.com","phone":"45458484848","phone_country":"+225","default_country":"CI","intro":"eqwewe r r the r. r rrrrrr","langauge":"wqeqw","country":"Åland Islands","wallet":null,"otp_value":"5126","token":"87JVR6oSQCP3yqMseYof98V9MJxzRc9iM2ojdRRkVjTcfNAoWLJHSHysT7Fu32kbnTTs5zvwWDtRQMfVkkYNp8gv8bws7aZMfEBDYSshIXk9MDspOrEmnZ3E","reset_token":"0","verified":"0","phone_verify":"0","email_verify":"0","login_type":null,"birthdate":"2005-10-03","social_id":null,"status":"1","created_at":"2023-09-29 09:19:44","updated_at":"2023-10-02 12:50:08","deleted_at":null,"package_id":null,"fcm":"cp9imPlQzUnNrtJcRd4Pll:APA91bG6Dgr1gcbM6ZLrH6QXeSZ_t-h85_C5xtt8FKrS46BoIPtL8FvLHD4AhNcSkoi8WFCmu0rKSqimFVQfzZokoEZbgsuf7rQwwGkbEvGG9FZTA1KZOyOEZJDSizEtkiujtu1luBTR","device_id":null,"identity_image":"https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg","profile_image":null,"media":[{"id":998,"model_type":"App\\Models\\AppUser","model_id":"324","uuid":"e8e2d1a8-34f3-4457-b17f-4112656513b7","collection_name":"identity_image","name":"image_651abbe539bca.","file_name":"image_651abbe539bca..jpg","mime_type":"image/jpeg","disk":"public","conversions_disk":"public","size":"92497","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-10-02T12:47:33.000000Z","updated_at":"2023-10-02T12:47:33.000000Z","original_url":"https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/998/conversions/image_651abbe539bca.-preview.jpg"}]}}
/// error : ""

class UpdateProfile {
  UpdateProfile({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  UpdateProfile.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
UpdateProfile copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => UpdateProfile(  status: status ?? _status,
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

/// user : {"id":324,"first_name":"Shubham","middle":null,"last_name":"Qerty","email":"shubham@gmail.com","phone":"45458484848","phone_country":"+225","default_country":"CI","intro":"eqwewe r r the r. r rrrrrr","langauge":"wqeqw","country":"Åland Islands","wallet":null,"otp_value":"5126","token":"87JVR6oSQCP3yqMseYof98V9MJxzRc9iM2ojdRRkVjTcfNAoWLJHSHysT7Fu32kbnTTs5zvwWDtRQMfVkkYNp8gv8bws7aZMfEBDYSshIXk9MDspOrEmnZ3E","reset_token":"0","verified":"0","phone_verify":"0","email_verify":"0","login_type":null,"birthdate":"2005-10-03","social_id":null,"status":"1","created_at":"2023-09-29 09:19:44","updated_at":"2023-10-02 12:50:08","deleted_at":null,"package_id":null,"fcm":"cp9imPlQzUnNrtJcRd4Pll:APA91bG6Dgr1gcbM6ZLrH6QXeSZ_t-h85_C5xtt8FKrS46BoIPtL8FvLHD4AhNcSkoi8WFCmu0rKSqimFVQfzZokoEZbgsuf7rQwwGkbEvGG9FZTA1KZOyOEZJDSizEtkiujtu1luBTR","device_id":null,"identity_image":"https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg","profile_image":null,"media":[{"id":998,"model_type":"App\\Models\\AppUser","model_id":"324","uuid":"e8e2d1a8-34f3-4457-b17f-4112656513b7","collection_name":"identity_image","name":"image_651abbe539bca.","file_name":"image_651abbe539bca..jpg","mime_type":"image/jpeg","disk":"public","conversions_disk":"public","size":"92497","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-10-02T12:47:33.000000Z","updated_at":"2023-10-02T12:47:33.000000Z","original_url":"https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/998/conversions/image_651abbe539bca.-preview.jpg"}]}

class Data {
  Data({
      User? user,}){
    _user = user;
}

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
Data copyWith({  User? user,
}) => Data(  user: user ?? _user,
);
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : 324
/// first_name : "Shubham"
/// middle : null
/// last_name : "Qerty"
/// email : "shubham@gmail.com"
/// phone : "45458484848"
/// phone_country : "+225"
/// default_country : "CI"
/// intro : "eqwewe r r the r. r rrrrrr"
/// langauge : "wqeqw"
/// country : "Åland Islands"
/// wallet : null
/// otp_value : "5126"
/// token : "87JVR6oSQCP3yqMseYof98V9MJxzRc9iM2ojdRRkVjTcfNAoWLJHSHysT7Fu32kbnTTs5zvwWDtRQMfVkkYNp8gv8bws7aZMfEBDYSshIXk9MDspOrEmnZ3E"
/// reset_token : "0"
/// verified : "0"
/// phone_verify : "0"
/// email_verify : "0"
/// login_type : null
/// birthdate : "2005-10-03"
/// social_id : null
/// status : "1"
/// created_at : "2023-09-29 09:19:44"
/// updated_at : "2023-10-02 12:50:08"
/// deleted_at : null
/// package_id : null
/// fcm : "cp9imPlQzUnNrtJcRd4Pll:APA91bG6Dgr1gcbM6ZLrH6QXeSZ_t-h85_C5xtt8FKrS46BoIPtL8FvLHD4AhNcSkoi8WFCmu0rKSqimFVQfzZokoEZbgsuf7rQwwGkbEvGG9FZTA1KZOyOEZJDSizEtkiujtu1luBTR"
/// device_id : null
/// identity_image : "https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg"
/// profile_image : null
/// media : [{"id":998,"model_type":"App\\Models\\AppUser","model_id":"324","uuid":"e8e2d1a8-34f3-4457-b17f-4112656513b7","collection_name":"identity_image","name":"image_651abbe539bca.","file_name":"image_651abbe539bca..jpg","mime_type":"image/jpeg","disk":"public","conversions_disk":"public","size":"92497","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-10-02T12:47:33.000000Z","updated_at":"2023-10-02T12:47:33.000000Z","original_url":"https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/998/conversions/image_651abbe539bca.-preview.jpg"}]

class User {
  User({
      num? id, 
      String? firstName, 
      dynamic middle, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? phoneCountry, 
      String? defaultCountry, 
      String? intro, 
      String? langauge, 
      String? country, 
      dynamic wallet, 
      String? otpValue, 
      String? token, 
      String? resetToken, 
      String? verified, 
      String? phoneVerify, 
      String? emailVerify, 
      dynamic loginType, 
      String? birthdate, 
      dynamic socialId, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic deletedAt, 
      dynamic packageId, 
      String? fcm, 
      dynamic deviceId, 
      String? identityImage, 
      dynamic profileImage, 
      List<Media>? media,}){
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
    _phoneVerify = phoneVerify;
    _emailVerify = emailVerify;
    _loginType = loginType;
    _birthdate = birthdate;
    _socialId = socialId;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _deletedAt = deletedAt;
    _packageId = packageId;
    _fcm = fcm;
    _deviceId = deviceId;
    _identityImage = identityImage;
    _profileImage = profileImage;
    _media = media;
}

  User.fromJson(dynamic json) {
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
    _phoneVerify = json['phone_verify'];
    _emailVerify = json['email_verify'];
    _loginType = json['login_type'];
    _birthdate = json['birthdate'];
    _socialId = json['social_id'];
    _status = json['status'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _deletedAt = json['deleted_at'];
    _packageId = json['package_id'];
    _fcm = json['fcm'];
    _deviceId = json['device_id'];
    _identityImage = json['identity_image'];
    _profileImage = json['profile_image'];
    if (json['media'] != null) {
      _media = [];
      json['media'].forEach((v) {
        _media?.add(Media.fromJson(v));
      });
    }
  }
  num? _id;
  String? _firstName;
  dynamic _middle;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _phoneCountry;
  String? _defaultCountry;
  String? _intro;
  String? _langauge;
  String? _country;
  dynamic _wallet;
  String? _otpValue;
  String? _token;
  String? _resetToken;
  String? _verified;
  String? _phoneVerify;
  String? _emailVerify;
  dynamic _loginType;
  String? _birthdate;
  dynamic _socialId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _deletedAt;
  dynamic _packageId;
  String? _fcm;
  dynamic _deviceId;
  String? _identityImage;
  dynamic _profileImage;
  List<Media>? _media;
User copyWith({  num? id,
  String? firstName,
  dynamic middle,
  String? lastName,
  String? email,
  String? phone,
  String? phoneCountry,
  String? defaultCountry,
  String? intro,
  String? langauge,
  String? country,
  dynamic wallet,
  String? otpValue,
  String? token,
  String? resetToken,
  String? verified,
  String? phoneVerify,
  String? emailVerify,
  dynamic loginType,
  String? birthdate,
  dynamic socialId,
  String? status,
  String? createdAt,
  String? updatedAt,
  dynamic deletedAt,
  dynamic packageId,
  String? fcm,
  dynamic deviceId,
  String? identityImage,
  dynamic profileImage,
  List<Media>? media,
}) => User(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  middle: middle ?? _middle,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  phoneCountry: phoneCountry ?? _phoneCountry,
  defaultCountry: defaultCountry ?? _defaultCountry,
  intro: intro ?? _intro,
  langauge: langauge ?? _langauge,
  country: country ?? _country,
  wallet: wallet ?? _wallet,
  otpValue: otpValue ?? _otpValue,
  token: token ?? _token,
  resetToken: resetToken ?? _resetToken,
  verified: verified ?? _verified,
  phoneVerify: phoneVerify ?? _phoneVerify,
  emailVerify: emailVerify ?? _emailVerify,
  loginType: loginType ?? _loginType,
  birthdate: birthdate ?? _birthdate,
  socialId: socialId ?? _socialId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  deletedAt: deletedAt ?? _deletedAt,
  packageId: packageId ?? _packageId,
  fcm: fcm ?? _fcm,
  deviceId: deviceId ?? _deviceId,
  identityImage: identityImage ?? _identityImage,
  profileImage: profileImage ?? _profileImage,
  media: media ?? _media,
);
  num? get id => _id;
  String? get firstName => _firstName;
  dynamic get middle => _middle;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get phoneCountry => _phoneCountry;
  String? get defaultCountry => _defaultCountry;
  String? get intro => _intro;
  String? get langauge => _langauge;
  String? get country => _country;
  dynamic get wallet => _wallet;
  String? get otpValue => _otpValue;
  String? get token => _token;
  String? get resetToken => _resetToken;
  String? get verified => _verified;
  String? get phoneVerify => _phoneVerify;
  String? get emailVerify => _emailVerify;
  dynamic get loginType => _loginType;
  String? get birthdate => _birthdate;
  dynamic get socialId => _socialId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get deletedAt => _deletedAt;
  dynamic get packageId => _packageId;
  String? get fcm => _fcm;
  dynamic get deviceId => _deviceId;
  String? get identityImage => _identityImage;
  dynamic get profileImage => _profileImage;
  List<Media>? get media => _media;

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
    map['phone_verify'] = _phoneVerify;
    map['email_verify'] = _emailVerify;
    map['login_type'] = _loginType;
    map['birthdate'] = _birthdate;
    map['social_id'] = _socialId;
    map['status'] = _status;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['deleted_at'] = _deletedAt;
    map['package_id'] = _packageId;
    map['fcm'] = _fcm;
    map['device_id'] = _deviceId;
    map['identity_image'] = _identityImage;
    map['profile_image'] = _profileImage;
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 998
/// model_type : "App\\Models\\AppUser"
/// model_id : "324"
/// uuid : "e8e2d1a8-34f3-4457-b17f-4112656513b7"
/// collection_name : "identity_image"
/// name : "image_651abbe539bca."
/// file_name : "image_651abbe539bca..jpg"
/// mime_type : "image/jpeg"
/// disk : "public"
/// conversions_disk : "public"
/// size : "92497"
/// manipulations : []
/// custom_properties : []
/// generated_conversions : {"thumb":true,"preview":true}
/// responsive_images : []
/// order_column : "1"
/// created_at : "2023-10-02T12:47:33.000000Z"
/// updated_at : "2023-10-02T12:47:33.000000Z"
/// original_url : "https://tukki.cssrender.com/storage/app/public/998/image_651abbe539bca..jpg"
/// preview_url : "https://tukki.cssrender.com/storage/app/public/998/conversions/image_651abbe539bca.-preview.jpg"

class Media {
  Media({
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
      GeneratedConversions? generatedConversions, 
      List<dynamic>? responsiveImages, 
      String? orderColumn, 
      String? createdAt, 
      String? updatedAt, 
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
    _generatedConversions = generatedConversions;
    _responsiveImages = responsiveImages;
    _orderColumn = orderColumn;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _originalUrl = originalUrl;
    _previewUrl = previewUrl;
}

  Media.fromJson(dynamic json) {
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
    // if (json['manipulations'] != null) {
    //   _manipulations = [];
    //   json['manipulations'].forEach((v) {
    //     _manipulations?.add(Dynamic.fromJson(v));
    //   });
    // }
    // if (json['custom_properties'] != null) {
    //   _customProperties = [];
    //   json['custom_properties'].forEach((v) {
    //     _customProperties?.add(Dynamic.fromJson(v));
    //   });
    // }
    // _generatedConversions = json['generated_conversions'] != null ? GeneratedConversions.fromJson(json['generated_conversions']) : null;
    // if (json['responsive_images'] != null) {
    //   _responsiveImages = [];
    //   json['responsive_images'].forEach((v) {
    //     _responsiveImages?.add(Dynamic.fromJson(v));
    //   });
    // }
    _orderColumn = json['order_column'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
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
  GeneratedConversions? _generatedConversions;
  List<dynamic>? _responsiveImages;
  String? _orderColumn;
  String? _createdAt;
  String? _updatedAt;
  String? _originalUrl;
  String? _previewUrl;
Media copyWith({  num? id,
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
  GeneratedConversions? generatedConversions,
  List<dynamic>? responsiveImages,
  String? orderColumn,
  String? createdAt,
  String? updatedAt,
  String? originalUrl,
  String? previewUrl,
}) => Media(  id: id ?? _id,
  modelType: modelType ?? _modelType,
  modelId: modelId ?? _modelId,
  uuid: uuid ?? _uuid,
  collectionName: collectionName ?? _collectionName,
  name: name ?? _name,
  fileName: fileName ?? _fileName,
  mimeType: mimeType ?? _mimeType,
  disk: disk ?? _disk,
  conversionsDisk: conversionsDisk ?? _conversionsDisk,
  size: size ?? _size,
  manipulations: manipulations ?? _manipulations,
  customProperties: customProperties ?? _customProperties,
  generatedConversions: generatedConversions ?? _generatedConversions,
  responsiveImages: responsiveImages ?? _responsiveImages,
  orderColumn: orderColumn ?? _orderColumn,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  originalUrl: originalUrl ?? _originalUrl,
  previewUrl: previewUrl ?? _previewUrl,
);
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
  GeneratedConversions? get generatedConversions => _generatedConversions;
  List<dynamic>? get responsiveImages => _responsiveImages;
  String? get orderColumn => _orderColumn;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
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
    if (_generatedConversions != null) {
      map['generated_conversions'] = _generatedConversions?.toJson();
    }
    if (_responsiveImages != null) {
      map['responsive_images'] = _responsiveImages?.map((v) => v.toJson()).toList();
    }
    map['order_column'] = _orderColumn;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['original_url'] = _originalUrl;
    map['preview_url'] = _previewUrl;
    return map;
  }

}

/// thumb : true
/// preview : true

class GeneratedConversions {
  GeneratedConversions({
      bool? thumb, 
      bool? preview,}){
    _thumb = thumb;
    _preview = preview;
}

  GeneratedConversions.fromJson(dynamic json) {
    _thumb = json['thumb'];
    _preview = json['preview'];
  }
  bool? _thumb;
  bool? _preview;
GeneratedConversions copyWith({  bool? thumb,
  bool? preview,
}) => GeneratedConversions(  thumb: thumb ?? _thumb,
  preview: preview ?? _preview,
);
  bool? get thumb => _thumb;
  bool? get preview => _preview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumb'] = _thumb;
    map['preview'] = _preview;
    return map;
  }

}