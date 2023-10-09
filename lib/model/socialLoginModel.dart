
class SocialLoginModel {
  SocialLoginModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  SocialLoginModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null && json['data']!=[] ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
SocialLoginModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => SocialLoginModel(  status: status ?? _status,
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

/// id : 56
/// first_name : "Diwapathi"
/// middle : null
/// last_name : "Pathak"
/// email : "rpathaksoftware1@gmail.com"
/// phone : null
/// phone_country : null
/// default_country : null
/// wallet : null
/// otp_value : "0"
/// token : "ETqJnTf3z4MWaBgpFt6KUIlSMpisdnjJlMhws4GRYcJNEnBwxL9b2PfSqNk5HRcFRlDUb4hqQnLJf0JMvvY4LLhzfXhApm26X5VTtdAiazKryf965Y75m2qH"
/// reset_token : "0"
/// verified : "1"
/// login_type : null
/// birthdate : null
/// social_id : null
/// status : "1"
/// created_at : "2023-07-24 11:15:57"
/// updated_at : "2023-09-11 06:53:29"
/// package_id : null
/// fcm : null
/// device_id : null
/// profile_image : {"id":57,"model_type":"App\\Models\\AppUser","model_id":"56","uuid":"5ab69ea3-bc27-4ce0-bfa4-329f77150736","collection_name":"profile_image","name":"7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP","file_name":"7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg","mime_type":"image/jpeg","disk":"public","conversions_disk":"public","size":"54695","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-07-24T11:15:57.000000Z","updated_at":"2023-07-24T11:15:57.000000Z","url":"https://tukki.cssrender.com/storage/app/public/57/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg","thumbnail":"https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-thumb.jpg","preview":"https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-preview.jpg","original_url":"https://tukki.cssrender.com/storage/app/public/57/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-preview.jpg"}
/// media : [{"id":57,"model_type":"App\\Models\\AppUser","model_id":"56","uuid":"5ab69ea3-bc27-4ce0-bfa4-329f77150736","collection_name":"profile_image","name":"7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP","file_name":"7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg","mime_type":"image/jpeg","disk":"public","conversions_disk":"public","size":"54695","manipulations":[],"custom_properties":[],"generated_conversions":{"thumb":true,"preview":true},"responsive_images":[],"order_column":"1","created_at":"2023-07-24T11:15:57.000000Z","updated_at":"2023-07-24T11:15:57.000000Z","url":"https://tukki.cssrender.com/storage/app/public/57/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg","thumbnail":"https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-thumb.jpg","preview":"https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-preview.jpg","original_url":"https://tukki.cssrender.com/storage/app/public/57/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg","preview_url":"https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-preview.jpg"}]

class Data {
  Data({
      num? id, 
      String? firstName, 
      dynamic middle, 
      String? lastName, 
      String? email, 
      dynamic phone, 
      dynamic phoneCountry, 
      dynamic defaultCountry, 
      dynamic wallet, 
      String? otpValue, 
      String? token, 
      String? resetToken, 
      String? verified, 
      dynamic loginType, 
      dynamic birthdate, 
      dynamic socialId, 
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
  dynamic _phone;
  dynamic _phoneCountry;
  dynamic _defaultCountry;
  dynamic _wallet;
  String? _otpValue;
  String? _token;
  String? _resetToken;
  String? _verified;
  dynamic _loginType;
  dynamic _birthdate;
  dynamic _socialId;
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
  dynamic phone,
  dynamic phoneCountry,
  dynamic defaultCountry,
  dynamic wallet,
  String? otpValue,
  String? token,
  String? resetToken,
  String? verified,
  dynamic loginType,
  dynamic birthdate,
  dynamic socialId,
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
  dynamic get phone => _phone;
  dynamic get phoneCountry => _phoneCountry;
  dynamic get defaultCountry => _defaultCountry;
  dynamic get wallet => _wallet;
  String? get otpValue => _otpValue;
  String? get token => _token;
  String? get resetToken => _resetToken;
  String? get verified => _verified;
  dynamic get loginType => _loginType;
  dynamic get birthdate => _birthdate;
  dynamic get socialId => _socialId;
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

/// id : 57
/// model_type : "App\\Models\\AppUser"
/// model_id : "56"
/// uuid : "5ab69ea3-bc27-4ce0-bfa4-329f77150736"
/// collection_name : "profile_image"
/// name : "7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP"
/// file_name : "7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg"
/// mime_type : "image/jpeg"
/// disk : "public"
/// conversions_disk : "public"
/// size : "54695"
/// manipulations : []
/// custom_properties : []
/// generated_conversions : {"thumb":true,"preview":true}
/// responsive_images : []
/// order_column : "1"
/// created_at : "2023-07-24T11:15:57.000000Z"
/// updated_at : "2023-07-24T11:15:57.000000Z"
/// url : "https://tukki.cssrender.com/storage/app/public/57/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg"
/// thumbnail : "https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-thumb.jpg"
/// preview : "https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-preview.jpg"
/// original_url : "https://tukki.cssrender.com/storage/app/public/57/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP.jpg"
/// preview_url : "https://tukki.cssrender.com/storage/app/public/57/conversions/7dFH1hX4mgkbo566Ck7SEmvdGK223Q2tioyydHDP-preview.jpg"

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

  bool? get thumb => _thumb;
  bool? get preview => _preview;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['thumb'] = _thumb;
    map['preview'] = _preview;
    return map;
  }

}
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