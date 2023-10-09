import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/ResetPassModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/common_widgets.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/loginScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';


class ChangePasswordScreen extends StatefulWidget {
  String email;
  String resetToken;
  ChangePasswordScreen({super.key,required this.email,required this.resetToken});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // UserOtpController userotpController = Get.find();

  String newPassword = "";
  TextEditingController textEditingControllerPass=TextEditingController();
  TextEditingController textEditingControllerConfirmPass=TextEditingController();
  bool obscurePass=true;
  bool obscureConfirmPass=true;

  @override
  Widget build(BuildContext context) {
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
        child: SingleChildScrollView(
          padding: CustomTheme.pagePadding,
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: _formKey,
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
                    controller: textEditingControllerPass,
                    keyboardType: TextInputType.visiblePassword,
                    cursorColor: notifire.getwhiteblackcolor,
                    obscureText: obscurePass,
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
                      if (value == null || value.isEmpty) {
                        return 'Please enter your New Password'.tr;
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
                          obscurePass=!obscurePass;
                          setState(() {
                          });
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
                  obscureText: obscureConfirmPass,
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Confirm password'.tr;
                    } else if (newPassword != value) {
                      return 'New Password did not match with Confirm Password'.tr
                          .tr;
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
                        obscureConfirmPass=!obscureConfirmPass;
                        setState(() {
                          
                        });
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
                SizedBox(height: 48,),
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
                    try {
                      if (_formKey.currentState?.validate() ?? false) {
                        buildShowDialog(context);
                        var result= await callChangePasswordApi(widget.email,widget.resetToken,textEditingControllerPass.text, textEditingControllerConfirmPass.text);
                        Navigator.of(context, rootNavigator: true).pop();

                        if(result!=null){
                          ResetPassModel resetPassModel=ResetPassModel.fromJson(result);
                          if(resetPassModel.status==200){
                            showToastMessage(resetPassModel.message);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>LoginScreen()));
                          }else{
                            showToastMessage(resetPassModel.error);
                          }
                        }else{
                          showToastMessage("Something went wrong".tr);
                        }


                      }
                    } finally {
                      // Navigator.of(context, rootNavigator: true).pop();
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

  callChangePasswordApi(email,resetToken,String newPassword, String confirmPassword) async {
    Map map = {
      "email": email,
      "reset_token": resetToken,
      "password": newPassword,
      "confirm_password": confirmPassword
    };
    return await httpPost(Config.resetPassword, map);
  }
}