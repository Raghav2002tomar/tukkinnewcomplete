import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/Images.dart';
import 'package:Tukki/utils/ProjectColors.dart';

import 'package:Tukki/utils/common_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserGoogleSignUpScreen extends StatefulWidget {
  final String name;
  final String email;
  final String id;
  final String photoUrl;
  const UserGoogleSignUpScreen(
      {super.key,
        required this.name,
        required this.email,
        required this.id,
        required this.photoUrl});

  @override
  State<UserGoogleSignUpScreen> createState() => _UserGoogleSignUpScreenState();
}

class _UserGoogleSignUpScreenState extends State<UserGoogleSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String cuntryCode = "";
  late ColorNotifire notifire;


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    // Navigator.of(context, rootNavigator: true).pop();
    return SafeArea(
        child: Scaffold(
          backgroundColor: notifire.getbgcolor,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Image.asset(Images.login_back,
                    color: notifire.getwhiteblackcolor),
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Get.size.height,
                  width: Get.size.width,
                  child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Get Started!".tr,
                              style: TextStyle(
                                fontSize: 25,
                                fontFamily: FontStyles.gilroyBold,
                                color: notifire.getwhiteblackcolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Create an account to continue.".tr,
                              style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,
                                color: notifire.getwhiteblackcolor,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: TextEditingController.fromValue(TextEditingValue(text: widget.name)),
                              cursorColor: notifire.getwhiteblackcolor,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: notifire.getwhiteblackcolor,
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: notifire.getgreycolor),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    Images.user,
                                    height: 10,
                                    width: 10,
                                    color: notifire.getgreycolor,
                                  ),
                                ),
                                hintText: "Full Name".tr,
                                hintStyle: TextStyle(
                                  color: notifire.getgreycolor,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your name'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: TextEditingController.fromValue(TextEditingValue(text: widget.email)),
                              cursorColor: notifire.getwhiteblackcolor,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              style: TextStyle(
                                fontFamily: 'Gilroy',
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: notifire.getwhiteblackcolor,
                              ),
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: notifire.getgreycolor),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(color: notifire.getgreycolor),
                                ),
                                prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset(
                                    Images.email,
                                    height: 10,
                                    width: 10,
                                    color: notifire.getgreycolor,
                                  ),
                                ),
                                hintText: "Email Address".tr,
                                hintStyle: TextStyle(
                                  color: notifire.getgreycolor,
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty && value == "@") {
                                  return 'Please enter Valid email'.tr;
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          /* Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: IntlPhoneField(
                      keyboardType: TextInputType.number,
                      cursorColor: notifire.getwhiteblackcolor,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      controller: signUpController.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      dropdownIcon: Icon(
                        Icons.arrow_drop_down,
                        color: notifire.getgreycolor,
                      ),
                      dropdownTextStyle: TextStyle(
                        color: notifire.getgreycolor,
                      ),
                      style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: notifire.getwhiteblackcolor,
                      ),
                      onChanged: (value) {
                        cuntryCode = value.countryCode;
                      },
                      onCountryChanged: (value) {
                        signUpController.number.text = '';
                      },
                      decoration: InputDecoration(
                        helperText: null,
                        labelText: "Mobile Number".tr,
                        labelStyle: TextStyle(
                          color: notifire.getgreycolor,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                            color: notifire.getgreycolor,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: notifire.getgreycolor,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      validator: (p0) {
                        if (p0!.completeNumber.isEmpty) {
                          return 'Please enter your number'.tr;
                        } else {}
                        return null;
                      },
                    ),
                  ),*/



                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Transform.scale(
                                    scale: 1,
                                    child: Checkbox(
                                      value: true,
                                      side:
                                      const BorderSide(color: Color(0xffC5CAD4)),
                                      activeColor: blueColor,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      onChanged: (newbool) async {
                                        // otpUpController
                                        //     .checkTermsAndCondition(newbool);
                                        final prefs =
                                        await SharedPreferences.getInstance();
                                        await prefs.setBool('Remember', true);
                                      },
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "By creating an account,you agree to our".tr,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: notifire.getgreycolor,
                                          fontFamily: FontStyles.gilroyMedium,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        "Terms and Condition".tr,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: blueColor,
                                          fontFamily: FontStyles.gilroyBold,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          GestButton(
                            Width: Get.size.width,
                            height: 50,
                            buttoncolor: blueColor,
                            margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
                            buttontext: "Continue".tr,
                            style: TextStyle(
                              fontFamily: FontStyles.gilroyBold,
                              color: WhiteColor,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            onclick: () async {
                              try {

                                if (_formKey.currentState!.validate()){
                                  buildShowDialog(context);
                                  // bool flag = await otpUpController.registerGoogleUser(context, widget.name,widget.email,widget.id,widget.photoUrl);
                                  // if (flag) {
                                  //   Navigator.of(context, rootNavigator: true).pop();
                                  //   final pref =await SharedPreferences.getInstance();
                                  //   await pref.setBool("Remember", true);
                                  //   await pref.setBool("Firstuser", true);
                                  //   Get.toNamed(Routes.bottoBarScreen);
                                  // } else {
                                  //   showToastMessage("Error In Connection");
                                  //   Navigator.of(context, rootNavigator: true).pop();
                                  // }
                                } else {
                                  // if (otpUpController.chack == false) {
                                  //   showToastMessage(
                                  //       "Please select Terms and Condition".tr);
                                  //
                                  // }
                                }
                              } finally {
                                //Navigator.of(context, rootNavigator: true).pop();
                              }
                            },
                            // onclick: () {
                            //   print("hello");
                            //   signUpController.setUserApiData(cuntryCode);
                            //   if ((_formKey.currentState?.validate() ?? false) &&
                            //       (signUpController.chack == true)) {
                            //     signUpController.setUserApiData(cuntryCode);
                            //   } else {
                            //     if (signUpController.chack == false) {
                            //       showToastMessage(
                            //           "Please select Terms and Condition".tr);
                            //       print('hello obj');
                            //     }
                            //   }
                            // }
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 45),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Already have an account?".tr,
                                    style: TextStyle(
                                      fontFamily: FontStyles.gilroyMedium,
                                      color: notifire.getgreycolor,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.login);
                                    },
                                    child: Text(
                                      "Login".tr,
                                      style: TextStyle(
                                        color: blueColor,
                                        fontFamily: FontStyles.gilroyBold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              )),
        ));
  }
}