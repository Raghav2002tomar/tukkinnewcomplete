/// status : 200
/// message : "global.Result_found"
/// data : {"metaData":{"general_name":"testing1111","general_email":"testuser1@gmail.com1111","general_head_code":"2522","general_default_currency":"ZAR","general_default_language":"fr","general_logo":"815938.1cdf66e7b76241c78175575e8e862fe0.png","general_favicon":"595069.2023-01-17-63c6881feb599.png","personalization_row_per_page":"10","personalization_min_search_price":"10","personalization_max_search_price":"12","personalization_date_separator":"/","personalization_date_format":"2","personalization_timeZone":"4","personalization_money_format":"after","messagewizard_phone_no":"9625847856","messagewizard_twilio_sid":"ytuyti","messagewizard_twilio_token":"yturtu","messagewizard_defaults":"ytutyu","messagewizard_status":"1","emailwizard_driver":"smtp","emailwizard_emai_host":"admin@gmail.com","emailwizard_port":"507","emailwizard_from_address":"testuser@gmail.com","emailwizard_from_name":"tukki","emailwizard_encryption":"tls","emailwizard_username":"rwer","emailwizard_password":"ewrwer","feesetup_guest_service_charge":"erweetet","feesetup_iva_tax":"ertre","feesetup_accomodation_tax":"etre","api_facebook_client_id":"ert","api_facebook_client_secret":"were","api_google_client_id":"ewtret","api_google_client_secret":"wetretret","api_google_map_key":"rtreretre","socialmedia_facebook":"#","socialmedia_google_plus":"#","socialmedia_twitter":"#","socialmedia_linkedin":"#","socialmedia_pinterest":"#","socialmedia_youtube":"#","socialmedia_instagram":"#","socialnetwork_facebook_login":"sdfsdf","socialnetwork_google_login":"sfsdf","paypal_status":"1","paypal_username":"agds","paypal_password":"desd","paypal_signature":"etret","paypal_mode":"were","stripe_status":"1","stripe_secret_key":"rtyrtfgg","stripe_publishable_key":"sddkjl","orangemoney_stripe_secret_key":"tydh","orangemoney_publishable_key":"abc@123","orangemoney_status":"1"}}
/// error : ""

class GeneralDataModel {
  GeneralDataModel({
      num? status, 
      String? message, 
      Data? data, 
      String? error,}){
    _status = status;
    _message = message;
    _data = data;
    _error = error;
}

  GeneralDataModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    _error = json['error'];
  }
  num? _status;
  String? _message;
  Data? _data;
  String? _error;
GeneralDataModel copyWith({  num? status,
  String? message,
  Data? data,
  String? error,
}) => GeneralDataModel(  status: status ?? _status,
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

/// metaData : {"general_name":"testing1111","general_email":"testuser1@gmail.com1111","general_head_code":"2522","general_default_currency":"ZAR","general_default_language":"fr","general_logo":"815938.1cdf66e7b76241c78175575e8e862fe0.png","general_favicon":"595069.2023-01-17-63c6881feb599.png","personalization_row_per_page":"10","personalization_min_search_price":"10","personalization_max_search_price":"12","personalization_date_separator":"/","personalization_date_format":"2","personalization_timeZone":"4","personalization_money_format":"after","messagewizard_phone_no":"9625847856","messagewizard_twilio_sid":"ytuyti","messagewizard_twilio_token":"yturtu","messagewizard_defaults":"ytutyu","messagewizard_status":"1","emailwizard_driver":"smtp","emailwizard_emai_host":"admin@gmail.com","emailwizard_port":"507","emailwizard_from_address":"testuser@gmail.com","emailwizard_from_name":"tukki","emailwizard_encryption":"tls","emailwizard_username":"rwer","emailwizard_password":"ewrwer","feesetup_guest_service_charge":"erweetet","feesetup_iva_tax":"ertre","feesetup_accomodation_tax":"etre","api_facebook_client_id":"ert","api_facebook_client_secret":"were","api_google_client_id":"ewtret","api_google_client_secret":"wetretret","api_google_map_key":"rtreretre","socialmedia_facebook":"#","socialmedia_google_plus":"#","socialmedia_twitter":"#","socialmedia_linkedin":"#","socialmedia_pinterest":"#","socialmedia_youtube":"#","socialmedia_instagram":"#","socialnetwork_facebook_login":"sdfsdf","socialnetwork_google_login":"sfsdf","paypal_status":"1","paypal_username":"agds","paypal_password":"desd","paypal_signature":"etret","paypal_mode":"were","stripe_status":"1","stripe_secret_key":"rtyrtfgg","stripe_publishable_key":"sddkjl","orangemoney_stripe_secret_key":"tydh","orangemoney_publishable_key":"abc@123","orangemoney_status":"1"}

class Data {
  Data({
      MetaData? metaData,}){
    _metaData = metaData;
}

  Data.fromJson(dynamic json) {
    _metaData = json['metaData'] != null ? MetaData.fromJson(json['metaData']) : null;
  }
  MetaData? _metaData;
Data copyWith({  MetaData? metaData,
}) => Data(  metaData: metaData ?? _metaData,
);
  MetaData? get metaData => _metaData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_metaData != null) {
      map['metaData'] = _metaData?.toJson();
    }
    return map;
  }

}

/// general_name : "testing1111"
/// general_email : "testuser1@gmail.com1111"
/// general_head_code : "2522"
/// general_default_currency : "ZAR"
/// general_default_language : "fr"
/// general_logo : "815938.1cdf66e7b76241c78175575e8e862fe0.png"
/// general_favicon : "595069.2023-01-17-63c6881feb599.png"
/// personalization_row_per_page : "10"
/// personalization_min_search_price : "10"
/// personalization_max_search_price : "12"
/// personalization_date_separator : "/"
/// personalization_date_format : "2"
/// personalization_timeZone : "4"
/// personalization_money_format : "after"
/// messagewizard_phone_no : "9625847856"
/// messagewizard_twilio_sid : "ytuyti"
/// messagewizard_twilio_token : "yturtu"
/// messagewizard_defaults : "ytutyu"
/// messagewizard_status : "1"
/// emailwizard_driver : "smtp"
/// emailwizard_emai_host : "admin@gmail.com"
/// emailwizard_port : "507"
/// emailwizard_from_address : "testuser@gmail.com"
/// emailwizard_from_name : "tukki"
/// emailwizard_encryption : "tls"
/// emailwizard_username : "rwer"
/// emailwizard_password : "ewrwer"
/// feesetup_guest_service_charge : "erweetet"
/// feesetup_iva_tax : "ertre"
/// feesetup_accomodation_tax : "etre"
/// api_facebook_client_id : "ert"
/// api_facebook_client_secret : "were"
/// api_google_client_id : "ewtret"
/// api_google_client_secret : "wetretret"
/// api_google_map_key : "rtreretre"
/// socialmedia_facebook : "#"
/// socialmedia_google_plus : "#"
/// socialmedia_twitter : "#"
/// socialmedia_linkedin : "#"
/// socialmedia_pinterest : "#"
/// socialmedia_youtube : "#"
/// socialmedia_instagram : "#"
/// socialnetwork_facebook_login : "sdfsdf"
/// socialnetwork_google_login : "sfsdf"
/// paypal_status : "1"
/// paypal_username : "agds"
/// paypal_password : "desd"
/// paypal_signature : "etret"
/// paypal_mode : "were"
/// stripe_status : "1"
/// stripe_secret_key : "rtyrtfgg"
/// stripe_publishable_key : "sddkjl"
/// orangemoney_stripe_secret_key : "tydh"
/// orangemoney_publishable_key : "abc@123"
/// orangemoney_status : "1"

class MetaData {
  MetaData({
      String? generalName, 
      String? generalEmail, 
      String? generalHeadCode, 
      String? generalDefaultCurrency, 
      String? generalDefaultLanguage, 
      String? generalLogo, 
      String? generalFavicon, 
      String? personalizationRowPerPage, 
      String? personalizationMinSearchPrice, 
      String? personalizationMaxSearchPrice, 
      String? personalizationDateSeparator, 
      String? personalizationDateFormat, 
      String? personalizationTimeZone, 
      String? personalizationMoneyFormat, 
      String? messagewizardPhoneNo, 
      String? messagewizardTwilioSid, 
      String? messagewizardTwilioToken, 
      String? messagewizardDefaults, 
      String? messagewizardStatus, 
      String? emailwizardDriver, 
      String? emailwizardEmaiHost, 
      String? emailwizardPort, 
      String? emailwizardFromAddress, 
      String? emailwizardFromName, 
      String? emailwizardEncryption, 
      String? emailwizardUsername, 
      String? emailwizardPassword, 
      String? generalMinimumPrice,
      String? generalMaximumPrice,
      String? feesetupGuestServiceCharge,
      String? feesetupIvaTax, 
      String? feesetupAccomodationTax, 
      String? apiFacebookClientId, 
      String? apiFacebookClientSecret, 
      String? apiGoogleClientId, 
      String? apiGoogleClientSecret, 
      String? apiGoogleMapKey, 
      String? socialmediaFacebook, 
      String? socialmediaGooglePlus, 
      String? socialmediaTwitter, 
      String? socialmediaLinkedin, 
      String? socialmediaPinterest, 
      String? socialmediaYoutube, 
      String? socialmediaInstagram, 
      String? socialnetworkFacebookLogin, 
      String? socialnetworkGoogleLogin, 
      String? paypalStatus, 
      String? paypalUsername, 
      String? paypalPassword, 
      String? paypalSignature, 
      String? paypalMode, 
      String? stripeStatus, 
      String? stripeSecretKey, 
      String? stripePublishableKey, 
      String? orangemoneyStripeSecretKey, 
      String? orangemoneyPublishableKey, 
      String? orangemoneyStatus,
      String? generalhosttitlefirst,
      String? generalhosttitlesecond,
      String? generalhostlink,
      String? generalbecomehostimage}){
    _generalName = generalName;
    _generalEmail = generalEmail;
    _generalHeadCode = generalHeadCode;
    _generalDefaultCurrency = generalDefaultCurrency;
    _generalDefaultLanguage = generalDefaultLanguage;
    _generalLogo = generalLogo;
    _generalFavicon = generalFavicon;
    _personalizationRowPerPage = personalizationRowPerPage;
    _personalizationMinSearchPrice = personalizationMinSearchPrice;
    _personalizationMaxSearchPrice = personalizationMaxSearchPrice;
    _personalizationDateSeparator = personalizationDateSeparator;
    _personalizationDateFormat = personalizationDateFormat;
    _personalizationTimeZone = personalizationTimeZone;
    _personalizationMoneyFormat = personalizationMoneyFormat;
    _messagewizardPhoneNo = messagewizardPhoneNo;
    _messagewizardTwilioSid = messagewizardTwilioSid;
    _messagewizardTwilioToken = messagewizardTwilioToken;
    _messagewizardDefaults = messagewizardDefaults;
    _messagewizardStatus = messagewizardStatus;
    _emailwizardDriver = emailwizardDriver;
    _emailwizardEmaiHost = emailwizardEmaiHost;
    _emailwizardPort = emailwizardPort;
    _emailwizardFromAddress = emailwizardFromAddress;
    _emailwizardFromName = emailwizardFromName;
    _emailwizardEncryption = emailwizardEncryption;
    _emailwizardUsername = emailwizardUsername;
    _emailwizardPassword = emailwizardPassword;
    _generalMinimumPrice = generalMinimumPrice;
    _generalMaximumPrice = generalMaximumPrice;
    _feesetupGuestServiceCharge = feesetupGuestServiceCharge;
    _feesetupIvaTax = feesetupIvaTax;
    _feesetupAccomodationTax = feesetupAccomodationTax;
    _apiFacebookClientId = apiFacebookClientId;
    _apiFacebookClientSecret = apiFacebookClientSecret;
    _apiGoogleClientId = apiGoogleClientId;
    _apiGoogleClientSecret = apiGoogleClientSecret;
    _apiGoogleMapKey = apiGoogleMapKey;
    _socialmediaFacebook = socialmediaFacebook;
    _socialmediaGooglePlus = socialmediaGooglePlus;
    _socialmediaTwitter = socialmediaTwitter;
    _socialmediaLinkedin = socialmediaLinkedin;
    _socialmediaPinterest = socialmediaPinterest;
    _socialmediaYoutube = socialmediaYoutube;
    _socialmediaInstagram = socialmediaInstagram;
    _socialnetworkFacebookLogin = socialnetworkFacebookLogin;
    _socialnetworkGoogleLogin = socialnetworkGoogleLogin;
    _paypalStatus = paypalStatus;
    _paypalUsername = paypalUsername;
    _paypalPassword = paypalPassword;
    _paypalSignature = paypalSignature;
    _paypalMode = paypalMode;
    _stripeStatus = stripeStatus;
    _stripeSecretKey = stripeSecretKey;
    _stripePublishableKey = stripePublishableKey;
    _orangemoneyStripeSecretKey = orangemoneyStripeSecretKey;
    _orangemoneyPublishableKey = orangemoneyPublishableKey;
    _orangemoneyStatus = orangemoneyStatus;
    _generalhosttitlefirst = generalhosttitlefirst;
    _generalhosttitlesecond = generalhosttitlesecond;
    _generalhostlink = generalhostlink;
    _generalbecomehostimage = generalbecomehostimage;
}

  MetaData.fromJson(dynamic json) {
    _generalName = json['general_name'];
    _generalEmail = json['general_email'];
    _generalHeadCode = json['general_head_code'];
    _generalDefaultCurrency = json['general_default_currency'];
    _generalDefaultLanguage = json['general_default_language'];
    _generalLogo = json['general_logo'];
    _generalFavicon = json['general_favicon'];
    _personalizationRowPerPage = json['personalization_row_per_page'];
    _personalizationMinSearchPrice = json['personalization_min_search_price'];
    _personalizationMaxSearchPrice = json['personalization_max_search_price'];
    _personalizationDateSeparator = json['personalization_date_separator'];
    _personalizationDateFormat = json['personalization_date_format'];
    _personalizationTimeZone = json['personalization_timeZone'];
    _personalizationMoneyFormat = json['personalization_money_format'];
    _messagewizardPhoneNo = json['messagewizard_phone_no'];
    _messagewizardTwilioSid = json['messagewizard_twilio_sid'];
    _messagewizardTwilioToken = json['messagewizard_twilio_token'];
    _messagewizardDefaults = json['messagewizard_defaults'];
    _messagewizardStatus = json['messagewizard_status'];
    _emailwizardDriver = json['emailwizard_driver'];
    _emailwizardEmaiHost = json['emailwizard_emai_host'];
    _emailwizardPort = json['emailwizard_port'];
    _emailwizardFromAddress = json['emailwizard_from_address'];
    _emailwizardFromName = json['emailwizard_from_name'];
    _emailwizardEncryption = json['emailwizard_encryption'];
    _emailwizardUsername = json['emailwizard_username'];
    _emailwizardPassword = json['emailwizard_password'];
    _generalMinimumPrice = json['general_minimum_price'];
    _generalMaximumPrice = json['general_maximum_price'];
    _feesetupGuestServiceCharge = json['feesetup_guest_service_charge'];
    _feesetupIvaTax = json['feesetup_iva_tax'];
    _feesetupAccomodationTax = json['feesetup_accomodation_tax'];
    _apiFacebookClientId = json['api_facebook_client_id'];
    _apiFacebookClientSecret = json['api_facebook_client_secret'];
    _apiGoogleClientId = json['api_google_client_id'];
    _apiGoogleClientSecret = json['api_google_client_secret'];
    _apiGoogleMapKey = json['api_google_map_key'];
    _socialmediaFacebook = json['socialmedia_facebook'];
    _socialmediaGooglePlus = json['socialmedia_google_plus'];
    _socialmediaTwitter = json['socialmedia_twitter'];
    _socialmediaLinkedin = json['socialmedia_linkedin'];
    _socialmediaPinterest = json['socialmedia_pinterest'];
    _socialmediaYoutube = json['socialmedia_youtube'];
    _socialmediaInstagram = json['socialmedia_instagram'];
    _socialnetworkFacebookLogin = json['socialnetwork_facebook_login'];
    _socialnetworkGoogleLogin = json['socialnetwork_google_login'];
    _paypalStatus = json['paypal_status'];
    _paypalUsername = json['paypal_username'];
    _paypalPassword = json['paypal_password'];
    _paypalSignature = json['paypal_signature'];
    _paypalMode = json['paypal_mode'];
    _stripeStatus = json['stripe_status'];
    _stripeSecretKey = json['stripe_secret_key'];
    _stripePublishableKey = json['stripe_publishable_key'];
    _orangemoneyStripeSecretKey = json['orangemoney_stripe_secret_key'];
    _orangemoneyPublishableKey = json['orangemoney_publishable_key'];
    _orangemoneyStatus = json['orangemoney_status'];
    _generalhosttitlefirst = json['general_host_title_first'];
    _generalhosttitlesecond = json['general_host_title_second'];
    _generalhostlink = json['general_host_link'];
    _generalbecomehostimage = json['general_becomehost_image'];
    
  }
  String? _generalName;
  String? _generalEmail;
  String? _generalHeadCode;
  String? _generalDefaultCurrency;
  String? _generalDefaultLanguage;
  String? _generalLogo;
  String? _generalFavicon;
  String? _personalizationRowPerPage;
  String? _personalizationMinSearchPrice;
  String? _personalizationMaxSearchPrice;
  String? _personalizationDateSeparator;
  String? _personalizationDateFormat;
  String? _personalizationTimeZone;
  String? _personalizationMoneyFormat;
  String? _messagewizardPhoneNo;
  String? _messagewizardTwilioSid;
  String? _messagewizardTwilioToken;
  String? _messagewizardDefaults;
  String? _messagewizardStatus;
  String? _emailwizardDriver;
  String? _emailwizardEmaiHost;
  String? _emailwizardPort;
  String? _emailwizardFromAddress;
  String? _emailwizardFromName;
  String? _emailwizardEncryption;
  String? _emailwizardUsername;
  String? _emailwizardPassword;
  String? _generalMinimumPrice;
  String? _generalMaximumPrice;
  String? _feesetupGuestServiceCharge;
  String? _feesetupIvaTax;
  String? _feesetupAccomodationTax;
  String? _apiFacebookClientId;
  String? _apiFacebookClientSecret;
  String? _apiGoogleClientId;
  String? _apiGoogleClientSecret;
  String? _apiGoogleMapKey;
  String? _socialmediaFacebook;
  String? _socialmediaGooglePlus;
  String? _socialmediaTwitter;
  String? _socialmediaLinkedin;
  String? _socialmediaPinterest;
  String? _socialmediaYoutube;
  String? _socialmediaInstagram;
  String? _socialnetworkFacebookLogin;
  String? _socialnetworkGoogleLogin;
  String? _paypalStatus;
  String? _paypalUsername;
  String? _paypalPassword;
  String? _paypalSignature;
  String? _paypalMode;
  String? _stripeStatus;
  String? _stripeSecretKey;
  String? _stripePublishableKey;
  String? _orangemoneyStripeSecretKey;
  String? _orangemoneyPublishableKey;
  String? _orangemoneyStatus;
  String?_generalhosttitlefirst;
  String? _generalhosttitlesecond;
  String? _generalhostlink;
  String? _generalbecomehostimage;

MetaData copyWith({  String? generalName,
  String? generalEmail,
  String? generalHeadCode,
  String? generalDefaultCurrency,
  String? generalDefaultLanguage,
  String? generalLogo,
  String? generalFavicon,
  String? personalizationRowPerPage,
  String? personalizationMinSearchPrice,
  String? personalizationMaxSearchPrice,
  String? personalizationDateSeparator,
  String? personalizationDateFormat,
  String? personalizationTimeZone,
  String? personalizationMoneyFormat,
  String? messagewizardPhoneNo,
  String? messagewizardTwilioSid,
  String? messagewizardTwilioToken,
  String? messagewizardDefaults,
  String? messagewizardStatus,
  String? emailwizardDriver,
  String? emailwizardEmaiHost,
  String? emailwizardPort,
  String? emailwizardFromAddress,
  String? emailwizardFromName,
  String? emailwizardEncryption,
  String? emailwizardUsername,
  String? emailwizardPassword,
  String? generalMinimumPrice,
  String? generalMaximumPrice,
  String? feesetupGuestServiceCharge,
  String? feesetupIvaTax,
  String? feesetupAccomodationTax,
  String? apiFacebookClientId,
  String? apiFacebookClientSecret,
  String? apiGoogleClientId,
  String? apiGoogleClientSecret,
  String? apiGoogleMapKey,
  String? socialmediaFacebook,
  String? socialmediaGooglePlus,
  String? socialmediaTwitter,
  String? socialmediaLinkedin,
  String? socialmediaPinterest,
  String? socialmediaYoutube,
  String? socialmediaInstagram,
  String? socialnetworkFacebookLogin,
  String? socialnetworkGoogleLogin,
  String? paypalStatus,
  String? paypalUsername,
  String? paypalPassword,
  String? paypalSignature,
  String? paypalMode,
  String? stripeStatus,
  String? stripeSecretKey,
  String? stripePublishableKey,
  String? orangemoneyStripeSecretKey,
  String? orangemoneyPublishableKey,
  String? orangemoneyStatus,
  String? generalhosttitlefirst,
  String? generalhosttitlesecond,
  String? generalhostlink,
  String? generalbecomehostimage
  
}) => MetaData(  generalName: generalName ?? _generalName,
  generalEmail: generalEmail ?? _generalEmail,
  generalHeadCode: generalHeadCode ?? _generalHeadCode,
  generalDefaultCurrency: generalDefaultCurrency ?? _generalDefaultCurrency,
  generalDefaultLanguage: generalDefaultLanguage ?? _generalDefaultLanguage,
  generalLogo: generalLogo ?? _generalLogo,
  generalFavicon: generalFavicon ?? _generalFavicon,
  personalizationRowPerPage: personalizationRowPerPage ?? _personalizationRowPerPage,
  personalizationMinSearchPrice: personalizationMinSearchPrice ?? _personalizationMinSearchPrice,
  personalizationMaxSearchPrice: personalizationMaxSearchPrice ?? _personalizationMaxSearchPrice,
  personalizationDateSeparator: personalizationDateSeparator ?? _personalizationDateSeparator,
  personalizationDateFormat: personalizationDateFormat ?? _personalizationDateFormat,
  personalizationTimeZone: personalizationTimeZone ?? _personalizationTimeZone,
  personalizationMoneyFormat: personalizationMoneyFormat ?? _personalizationMoneyFormat,
  messagewizardPhoneNo: messagewizardPhoneNo ?? _messagewizardPhoneNo,
  messagewizardTwilioSid: messagewizardTwilioSid ?? _messagewizardTwilioSid,
  messagewizardTwilioToken: messagewizardTwilioToken ?? _messagewizardTwilioToken,
  messagewizardDefaults: messagewizardDefaults ?? _messagewizardDefaults,
  messagewizardStatus: messagewizardStatus ?? _messagewizardStatus,
  emailwizardDriver: emailwizardDriver ?? _emailwizardDriver,
  emailwizardEmaiHost: emailwizardEmaiHost ?? _emailwizardEmaiHost,
  emailwizardPort: emailwizardPort ?? _emailwizardPort,
  emailwizardFromAddress: emailwizardFromAddress ?? _emailwizardFromAddress,
  emailwizardFromName: emailwizardFromName ?? _emailwizardFromName,
  emailwizardEncryption: emailwizardEncryption ?? _emailwizardEncryption,
  emailwizardUsername: emailwizardUsername ?? _emailwizardUsername,
  emailwizardPassword: emailwizardPassword ?? _emailwizardPassword,
  generalMinimumPrice: generalMinimumPrice ?? _generalMinimumPrice,
  generalMaximumPrice: generalMaximumPrice ?? _generalMaximumPrice,
  feesetupGuestServiceCharge: feesetupGuestServiceCharge ?? _feesetupGuestServiceCharge,
  feesetupIvaTax: feesetupIvaTax ?? _feesetupIvaTax,
  feesetupAccomodationTax: feesetupAccomodationTax ?? _feesetupAccomodationTax,
  apiFacebookClientId: apiFacebookClientId ?? _apiFacebookClientId,
  apiFacebookClientSecret: apiFacebookClientSecret ?? _apiFacebookClientSecret,
  apiGoogleClientId: apiGoogleClientId ?? _apiGoogleClientId,
  apiGoogleClientSecret: apiGoogleClientSecret ?? _apiGoogleClientSecret,
  apiGoogleMapKey: apiGoogleMapKey ?? _apiGoogleMapKey,
  socialmediaFacebook: socialmediaFacebook ?? _socialmediaFacebook,
  socialmediaGooglePlus: socialmediaGooglePlus ?? _socialmediaGooglePlus,
  socialmediaTwitter: socialmediaTwitter ?? _socialmediaTwitter,
  socialmediaLinkedin: socialmediaLinkedin ?? _socialmediaLinkedin,
  socialmediaPinterest: socialmediaPinterest ?? _socialmediaPinterest,
  socialmediaYoutube: socialmediaYoutube ?? _socialmediaYoutube,
  socialmediaInstagram: socialmediaInstagram ?? _socialmediaInstagram,
  socialnetworkFacebookLogin: socialnetworkFacebookLogin ?? _socialnetworkFacebookLogin,
  socialnetworkGoogleLogin: socialnetworkGoogleLogin ?? _socialnetworkGoogleLogin,
  paypalStatus: paypalStatus ?? _paypalStatus,
  paypalUsername: paypalUsername ?? _paypalUsername,
  paypalPassword: paypalPassword ?? _paypalPassword,
  paypalSignature: paypalSignature ?? _paypalSignature,
  paypalMode: paypalMode ?? _paypalMode,
  stripeStatus: stripeStatus ?? _stripeStatus,
  stripeSecretKey: stripeSecretKey ?? _stripeSecretKey,
  stripePublishableKey: stripePublishableKey ?? _stripePublishableKey,
  orangemoneyStripeSecretKey: orangemoneyStripeSecretKey ?? _orangemoneyStripeSecretKey,
  orangemoneyPublishableKey: orangemoneyPublishableKey ?? _orangemoneyPublishableKey,
  orangemoneyStatus: orangemoneyStatus ?? _orangemoneyStatus,
  generalhosttitlefirst: generalhosttitlefirst ?? _generalhosttitlefirst,
  generalhosttitlesecond: generalhosttitlesecond ?? _generalhosttitlesecond,
  generalhostlink: generalhostlink ?? _generalhostlink,
  generalbecomehostimage: generalbecomehostimage ?? _generalbecomehostimage
  
);
  String? get generalName => _generalName;
  String? get generalEmail => _generalEmail;
  String? get generalHeadCode => _generalHeadCode;
  String? get generalDefaultCurrency => _generalDefaultCurrency;
  String? get generalDefaultLanguage => _generalDefaultLanguage;
  String? get generalLogo => _generalLogo;
  String? get generalFavicon => _generalFavicon;
  String? get personalizationRowPerPage => _personalizationRowPerPage;
  String? get personalizationMinSearchPrice => _personalizationMinSearchPrice;
  String? get personalizationMaxSearchPrice => _personalizationMaxSearchPrice;
  String? get personalizationDateSeparator => _personalizationDateSeparator;
  String? get personalizationDateFormat => _personalizationDateFormat;
  String? get personalizationTimeZone => _personalizationTimeZone;
  String? get personalizationMoneyFormat => _personalizationMoneyFormat;
  String? get messagewizardPhoneNo => _messagewizardPhoneNo;
  String? get messagewizardTwilioSid => _messagewizardTwilioSid;
  String? get messagewizardTwilioToken => _messagewizardTwilioToken;
  String? get messagewizardDefaults => _messagewizardDefaults;
  String? get messagewizardStatus => _messagewizardStatus;
  String? get emailwizardDriver => _emailwizardDriver;
  String? get emailwizardEmaiHost => _emailwizardEmaiHost;
  String? get emailwizardPort => _emailwizardPort;
  String? get emailwizardFromAddress => _emailwizardFromAddress;
  String? get emailwizardFromName => _emailwizardFromName;
  String? get emailwizardEncryption => _emailwizardEncryption;
  String? get emailwizardUsername => _emailwizardUsername;
  String? get emailwizardPassword => _emailwizardPassword;
  String? get generalMinimumPrice => _generalMinimumPrice;
  String? get generalMaximumPrice => _generalMaximumPrice;
  String? get feesetupGuestServiceCharge => _feesetupGuestServiceCharge;
  String? get feesetupIvaTax => _feesetupIvaTax;
  String? get feesetupAccomodationTax => _feesetupAccomodationTax;
  String? get apiFacebookClientId => _apiFacebookClientId;
  String? get apiFacebookClientSecret => _apiFacebookClientSecret;
  String? get apiGoogleClientId => _apiGoogleClientId;
  String? get apiGoogleClientSecret => _apiGoogleClientSecret;
  String? get apiGoogleMapKey => _apiGoogleMapKey;
  String? get socialmediaFacebook => _socialmediaFacebook;
  String? get socialmediaGooglePlus => _socialmediaGooglePlus;
  String? get socialmediaTwitter => _socialmediaTwitter;
  String? get socialmediaLinkedin => _socialmediaLinkedin;
  String? get socialmediaPinterest => _socialmediaPinterest;
  String? get socialmediaYoutube => _socialmediaYoutube;
  String? get socialmediaInstagram => _socialmediaInstagram;
  String? get socialnetworkFacebookLogin => _socialnetworkFacebookLogin;
  String? get socialnetworkGoogleLogin => _socialnetworkGoogleLogin;
  String? get paypalStatus => _paypalStatus;
  String? get paypalUsername => _paypalUsername;
  String? get paypalPassword => _paypalPassword;
  String? get paypalSignature => _paypalSignature;
  String? get paypalMode => _paypalMode;
  String? get stripeStatus => _stripeStatus;
  String? get stripeSecretKey => _stripeSecretKey;
  String? get stripePublishableKey => _stripePublishableKey;
  String? get orangemoneyStripeSecretKey => _orangemoneyStripeSecretKey;
  String? get orangemoneyPublishableKey => _orangemoneyPublishableKey;
  String? get orangemoneyStatus => _orangemoneyStatus;
  String? get generalhosttitlefirst => _generalhosttitlefirst;
  String? get generalhosttitlesecond => _generalhosttitlesecond;
  String? get generalhostlink => _generalhostlink;
  String? get generalbecomehostimage => _generalbecomehostimage;
  

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['general_name'] = _generalName;
    map['general_email'] = _generalEmail;
    map['general_head_code'] = _generalHeadCode;
    map['general_default_currency'] = _generalDefaultCurrency;
    map['general_default_language'] = _generalDefaultLanguage;
    map['general_logo'] = _generalLogo;
    map['general_favicon'] = _generalFavicon;
    map['personalization_row_per_page'] = _personalizationRowPerPage;
    map['personalization_min_search_price'] = _personalizationMinSearchPrice;
    map['personalization_max_search_price'] = _personalizationMaxSearchPrice;
    map['personalization_date_separator'] = _personalizationDateSeparator;
    map['personalization_date_format'] = _personalizationDateFormat;
    map['personalization_timeZone'] = _personalizationTimeZone;
    map['personalization_money_format'] = _personalizationMoneyFormat;
    map['messagewizard_phone_no'] = _messagewizardPhoneNo;
    map['messagewizard_twilio_sid'] = _messagewizardTwilioSid;
    map['messagewizard_twilio_token'] = _messagewizardTwilioToken;
    map['messagewizard_defaults'] = _messagewizardDefaults;
    map['messagewizard_status'] = _messagewizardStatus;
    map['emailwizard_driver'] = _emailwizardDriver;
    map['emailwizard_emai_host'] = _emailwizardEmaiHost;
    map['emailwizard_port'] = _emailwizardPort;
    map['emailwizard_from_address'] = _emailwizardFromAddress;
    map['emailwizard_from_name'] = _emailwizardFromName;
    map['emailwizard_encryption'] = _emailwizardEncryption;
    map['emailwizard_username'] = _emailwizardUsername;
    map['general_minimum_price'] = _emailwizardPassword;
    map['emailwizard_password'] = _generalMinimumPrice;
    map['general_maximum_price'] = _generalMaximumPrice;
    map['feesetup_guest_service_charge'] = _feesetupGuestServiceCharge;
    map['feesetup_iva_tax'] = _feesetupIvaTax;
    map['feesetup_accomodation_tax'] = _feesetupAccomodationTax;
    map['api_facebook_client_id'] = _apiFacebookClientId;
    map['api_facebook_client_secret'] = _apiFacebookClientSecret;
    map['api_google_client_id'] = _apiGoogleClientId;
    map['api_google_client_secret'] = _apiGoogleClientSecret;
    map['api_google_map_key'] = _apiGoogleMapKey;
    map['socialmedia_facebook'] = _socialmediaFacebook;
    map['socialmedia_google_plus'] = _socialmediaGooglePlus;
    map['socialmedia_twitter'] = _socialmediaTwitter;
    map['socialmedia_linkedin'] = _socialmediaLinkedin;
    map['socialmedia_pinterest'] = _socialmediaPinterest;
    map['socialmedia_youtube'] = _socialmediaYoutube;
    map['socialmedia_instagram'] = _socialmediaInstagram;
    map['socialnetwork_facebook_login'] = _socialnetworkFacebookLogin;
    map['socialnetwork_google_login'] = _socialnetworkGoogleLogin;
    map['paypal_status'] = _paypalStatus;
    map['paypal_username'] = _paypalUsername;
    map['paypal_password'] = _paypalPassword;
    map['paypal_signature'] = _paypalSignature;
    map['paypal_mode'] = _paypalMode;
    map['stripe_status'] = _stripeStatus;
    map['stripe_secret_key'] = _stripeSecretKey;
    map['stripe_publishable_key'] = _stripePublishableKey;
    map['orangemoney_stripe_secret_key'] = _orangemoneyStripeSecretKey;
    map['orangemoney_publishable_key'] = _orangemoneyPublishableKey;
    map['orangemoney_status'] = _orangemoneyStatus;
    map['general_host_title_first'] = generalhosttitlefirst;
    map['general_host_title_second'] = generalhosttitlesecond;
    map['general_host_link'] = generalhostlink;
    map ['general_becomehost_image'] = generalbecomehostimage;
    return map;
  }

}