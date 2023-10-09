import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/ChangePhoneModel.dart';
import 'package:Tukki/model/CheckMobileModel.dart';
import 'package:Tukki/model/LoginModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import '../../workspace.dart';


class UserloginController extends GetxController implements GetxService {

  RxBool isValidEmail=false.obs;
  RxBool isResendLoading=false.obs;
  Location location = Location();

  verifyOtp(map) async {
    return await httpPost(Config.otpVerification, map);
  }

  resendOtp(map) async {
    return await httpPost(Config.resendOtp, map);
  }

  resendToken(map) async {
    return await httpPost(Config.resendToken, map);
  }
  verifyResetToken(map) async {
    return await httpPost(Config.verifyResetToken, map);
  }

  checkMobileNumber(map) async {
    showLoading();
    var response= await httpPost(Config.checkMobileNumber, map);
    closeLoading();
    if(response['status']!=200){
      showErrorToastMessage(response['error']);
    }
    return CheckMobileModel.fromJson(response);
  }

  changeMobileNumber(map) async {
    // Map map={
    //   "phone":phone,
    //   "phone_country":phoneCountry,
    //   "otp_value":otpValue
    // };
    var response= await httpPost(Config.changeMobileNumber, map);
    return ChangePhoneModel.fromJson(response);
  }


  getUserLocation() async {
    try {
      print("1111111100000000");
      bool serviceEnabled;
      PermissionStatus permissionGranted;
      LocationData locationData;
      serviceEnabled = await location.serviceEnabled();
      if (!serviceEnabled) {
        serviceEnabled = await location.requestService();
        if (!serviceEnabled) {
          return;
        }
      }

      print("11111111xxxxxxx");
      permissionGranted = await location.hasPermission();
      if (permissionGranted == PermissionStatus.denied) {
        permissionGranted = await location.requestPermission();
        if (permissionGranted != PermissionStatus.granted) {
          return;
        }
      }
      print("11111111zzzzzz");
      locationData = await location.getLocation();
      if (locationData.latitude != null && locationData.longitude != null) {
        latitudeGlobal = locationData.latitude.toString();
        longitudeGlobal = locationData.longitude.toString();
        print("11111111bbbbbbb");
      } else {
        print("11111111ccccc");
        return;
      }
    } finally {
    }
  }
//
//   showOfPassword() {
//     showPassword = !showPassword;
//     update();
//   }
//
//   newShowOfPassword() {
//     newShowPassword = !newShowPassword;
//     update();
//   }
//
//   newConformShowOfPassword() {
//     conformPassword = !conformPassword;
//     update();
//   }
//
//
//
// /* Method Call to do login process end */
//   updateProfileImage(String? base64image) async {
//     UserData userObj = UserData();
//     try {
//       Map map = {
//         "uid": userObj.getData.read("UserLogin")["id"].toString(),
//         "img": base64image,
//       };
//       Uri uri = Uri.parse(Config.baseurl + Config.updateProfilePic);
//       var response = await http.post(
//         uri,
//         body: jsonEncode(map),
//       );
//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         userObj.save("UserLogin", result["UserLogin"]);
//       }
//       update();
//     } catch (e) {
//       print(e.toString());
//     }
//   }
  getToken() async {
    return await FirebaseMessaging.instance.getToken();
  }
}