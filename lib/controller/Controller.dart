import 'dart:convert';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/LoginModel.dart';
import 'package:Tukki/model/PostDatamodel.dart';
import 'package:Tukki/model/UserThreadmodel.dart';
import 'package:Tukki/model/socialLoginModel.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../workspace.dart';

class Controller extends GetxController{
  RxBool isUploadingImage=false.obs;

  DateRangePickerController dateRangePickerController = DateRangePickerController();
  TextEditingController textEditingControllerCity=TextEditingController();
  RxInt numberOfGuest = 1.obs;
  RxString startDate="".obs;
  RxString endDate="".obs;
  String? citySelected;
  String slat="";
  String sLong="";
  static int selectedRadio=-1.obs;
  RxDouble selectedRatingValue=0.0.obs;


  askForPermission() async {
    PermissionStatus permissionStatus=await Permission.storage.request();
    if (!permissionStatus.isGranted) {
      showToastMessage("Storage permission must be allowed");
      await Permission.storage.request();
    }
  }
  getUserOpenTicket() async {
    var response = await httpPost(Config.getUserThreads, {});
    if (response != null) {
      return UserThreadModel.fromJson(response);
    }
  }
   getUsercloseTicket() async {
     Map<String, String> postData = {"thread_status": "0"};
    var response = await httpPost(Config.getUserThreads, postData);
    if (response != null) {
      return UserThreadModel.fromJson(response);
    }
  }

  createSupportTicket(title, desc) async {
    Map<String, String> postData = {"title": title, "description": desc};
    var response = await httpPost(Config.createSupportTicket, postData);
    print(response);
  }

  conversations(propertyId,bookingId)async{
    Map<String, String> postData = {"property_id":propertyId,"booking_id":bookingId};
    var response = await httpPost(Config.conversations, postData);
    return response;
  }
  latestmessage(conversation_id,offset)async{
    Map<String, String> postData = {"conversation_id": conversation_id,"offset":'$offset'};
    var response = await  httpPost(Config.latestmessage, postData);
    PostDataModel postDataModel=PostDataModel.fromJson(response);
    return postDataModel;

  }

  socialLogin(String displayName, String email, String id,String profileImage,String loginType,String identityToken,String authorizationCode)async{
    Map<String, String> postData = {"displayName": displayName,"email":email,"id":id,"profile_image":profileImage,"login_type":loginType,"identityToken":identityToken,"authorizationCode":authorizationCode};
    var response = await  httpPost(Config.socialLogin, postData);
    try{
      LoginModel socialLoginModel=LoginModel.fromJson(response);
      return socialLoginModel;
    }catch(e){
      print("ERrrrrrrr");
      print(e);
      closeLoading();
    }

  }
  updateToken() async {
    var tokken=await FirebaseMessaging.instance.getToken();
    print(tokken);
    if(tokken!=null){
      httpPost(Config.fcmUpdate, {"fcm":tokken});
    }
  }


}