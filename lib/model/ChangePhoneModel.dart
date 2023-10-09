/// status : 200
/// message : "global.mobile_number_updated_successfully"
/// data : {"id":203,"first_name":"tom","middle":null,"last_name":"sizh","email":"tomsizh@gmail.com","phone":"6754323423","phone_country":"+91","default_country":null,"wallet":null,"otp_value":"0","token":"Hi0pnaADHTSO80y48wCFwhhpvUJk3kFcu0f4PbXC7qz36GRLwpa2ItlpQqORQJaD9LYocq3MORfDpWTFWNbWzTrZpZt5N7E8d64cjjEWQWxbUD3JNUo2e8em","reset_token":"0","verified":"1","login_type":"google","birthdate":null,"social_id":"107712950302300274578","status":"1","created_at":"2023-09-11 08:05:12","updated_at":"2023-09-11 09:00:54","package_id":null,"fcm":null,"device_id":null,"profile_image":{"id":567,"model_type":"App\\Models\\AppUser","model_id":"203","uuid":"4df188ac-a6f2-44f8-9a92-e61e1eeb7b69","collection_name":"profile_image","name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux","file_name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","mime_type":"image/png","disk":"public","conversions_disk":"public","size":"677","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-09-11T08:05:12.000000Z","updated_at":"2023-09-11T08:05:12.000000Z","url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","thumbnail":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-thumb.jpg","preview":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg","original_url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"},"media":[{"id":567,"model_type":"App\\Models\\AppUser","model_id":"203","uuid":"4df188ac-a6f2-44f8-9a92-e61e1eeb7b69","collection_name":"profile_image","name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux","file_name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","mime_type":"image/png","disk":"public","conversions_disk":"public","size":"677","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-09-11T08:05:12.000000Z","updated_at":"2023-09-11T08:05:12.000000Z","url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","thumbnail":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-thumb.jpg","preview":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg","original_url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"}]}
/// error : ""

class ChangePhoneModel {
  ChangePhoneModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  ChangePhoneModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
ChangePhoneModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => ChangePhoneModel(  status: status ?? _status,
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

/// id : 203
/// first_name : "tom"
/// middle : null
/// last_name : "sizh"
/// email : "tomsizh@gmail.com"
/// phone : "6754323423"
/// phone_country : "+91"
/// default_country : null
/// wallet : null
/// otp_value : "0"
/// token : "Hi0pnaADHTSO80y48wCFwhhpvUJk3kFcu0f4PbXC7qz36GRLwpa2ItlpQqORQJaD9LYocq3MORfDpWTFWNbWzTrZpZt5N7E8d64cjjEWQWxbUD3JNUo2e8em"
/// reset_token : "0"
/// verified : "1"
/// login_type : "google"
/// birthdate : null
/// social_id : "107712950302300274578"
/// status : "1"
/// created_at : "2023-09-11 08:05:12"
/// updated_at : "2023-09-11 09:00:54"
/// package_id : null
/// fcm : null
/// device_id : null
/// profile_image : {"id":567,"model_type":"App\\Models\\AppUser","model_id":"203","uuid":"4df188ac-a6f2-44f8-9a92-e61e1eeb7b69","collection_name":"profile_image","name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux","file_name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","mime_type":"image/png","disk":"public","conversions_disk":"public","size":"677","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-09-11T08:05:12.000000Z","updated_at":"2023-09-11T08:05:12.000000Z","url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","thumbnail":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-thumb.jpg","preview":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg","original_url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"}
/// media : [{"id":567,"model_type":"App\\Models\\AppUser","model_id":"203","uuid":"4df188ac-a6f2-44f8-9a92-e61e1eeb7b69","collection_name":"profile_image","name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux","file_name":"6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","mime_type":"image/png","disk":"public","conversions_disk":"public","size":"677","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-09-11T08:05:12.000000Z","updated_at":"2023-09-11T08:05:12.000000Z","url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","thumbnail":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-thumb.jpg","preview":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg","original_url":"https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"}]

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
      dynamic wallet, 
      String? otpValue, 
      String? token, 
      String? resetToken, 
      String? verified, 
      String? loginType, 
      dynamic birthdate, 
      String? socialId, 
      String? status, 
      String? createdAt, 
      String? updatedAt, 
      dynamic packageId, 
      dynamic fcm, 
      dynamic deviceId, 
      ProfileImage? profileImage, 
      List<Media>? media,}){
    _id = id;
    _firstName = firstName;
    _middle = middle;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _phoneCountry = phoneCountry;
    _defaultCountry = defaultCountry;
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
    _profileImage = profileImage;
    _media = media;
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
    _profileImage = json['profile_image'] != null ? ProfileImage.fromJson(json['profile_image']) : null;
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
  dynamic _defaultCountry;
  dynamic _wallet;
  String? _otpValue;
  String? _token;
  String? _resetToken;
  String? _verified;
  String? _loginType;
  dynamic _birthdate;
  String? _socialId;
  String? _status;
  String? _createdAt;
  String? _updatedAt;
  dynamic _packageId;
  dynamic _fcm;
  dynamic _deviceId;
  ProfileImage? _profileImage;
  List<Media>? _media;
Data copyWith({  num? id,
  String? firstName,
  dynamic middle,
  String? lastName,
  String? email,
  String? phone,
  String? phoneCountry,
  dynamic defaultCountry,
  dynamic wallet,
  String? otpValue,
  String? token,
  String? resetToken,
  String? verified,
  String? loginType,
  dynamic birthdate,
  String? socialId,
  String? status,
  String? createdAt,
  String? updatedAt,
  dynamic packageId,
  dynamic fcm,
  dynamic deviceId,
  ProfileImage? profileImage,
  List<Media>? media,
}) => Data(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  middle: middle ?? _middle,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  phoneCountry: phoneCountry ?? _phoneCountry,
  defaultCountry: defaultCountry ?? _defaultCountry,
  wallet: wallet ?? _wallet,
  otpValue: otpValue ?? _otpValue,
  token: token ?? _token,
  resetToken: resetToken ?? _resetToken,
  verified: verified ?? _verified,
  loginType: loginType ?? _loginType,
  birthdate: birthdate ?? _birthdate,
  socialId: socialId ?? _socialId,
  status: status ?? _status,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
  packageId: packageId ?? _packageId,
  fcm: fcm ?? _fcm,
  deviceId: deviceId ?? _deviceId,
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
  dynamic get defaultCountry => _defaultCountry;
  dynamic get wallet => _wallet;
  String? get otpValue => _otpValue;
  String? get token => _token;
  String? get resetToken => _resetToken;
  String? get verified => _verified;
  String? get loginType => _loginType;
  dynamic get birthdate => _birthdate;
  String? get socialId => _socialId;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get packageId => _packageId;
  dynamic get fcm => _fcm;
  dynamic get deviceId => _deviceId;
  ProfileImage? get profileImage => _profileImage;
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
    if (_profileImage != null) {
      map['profile_image'] = _profileImage?.toJson();
    }
    if (_media != null) {
      map['media'] = _media?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 567
/// model_type : "App\\Models\\AppUser"
/// model_id : "203"
/// uuid : "4df188ac-a6f2-44f8-9a92-e61e1eeb7b69"
/// collection_name : "profile_image"
/// name : "6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux"
/// file_name : "6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg"
/// mime_type : "image/png"
/// disk : "public"
/// conversions_disk : "public"
/// size : "677"
/// manipulations : []
/// custom_properties : []
/// generated_conversions : {"thumb":true,"preview":true}
/// responsive_images : []
/// order_column : "1"
/// created_at : "2023-09-11T08:05:12.000000Z"
/// updated_at : "2023-09-11T08:05:12.000000Z"
/// url : "https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg"
/// thumbnail : "https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-thumb.jpg"
/// preview : "https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"
/// original_url : "https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg"
/// preview_url : "https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"

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
    _generatedConversions = generatedConversions;
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
  GeneratedConversions? _generatedConversions;
  List<dynamic>? _responsiveImages;
  String? _orderColumn;
  String? _createdAt;
  String? _updatedAt;
  String? _url;
  String? _thumbnail;
  String? _preview;
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
  String? url,
  String? thumbnail,
  String? preview,
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
  url: url ?? _url,
  thumbnail: thumbnail ?? _thumbnail,
  preview: preview ?? _preview,
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
    if (_generatedConversions != null) {
      map['generated_conversions'] = _generatedConversions?.toJson();
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

/// id : 567
/// model_type : "App\\Models\\AppUser"
/// model_id : "203"
/// uuid : "4df188ac-a6f2-44f8-9a92-e61e1eeb7b69"
/// collection_name : "profile_image"
/// name : "6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux"
/// file_name : "6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg"
/// mime_type : "image/png"
/// disk : "public"
/// conversions_disk : "public"
/// size : "677"
/// manipulations : []
/// custom_properties : []
/// generated_conversions : {"thumb":true,"preview":true}
/// responsive_images : []
/// order_column : "1"
/// created_at : "2023-09-11T08:05:12.000000Z"
/// updated_at : "2023-09-11T08:05:12.000000Z"
/// url : "https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg"
/// thumbnail : "https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-thumb.jpg"
/// preview : "https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"
/// original_url : "https://tukki.cssrender.com/storage/app/public/567/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux.jpg"
/// preview_url : "https://tukki.cssrender.com/storage/app/public/567/conversions/6YXQQhnHzXfEt4RM0xYNBEp1McHfASMmyXso0mux-preview.jpg"

class ProfileImage {
  ProfileImage({
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
    _generatedConversions = generatedConversions;
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

  ProfileImage.fromJson(dynamic json) {
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
  GeneratedConversions? _generatedConversions;
  List<dynamic>? _responsiveImages;
  String? _orderColumn;
  String? _createdAt;
  String? _updatedAt;
  String? _url;
  String? _thumbnail;
  String? _preview;
  String? _originalUrl;
  String? _previewUrl;
ProfileImage copyWith({  num? id,
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
  String? url,
  String? thumbnail,
  String? preview,
  String? originalUrl,
  String? previewUrl,
}) => ProfileImage(  id: id ?? _id,
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
  url: url ?? _url,
  thumbnail: thumbnail ?? _thumbnail,
  preview: preview ?? _preview,
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
    if (_generatedConversions != null) {
      map['generated_conversions'] = _generatedConversions?.toJson();
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
