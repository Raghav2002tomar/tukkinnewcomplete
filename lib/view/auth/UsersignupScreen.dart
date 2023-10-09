import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/LoginController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/LoginModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';

import 'package:Tukki/utils/common_widgets.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/UserGoogleSignUpScreen.dart';
import 'package:Tukki/view/auth/UserOtpSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSignUpScreen extends StatefulWidget {
  const UserSignUpScreen({super.key});

  @override
  State<UserSignUpScreen> createState() => _UserSignUpScreenState();
}

class _UserSignUpScreenState extends State<UserSignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserloginController controller=Get.find();
  late ColorNotifire notifire;
  String cuntryCode = "";
  bool isChecked = false;

  String countryDialCode = "225";
  var emailTextColor=Colors.black;

  TextEditingController textEditingControllerFirstName = TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPhone = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerDob = TextEditingController();
  bool showPassword=true;
  bool showConfirmPassword=true;
  bool check = false;

  String countryIsoCode="CI";

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
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
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.arrow_back_ios,
                    color: CustomTheme.theamColor,
                  ),
                  Text(
                    "Back",
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
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Create your account.".tr,
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.loginTopText),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "First Name".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                  child: TextFormField(
                    controller: textEditingControllerFirstName,
                    keyboardType: TextInputType.name,
                    cursorColor: notifire.getwhiteblackcolor,
                    textCapitalization: TextCapitalization.words,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    decoration: InputDecoration(
                      hintText: "First Name".tr,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: CustomTheme.theamColor,
                          width: 2,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              width: 1, color: CustomTheme.theamColor)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: CustomTheme.theamColor),
                      ),
                    ),
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Last Name".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerLastName,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.words,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: notifire.getwhiteblackcolor,
                  ),
                  decoration: InputDecoration(
                    hintText: "Last Name".tr,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: CustomTheme.theamColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1, color: CustomTheme.theamColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: CustomTheme.theamColor),
                    ),
                  ),
                  validator: (value) {
                    print(value);
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Email".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
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
                    suffixIcon: Obx(() => controller.isValidEmail.value?Icon(Icons.check_circle_outline_outlined,color: Colors.green,):SizedBox()),
                    hintText: "Email".tr,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: CustomTheme.theamColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1, color: CustomTheme.theamColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: CustomTheme.theamColor),
                    ),
                  ),
                  validator: (value) {
                    print(value);
                    if (!GetUtils.isEmail(value!)) {
                      controller.isValidEmail.value=false;
                      return 'Please enter Valid email'.tr;
                    }else{
                      controller.isValidEmail.value=true;
                    }
                    // if (value == null || value.isEmpty || value == '@') {
                    //   return 'Please enter Valid email'.tr;
                    // }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Mobile".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                IntlPhoneField(
                  disableLengthCheck: true,
                  keyboardType: TextInputType.number,
                  cursorColor: notifire.getwhiteblackcolor,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  controller: textEditingControllerPhone,
                  initialCountryCode: "CI",
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  dropdownIcon: Icon(
                    Icons.arrow_drop_down,
                    color: notifire.getgreycolor,
                  ),
                  dropdownTextStyle: TextStyle(color: notifire.getgreycolor),
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: notifire.getwhiteblackcolor,
                  ),
                  onCountryChanged: (value) {
                    print(value.code);
                    countryDialCode = value.dialCode;
                    countryIsoCode = value.code;

                    // userloginController.number.text = '';
                    // userloginController.password.text = '';
                  },
                  onChanged: (value) {
                    cuntryCode = value.countryCode;
                  },
                  validator: (value) {
                    if(value!.number.length>1 ){
                      if(value.number.startsWith("0")){
                        textEditingControllerPhone.text=value.number.substring(1,value.number.length);
                        textEditingControllerPhone.selection = TextSelection.fromPosition(
                          TextPosition(offset: textEditingControllerPhone.text.length),
                        );
                      }

                    }
                    if (!value.number.isPhoneNumber) {
                      return "fill valid phone number";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Mobile",
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: notifire.getgreycolor,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1, color: CustomTheme.theamColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          // color: notifire.getgreycolor,
                          ),
                    ),
                  ),
                  invalidNumberMessage: "please enter your mobile number".tr,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Password".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: textEditingControllerPassword,
                  obscureText: showPassword,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
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
                    hintText: "Password".tr,
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
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1, color: CustomTheme.theamColor)),
                    suffixIcon: InkWell(
                      onTap: () {
                        if(showPassword){
                          showPassword=false;
                        }else{
                          showPassword=true;
                        }
                        setState(() {
                        });
                      },
                      child: !showPassword
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
                  ),
                ),
                SizedBox(
                  height: 16,
                ),

                SizedBox(
                  height: 8,
                ),
                Text(
                  "Confirm Password".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 8,
                ),
                TextFormField(
                  // controller: textEditingControllerPassword,
                  obscureText: showConfirmPassword,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: notifire.getwhiteblackcolor,
                  ),
                  validator: (value) {

                    if (textEditingControllerPassword.text!= value!)
                      return 'Password did not match';
                    else
                      return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Password".tr,
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
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1, color: CustomTheme.theamColor)),
                    suffixIcon: InkWell(
                      onTap: () {
                        if(showConfirmPassword){
                          showConfirmPassword=false;
                        }else{
                          showConfirmPassword=true;
                        }
                        setState(() {
                        });
                      },
                      child: !showConfirmPassword
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
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Date of Birth".tr,
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.theamColor,
                      fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  readOnly: true,
                  controller: textEditingControllerDob,
                  // keyboardType: TextInputType.datetime,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: notifire.getwhiteblackcolor,
                  ),

                  decoration: InputDecoration(
                    hintText: "Date of Birth".tr,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide:
                          BorderSide(color: CustomTheme.theamColor, width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                            width: 1, color: CustomTheme.theamColor)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: CustomTheme.theamColor),
                    ),
                  ),
                  validator: (value) {
                    print(value);
                    if (value == null || value.isEmpty) {
                      return 'Please enter Date of Birth'.tr;
                    }
                    return null;
                  },
                  onTap: () async {

                    DatePicker.showSimpleDatePicker(
                      context,
                      initialDate: DateTime.now().subtract(Duration(days: 6570)),
                      firstDate: DateTime(1960),
                      lastDate: DateTime.now(),
                      dateFormat: "dd-MMMM-yyyy",
                      looping: true,
                    ).then((selectedDate) {
                      if (selectedDate != null) {
                        textEditingControllerDob.text =
                            DateFormat('yyyy-MM-dd').format(selectedDate);
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: check,
                      side: const BorderSide(color: Color(0xffC5CAD4)),
                      activeColor: blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      onChanged: (newBool) async {
                        if(check){
                          check=false;
                        }else{
                          check=true;
                        }
                        setState(() {
                        });
                        final prefs = await SharedPreferences.getInstance();
                        await prefs.setBool("Remember", true);
                        await prefs.setBool("Firstuser", true);
                      },
                    ),
                    Text(
                      "By sign up, I agree to terms of service and\n privacy policy.".tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: FontStyles.gilroyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                GestButton(
                  buttoncolor: blueColor,
                  buttontext: "Continue".tr,
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyBold,
                    color: WhiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  onclick: () async {
                    if (textEditingControllerPhone.text.isEmpty) {
                      showToastMessage("Fill valid mobile number".tr);
                      return;
                    }
                    if (check== false) {
                      showToastMessage("Please select Terms and Condition".tr);
                      return;
                    }
                    if(!countryDialCode.startsWith("+")){
                      countryDialCode = '+$countryDialCode';
                    }


                    try {
                      if (_formKey.currentState!.validate() && (check == true)) {
                        buildShowDialog(context);

                        var tokenn=await controller.getToken();
                        var data = await httpPost(Config.registerUser, {
                          "phone": textEditingControllerPhone.text,
                          "email": textEditingControllerEmail.text,
                          "first_name": textEditingControllerFirstName.text,
                          "phone_country": cuntryCode,
                          "default_country": countryIsoCode,
                          "password": textEditingControllerPassword.text,
                          "last_name": textEditingControllerLastName.text,
                          "birthdate": textEditingControllerDob.text,
                          "fcm":tokenn
                        });

                        Navigator.of(context, rootNavigator: true).pop();
                        if (data != null) {
                          LoginModel loginModel = LoginModel.fromJson(data);
                          if (loginModel.status == 200) {
                            showToastMessage(loginModel.message);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => UserOtpSignUpScreen(number: textEditingControllerPhone.text, countryCode: "$countryDialCode", otpValue: loginModel.data!.otpValue!, email: "")));
                          } else {
                            showToastMessage(loginModel.error);
                          }
                        } else {
                          showToastMessage("Something went wrong".tr);
                        }
                      }
                    } finally {
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  methodCallGoogleLogin() async {
    final _googleSignIn = GoogleSignIn();
    var result = await _googleSignIn.signIn();
    if (result!.email.isNotEmpty) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => UserGoogleSignUpScreen(
                  name: result.displayName.toString(),
                  email: result.email.toString(),
                  id: result.id.toString(),
                  photoUrl: result.photoUrl.toString())));
    }
  }
}
