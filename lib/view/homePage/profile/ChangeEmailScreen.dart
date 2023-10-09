import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/CheckEmail.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/UserOtpSignUpScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../helper/FontstyleModel.dart';
import '../../../workspace.dart';
import 'package:get/get.dart';

class ChangeEmailScreen extends StatefulWidget {
  const ChangeEmailScreen({super.key});

  @override
  State<ChangeEmailScreen> createState() => _ChangeEmailScreenState();
}

class _ChangeEmailScreenState extends State<ChangeEmailScreen> {
  TextEditingController textEditingControllerEmail = TextEditingController();
  RxBool isValidEmail = false.obs;
    GlobalKey<FormState> globalKey=GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: CustomTheme.theamColor,
          elevation: 0,
          title: Text("Change Email")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left:16.0,right: 16,bottom: 16,top: 100),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                Form(key: globalKey,
                  child: TextFormField(
                    controller: textEditingControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: notifire.getwhiteblackcolor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    decoration: InputDecoration(
                      suffixIcon: Obx(() => isValidEmail.value
                          ? Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.green,
                            )
                          : SizedBox()),
                      hintText: "Email",
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: CustomTheme.theamColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(width: 1, color: Colors.grey)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                    validator: (value) {
                      print(value);
                      if (!GetUtils.isEmail(value!)) {
                        isValidEmail.value = false;
                        return 'Please enter Valid email';
                      } else {
                        isValidEmail.value = true;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                    onTap: () async {
                      if (!globalKey.currentState!.validate()) {
                        return;
                      }
                      showLoading();
                      var response=await httpPost(Config.checkEmail, {"email":textEditingControllerEmail.text});
                      closeLoading();
                      if(response!=null){
                        CheckEmail checkEmail=CheckEmail.fromJson(response);
                        if(checkEmail.status==200){
                          showToastMessage(checkEmail.message);
                          Get.off(()=>UserOtpSignUpScreen(number: "", countryCode: "", otpValue: checkEmail.data!.otp!, email: textEditingControllerEmail.text,changeEmail: true,));
                        }else{
                          showToastMessage(checkEmail.error);
                        }

                      }
                    },
                    child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                            color: CustomTheme.theamColor,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                            child: Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )))),
                      
              ]),
        ),
      ),
    );
  }
}
