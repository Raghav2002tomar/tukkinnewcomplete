import 'dart:convert';
import 'package:Tukki/view/auth/loginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../workspace.dart';
import 'Api.dart';

bool printHeaders = false;

Future httpGet(path) async {
  dynamic responseData;
  String url = "";
  String? authToken = "";
  dynamic headers = {};

  try {
    String apiBaseUrl = Config.baseurl;
    url = apiBaseUrl + path;

    final FirebaseAuth _auth = FirebaseAuth.instance;
    authToken = await _auth.currentUser?.getIdToken(true);
    headers = {"x-auth-token": authToken ?? ""};

    dynamic result = await http.get(Uri.parse(url), headers: headers);
    responseData = json.decode(result.body);

    return responseData;
  } catch (err) {
    print("httpGet Exception:" + err.toString());
    responseData = {"success": false, "message": "Something got wrong"};
    return responseData;
  } finally {
    print(
        '---------HTTP SERVICE---------\nmothod => httpGet\nURL => $url\nheaders => ${printHeaders == true ? headers : "Headers printing disabled"}\npostData => \nresponsenew => $responseData');
  }
}

Future httpDelete(path) async {
  dynamic responseData;
  String url = "";
  String? authToken = "";
  dynamic headers = {};

  try {
    String apiBaseUrl = Config.baseurl;
    url = apiBaseUrl + path;

    final FirebaseAuth _auth = FirebaseAuth.instance;
    authToken = await _auth.currentUser?.getIdToken(true);
    headers = {"x-auth-token": authToken ?? ""};

    dynamic result = await http.delete(Uri.parse(url), headers: headers);
    responseData = json.decode(result.body);

    return responseData;
  } catch (err) {
    print("httpGet Exception:" + err.toString());
    responseData = {"success": false, "message": "Something got wrong"};
    return responseData;
  } finally {
    print(
        '---------HTTP SERVICE---------\nmothod => httpDelete\nURL => $url\nheaders => ${printHeaders == true ? headers : "Headers printing disabled"}\npostData => \nresponse => $responseData');
  }
}

bool shouldLogout=false;
Future  httpPost(path, data) async {

  try {
    String apiBaseUrl = Config.baseurl;
    var url = apiBaseUrl + path;
    var headers = {"x-auth-token": ""};

    data['token']=token;
    data['latitude']=latitudeGlobal;data['longitude']=longitudeGlobal;

    print(token);
    print('=======');
    print(url);
    print(jsonEncode(data));

    dynamic result = await http.post(Uri.parse(url), headers: headers, body: data);
    var responseData = json.decode(const Utf8Codec().decode(result.bodyBytes));
    print(responseData);
    if(responseData['error']!=null && responseData['error']=="global.token_not_match"){
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('Firstuser');
      await prefs.remove('Remember');
      GetStorage().erase();

      print("LOGOUTReason 6");
      if(shouldLogout==false){
        shouldLogout=true;
        Get.offAll(()=>LoginScreen());
      }

    }
    return responseData;
  } catch (err) {
      print(err);
      Fluttertoast.showToast(msg: "Something went wrong");
  }
}

Future httpPostJSON(path, Map<String, dynamic> data) async {
  dynamic responseData;
  String url = "";
  String? authToken = "";
  dynamic headers = {};

  try {
    String apiBaseUrl = Config.baseurl;
    url = apiBaseUrl + path;

    // final FirebaseAuth _auth = FirebaseAuth.instance;
    // authToken = await _auth.currentUser?.getIdToken(true);
    headers = {
      "Content-Type": "application/json",
      "x-auth-token": authToken ?? ""
    };

// print("httpPostJSON Exception:" + err.toString());

    dynamic result = await http.post(Uri.parse(url),
        headers: headers, body: json.encode(data));
    responseData = json.decode(const Utf8Codec().decode(result.bodyBytes));

    return responseData;
  } catch (err) {
    print("httpPostJSON Exception:" + err.toString());
    responseData = {"success": false, "message": "Something got wrong"};
    return responseData;
  } finally {
    print(
        '---------HTTP SERVICE---------\nmothod => httpPostJSON\nURL => $url\nheaders => ${printHeaders == true ? headers : "Headers printing disabled"}\npostData => $data\nresponse => $responseData');
  }
}
