import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/controller/LoginController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/model/LoginModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/socialLoginModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/common_widgets.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/GoogleUpdateProfile.dart';
import 'package:Tukki/view/auth/PhoneUpdateScreen.dart';
import 'package:Tukki/view/auth/UserGoogleSignUpScreen.dart';
import 'package:Tukki/view/auth/UserSignUpScreen.dart';
import 'package:Tukki/view/homePage/HomePage.dart';
import 'package:Tukki/workspace.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:help_me/help_me.dart';
import 'package:ndialog/ndialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import '../../config/DataStore.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserloginController userloginController = Get.put(UserloginController());
  late ColorNotifire notifire;
  String cuntryCode = "";
  bool isChecked = false;
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerPass = TextEditingController();
  bool showPassword = true;
  GlobalKey globalKey=GlobalKey();

  loginMethod() async {
    try {
      if (_formKey.currentState?.validate() ?? false) {
        buildShowDialog(context);
        var json = await httpPost(Config.userEmailLogin, {
          "email": textEditingControllerEmail.text,
          "password": textEditingControllerPass.text,
          "phone_country": cuntryCode
        });

        Navigator.of(context, rootNavigator: true).pop();
        LoginModel loginModel = LoginModel.fromJson(json);

        if (loginModel.status == 200) {
          final pref = await SharedPreferences.getInstance();
          await pref.setBool("Remember", true);
          await pref.setBool("Firstuser", true);

          UserData userObj = UserData();
          userObj.saveLoginData("UserData", jsonEncode(json));
          token=loginModel.data!.token!;
          shouldLogout=false;
          controller.updateToken();
          Get.offAll(()=>HomePage(initialIndex: 0,));
        } else {
          showModalBottomSheet(context: context, builder: (context) {return bottomsheet();},
          );
        }
      }
    } catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    controller.askForPermission();


    Future.delayed(Duration(milliseconds: 50),() async {
      generalController.currentIndex.value=0;
      var shared=await SharedPreferences.getInstance();
      var help=shared.getBool('help');
      if(help!=true){
        shared.setBool('help', true);
        // showHelp();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: notifire.getbgcolor,
          elevation: 0,
          centerTitle: false,
          title: InkWell(
            onTap: () {
              Get.to(() => UserSignUpScreen());
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
          // Image.asset('assets/images/BackButton.png'),

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
                  "Welcome to Tukki".tr,
                  style: const TextStyle(
                      fontSize: 25,
                      fontFamily: FontStyles.gilroyBold,
                      color: CustomTheme.loginTopText),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  "Email".tr,
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
                    controller: textEditingControllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: notifire.getwhiteblackcolor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    decoration: InputDecoration(
                      hintText: "Email".tr,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            BorderSide(color: CustomTheme.theamColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              width: 1, color: CustomTheme.theamColor)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: CustomTheme.theamColor),
                      ),
                    ),
                    validator: (value) {
                      if (!GetUtils.isEmail(value!)) {
                        return 'Please enter Valid email'.tr;
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Password".tr,
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
                    controller: textEditingControllerPass,
                    obscureText: showPassword,
                    cursorColor: notifire.getwhiteblackcolor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    onFieldSubmitted: (value){
                      loginMethod();
                    },
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password'.tr;
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password".tr,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(
                            color: CustomTheme.theamColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              width: 1, color: CustomTheme.theamColor)),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: greycolor,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (showPassword) {
                            showPassword = false;
                          } else {
                            showPassword = true;
                          }
                          setState(() {});
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
                ),
                SizedBox(
                  height: 16,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.resetPassword);
                  },
                  child: Text(
                    "Forget Password?".tr,
                    style: const TextStyle(
                        fontFamily: FontStyles.gilroyBold,
                        color: CustomTheme.theamColor,
                        fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  margin: CustomTheme.verticalPagePadding,
                  child: GestButton(
                    buttoncolor: blueColor,
                    buttontext: "Login".tr,
                    style: TextStyle(
                      fontFamily: "Gilroy Bold",
                      color: WhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onclick: () {
                      loginMethod();
                    },
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "-------- or continue with --------".tr,
                    style: const TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 16,
                      color: CustomTheme.theamColor,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: CustomTheme.theamColor,
                        width: 2,
                      )),
                  // width: Get.width,
                  child: InkWell(
                    onTap: () {
                      methodCallGoogleLogin();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/google.png',
                          height: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          'Login with Google',
                          style: TextStyle(
                              fontSize: 15, color: CustomTheme.theamColor),
                        )
                      ],
                    ),
                  ),
                  // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(
                  height: 20,
                ),

                Platform.isAndroid?SizedBox():SignInWithAppleButton(
                onPressed: () async {
                  final credential = await SignInWithApple.getAppleIDCredential(
                    scopes: [
                      AppleIDAuthorizationScopes.email,
                      AppleIDAuthorizationScopes.fullName,
                    ],
                  );

                  print(credential);

                  print("userIdentifier==== ${credential.userIdentifier}");
                  print("identityToken==== ${credential.identityToken}");
                  print("authorizationCode===== ${credential.authorizationCode}");

                  print("-----");
                  var name="";
                  if(credential.givenName!=null){
                    name=credential.givenName!;
                  }
                  var email="";
                  if(credential.email!=null){
                    name=credential.email!;
                  }

                  showLoading();
                  LoginModel socialLoginModel=await controller.socialLogin(name, email, credential.userIdentifier!, "", "apple",credential.identityToken!,credential.authorizationCode);
                  closeLoading();

                  final pref = await SharedPreferences.getInstance();
                  await pref.setBool("Remember", true);
                  await pref.setBool("Firstuser", true);

                  UserData userObj = UserData();
                  userObj.saveLoginData("UserData", jsonEncode(socialLoginModel.toJson()));

                  loginModel=LoginModel.fromJson(socialLoginModel.toJson());
                  token=socialLoginModel.data!.token!;

                  shouldLogout=false;
                  controller.updateToken();

                  if(socialLoginModel.data!.phone==null){
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>PhoneUpdateScreen()));
                    return;
                  }
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomePage(initialIndex: 0)));
                },
              ),
                Container(
                  height: 50
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ".tr,
                      style: TextStyle(
                          fontSize: 15,
                          fontFamily: FontStyles.gilroyMedium,
                          color: CustomTheme.theamColor,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600),
                    ),
                    Container(key: globalKey,padding: EdgeInsets.all(16),

                      child: InkWell(
                        onTap: () {
                          Get.toNamed(Routes.signUpScreen);
                        },
                        child: Text(
                          "Sign Up".tr,
                          style: const TextStyle(
                            color: CustomTheme.theamColor,
                            fontSize: 18,
                            fontFamily: FontStyles.gilroyBold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // showHelp(){
  //   var helpActions = StreamController<HelpAction>();
  //   var currentBox =
  //   globalKey.currentContext!.findRenderObject() as RenderBox;
  //   HelpMe.showHelp(
  //
  //     actions: helpActions.stream,
  //     gradient: LinearGradient(colors: [
  //       Colors.blue.withOpacity(0.2),
  //       Colors.purple.withOpacity(0.2),
  //     ]),
  //     items: [
  //       HelpMeItem(
  //           shape: HelpMeRectShape(width: 1, color: Colors.transparent),
  //           key: globalKey,
  //           guideWidget: itemHelp(
  //             GlobalKey(),
  //             'Documents'.tr,
  //             'Your Title Deed is stored in Documents. Here you can upload more documents like tenancy agreements, bills, and view your beautiful realtime inventory report.'.tr,
  //             1,
  //           ),
  //           arrow: Arrow(color: Colors.amber, width: 2)),
  //     ],
  //     pageContext: context,
  //   );
  // }

  // itemHelp(GlobalKey key, String title, String message, int index) {
  //   return Container(
  //
  //     key: key,
  //     margin: const EdgeInsets.symmetric(horizontal: 27),
  //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
  //     decoration: BoxDecoration(
  //         color: Colors.black,
  //         borderRadius: BorderRadius.all(Radius.circular(10))),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           children: [
  //             Expanded(
  //                 child: Text(
  //                   title,
  //                   style: TextStyle(
  //                     fontSize: 18,
  //                     fontWeight: FontWeight.w700,
  //                     color: Colors.amber,
  //                   ),
  //                 )),
  //             SizedBox(
  //               width: 12,
  //             ),
  //             // SizedBox(
  //             //   width: 25,
  //             //   height: 25,
  //             //   child: CircularProgressIndicator(
  //             //     color: Colors.amber,
  //             //     backgroundColor: Colors.white,
  //             //     value: 0.111 * index,
  //             //   ),
  //             // ),
  //             // SizedBox(
  //             //   width: 6,
  //             // ),
  //             // Text(
  //             //   "$index/9",
  //             //   style:
  //             //   TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
  //             // )
  //           ],
  //         ),
  //         SizedBox(
  //           height: 12,
  //         ),
  //         Text(
  //           message,
  //           style: TextStyle(color: Colors.white),
  //         ),
  //         SizedBox(
  //           height: 12,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             if (index > 1)
  //               TextButton(
  //                   onPressed: () {
  //                     // helpActions.sink.add(HelpAction.BACK);
  //                   },
  //                   child: Text(
  //                     "Back".tr,
  //                     style: TextStyle(
  //                       color: Colors.amber,
  //                     ),
  //                   )),
  //             SizedBox(
  //               width: 8,
  //             ),
  //             TextButton(
  //                 onPressed: () {
  //                   // helpActions.sink.add(HelpAction.NEXT);
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text(
  //                   "Next".tr,
  //                   style: TextStyle(
  //                     color: Colors.amber,
  //                   ),
  //                 )),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

  methodCallGoogleLogin() async {


    print("googleLogin method Called");
    final _googleSignIn = GoogleSignIn();
    await _googleSignIn.signOut();

    var result = await _googleSignIn.signIn();
    print(result);
    if(result!=null){
      showLoading();
      LoginModel socialLoginModel=await controller.socialLogin("${result.displayName}", result.email, result.id, "${result.photoUrl}", "google","","");
      closeLoading();

      final pref = await SharedPreferences.getInstance();
      await pref.setBool("Remember", true);
      await pref.setBool("Firstuser", true);

      UserData userObj = UserData();
      userObj.saveLoginData("UserData", jsonEncode(socialLoginModel.toJson()));

      loginModel=LoginModel.fromJson(socialLoginModel.toJson());
      token=socialLoginModel.data!.token!;
      shouldLogout=false;
      controller.updateToken();
      if(socialLoginModel.data!.phone==null){
        Navigator.push(context, MaterialPageRoute(builder: (context) =>PhoneUpdateScreen()));
        return;
      }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>HomePage(initialIndex: 0)));
      // Navigator.push(context, MaterialPageRoute(builder: (context) => UserGoogleSignUpScreen(name: result.displayName.toString(), email: result.email.toString(), id: result.id.toString(), photoUrl: result.photoUrl.toString())));

    }
  }
  bottomsheet() {
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Text(
            'User not exist'.tr,
            style: TextStyle(
                fontSize: 20,
                color: BlackColor,
                fontFamily: FontStyles.gilroyBold),
          ),
          SizedBox(
            height: 20,
          ),
          Text("Do you want to Sign Up".tr),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding:
                  EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomTheme.theamColor),
                  child: Text("Cancel".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  Get.toNamed(Routes.signUpScreen);
                },
                child: Container(
                  padding:
                  EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomTheme.theamColor),
                  child: Text("Sign up".tr,
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


