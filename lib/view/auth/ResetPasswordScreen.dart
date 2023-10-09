import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/ForgotPassModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';

import 'package:Tukki/utils/common_widgets.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/UserOtpSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // UserOtpController userotpController = Get.find();
  late ColorNotifire notifire;
  TextEditingController textEditingControllerEmail=TextEditingController();


  @override
  Widget build(BuildContext context) {
    // userloginController.clearFields();
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
    
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,centerTitle: false,
          title: InkWell(onTap: (){
            Navigator.pop(context);
          },
            child: Container(padding: const EdgeInsets.only(left: 16,right: 16,top: 2,bottom: 2),decoration:  BoxDecoration(borderRadius: BorderRadius.circular(8),border: Border.all(color: CustomTheme.theamColor)),child: const Row(mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios,color: CustomTheme.theamColor,),
                Text("Back",style: TextStyle(color: CustomTheme.theamColor,fontSize: 14,fontWeight: FontWeight.bold),),
              ],
            ),),
          ),actions: [
        Image.asset(
          'assets/images/logo.png',
          height: 50,
        ),
        SizedBox(width: 16,)
      ]),
      body: SafeArea(
        child: SizedBox(height: Get.height,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: Image.asset(
                  "assets/images/Logobackground.png",
                  alignment: Alignment.bottomRight,
                ),
              ),
              SingleChildScrollView(
                padding: CustomTheme.pagePadding,
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reset Password'.tr,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: FontStyles.gilroyMedium,
                            color: CustomTheme.theamColor),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Enter the email address associated with your assount, and well email you a link to reset your password.".tr
                            .tr,
                        style: TextStyle(
                            fontSize: 16,
                            letterSpacing: 1,
                            color: CustomTheme.theamColor,
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 48,
                      ),
                      TextFormField(
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
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                color: CustomTheme.theamColor, width: 2),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                            BorderSide(color: CustomTheme.theamColor),
                          ),
                          labelText: "Email".tr,
                          labelStyle: TextStyle(
                              color: notifire.getgreycolor,
                              fontWeight: FontWeight.w700),
                        ),
                        validator: (value) {
                          print(value);
                          if(!GetUtils.isEmail(value!)){
                            return 'Please enter Valid email'.tr;
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      GestButton(

                        buttoncolor: blueColor,

                        buttontext: "Reset".tr,
                        style: TextStyle(
                          fontFamily: FontStyles.gilroyBold,
                          color: WhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        onclick: () async {
                          // UserResetPassEntity
                          try {
                            if (_formKey.currentState?.validate() ?? false) {
                              buildShowDialog(context);
                              // var result = await userotpController.callResetApi(userotpController.email.text);
                              Map postData = {"email": textEditingControllerEmail.text};
                              var result =await httpPost(Config.forgotPassword, postData);

                              Navigator.of(context, rootNavigator: true).pop();
                              ForgotPassModel forgotPassModel=ForgotPassModel.fromJson(result);
                              if(forgotPassModel.status==200){
                                showToastMessage(forgotPassModel.message);

                                Navigator.push(context, MaterialPageRoute(builder: (builder)=>UserOtpSignUpScreen(otpValue: forgotPassModel.data!.resetToken!,countryCode: "", number: '',email: textEditingControllerEmail.text,)));
                              }else{
                                showToastMessage(forgotPassModel.error);
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
            ],
          ),
        ),
      ),
    );
  }

  methodCallGoogleLogin() async {
    // print("googleLogin method Called");
    // final _googleSignIn = GoogleSignIn();
    // var result = await _googleSignIn.signIn();
    // // var googleKey = await result!.authentication;
    // //buildShowDialog(context);

    // if (result!.email.isNotEmpty) {
    //   Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //           builder: (context) => UserGoogleSignUpScreen(
    //               name: result.displayName.toString(),
    //               email: result.email.toString(),
    //               id: result.id.toString(),
    //               photoUrl: result.photoUrl.toString())));
    //   // Get.toNamed(Routes.googleSignUpScreen(name:result.displayName,email:result.email,photoUrl:result.photoUrl));
    // }
    // Navigator.of(context, rootNavigator: true).pop();
  }
}