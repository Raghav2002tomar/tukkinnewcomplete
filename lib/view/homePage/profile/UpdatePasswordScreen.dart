import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({super.key});

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  String newPassword = "";
  bool obscurePass = true;
  bool obscureNewPass = true;
  bool obscureConfirmPass = true;
  TextEditingController textEditingControllerOldPass = TextEditingController();
  TextEditingController textEditingControllerNewPass = TextEditingController();
  TextEditingController textEditingControllerConfirmPass = TextEditingController();
  GlobalKey<FormState> formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    print(textEditingControllerOldPass);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          title: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              padding:
              const EdgeInsets.only(left: 16, right: 16, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: CustomTheme.theamColor)),
              child:  Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: CustomTheme.theamColor,
                  ),
                  Text(
                    "Back".tr,
                    style: TextStyle(
                        color: CustomTheme.theamColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            Image.asset(
              'assets/images/logo.png',
              height: 50,
            ),
            SizedBox(
              width: 16,
            )
          ]),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: CustomTheme.pagePadding,
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Change Password".tr,
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.loginTopText),
                ),
                const SizedBox(
                  height: 48,
                ),
                Text(
                  "Old Password".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: textEditingControllerOldPass,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: notifire.getwhiteblackcolor,
                    // obscureText: obscurePass,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      // newPassword = value;
                    },
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your old Password'.tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: CustomTheme.theamColor, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greycolor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greycolor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          obscurePass = !obscurePass;
                          setState(() {});
                        },
                        child: !obscurePass
                            ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/showpassowrd.png",
                            height: 10,
                            width: 10,
                            color: notifire.getgreycolor,
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/HidePassword.png",
                            height: 10,
                            width: 10,
                            color: notifire.getgreycolor,
                          ),
                        ),
                      ),
                      hintText: "Old Password".tr,
                      hintStyle: TextStyle(
                        color: notifire.getgreycolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "New Password".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: textEditingControllerNewPass,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: notifire.getwhiteblackcolor,
                    // obscureText: obscurePass,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onChanged: (value) {
                      newPassword = value;
                    },
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    validator: (value) {
                    Pattern pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regex = new RegExp(pattern as String);
                    if (!regex.hasMatch(value!))
                      return '''Password must have:
- At least 1 uppercase letter
- At least 1 lowercase letter
- At least 1 number
- At least 1 special character (!@#\$&*~.)
 - Minimum 8 characters''';
                    else
                      return null;
                    // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter password'.tr;
                    // }
                    // if (value.isEmpty) {
                    //   return 'Please enter password'.tr;
                    // } else {
                    //   if (!regex.hasMatch(value)) {
                    //     return '8 Character with Alphanumeric password'.tr;
                    //   } else {
                    //     return null;
                    //   }
                    // }

                    // return null;
                  },
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Please enter your New Password'.tr;
                    //   }
                    //   return null;
                    // },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(
                            color: CustomTheme.theamColor, width: 2),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greycolor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greycolor,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          obscureNewPass = !obscureNewPass;
                          setState(() {});
                        },
                        child: !obscureNewPass
                            ? Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/showpassowrd.png",
                            height: 10,
                            width: 10,
                            color: notifire.getgreycolor,
                          ),
                        )
                            : Padding(
                          padding: const EdgeInsets.all(10),
                          child: Image.asset(
                            "assets/images/HidePassword.png",
                            height: 10,
                            width: 10,
                            color: notifire.getgreycolor,
                          ),
                        ),
                      ),
                      hintText: "New Password".tr,
                      hintStyle: TextStyle(
                        color: notifire.getgreycolor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Confirm Password".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerConfirmPass,
                  keyboardType: TextInputType.visiblePassword,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: notifire.getwhiteblackcolor,
                  ),
                 validator: (value) {
                    Pattern pattern =
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                    RegExp regex = new RegExp(pattern as String);
                    if (!regex.hasMatch(value!))
                      return '''Password must have:
- At least 1 uppercase letter
- At least 1 lowercase letter
- At least 1 number
- At least 1 special character (!@#\$&*~.)
- Minimum 8 characters''';
                    else
                      return null;
                    // RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                    // if (value == null || value.isEmpty) {
                    //   return 'Please enter password'.tr;
                    // }
                    // if (value.isEmpty) {
                    //   return 'Please enter password'.tr;
                    // } else {
                    //   if (!regex.hasMatch(value)) {
                    //     return '8 Character with Alphanumeric password'.tr;
                    //   } else {
                    //     return null;
                    //   }
                    // }

                    // return null;
                  },
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                          color: CustomTheme.theamColor, width: 2),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greycolor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: greycolor,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: InkWell(
                      onTap: () {
                        obscureConfirmPass = !obscureConfirmPass;
                        setState(() {});
                      },
                      child: !obscureConfirmPass
                          ? Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/showpassowrd.png",
                          height: 10,
                          width: 10,
                          color: notifire.getgreycolor,
                        ),
                      )
                          : Padding(
                        padding: const EdgeInsets.all(10),
                        child: Image.asset(
                          "assets/images/HidePassword.png",
                          height: 10,
                          width: 10,
                          color: notifire.getgreycolor,
                        ),
                      ),
                    ),
                    hintText: "Confirm Password".tr,
                    hintStyle: TextStyle(
                      color: notifire.getgreycolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 48,
                ),
                GestButton(
                  Width: Get.size.width,
                  buttoncolor: blueColor,
                  buttontext: "Continue".tr,
                  style: TextStyle(
                    fontFamily: "Gilroy Bold",
                    color: WhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  onclick: () async {
                    if(!formKey.currentState!.validate()){
                      return;
                    }
                    Map<String, String> postData = {
                      "old_password": textEditingControllerOldPass.text,
                      "new_password": textEditingControllerNewPass.text,
                      "conf_new_password": textEditingControllerConfirmPass.text,
                    };
                    var response = await httpPost(Config.updatePassword, postData);
                    if (response != null) {
                      if (response['status'] == 200) {
                        showToastMessage(response['message']);
                      } else {
                        showToastMessage(response['error']);
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
