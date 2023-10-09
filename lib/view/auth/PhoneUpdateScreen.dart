import 'package:Tukki/controller/LoginController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/CheckMobileModel.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/UserOtpSignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../helper/FontstyleModel.dart';
import '../../utils/DarkMode.dart';
import '../../workspace.dart';

class PhoneUpdateScreen extends StatefulWidget {
  bool? fromProfile;
  PhoneUpdateScreen({super.key,this.fromProfile});

  @override
  State<PhoneUpdateScreen> createState() => _PhoneUpdateScreenState();
}

class _PhoneUpdateScreenState extends State<PhoneUpdateScreen> {
  String selectedCountry = "+225";
  //  String selectedCountry = "+";
  String selectedCountryIso = "CI";
  TextEditingController textEditingControllerMobile = TextEditingController();
  TextEditingController textEditingControllerFirstName = TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerEmail= TextEditingController();
  GlobalKey<FormState> globalKey=GlobalKey();
  RxBool isValidEmail=false.obs;


  @override
  void initState() {
    super.initState();
    if(loginModel!.data!.firstName!=null){
      textEditingControllerFirstName.text=loginModel!.data!.firstName!;
    }
    if(loginModel!.data!.lastName!=null){
      textEditingControllerLastName.text=loginModel!.data!.lastName!;
    }
    if(loginModel!.data!.email!=null){
      textEditingControllerEmail.text=loginModel!.data!.email!;
    }
    if(loginModel!.data!.phone!=null){
      textEditingControllerMobile.text=loginModel!.data!.phone!;
    }
    if(textEditingControllerEmail.text.contains("tempmail")){
      textEditingControllerEmail.text="";
    }
  }

  @override
  Widget build(BuildContext context) {



    // double hh=MediaQuery.of(context).size.height/4;
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(backgroundColor: Colors.white,appBar: AppBar(elevation: 0,backgroundColor: CustomTheme.theamColor,
      title: Text(widget.fromProfile==null?"Update Profile":"Change Phone Number"),),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(margin: EdgeInsets.only(),
            child: Form(key: globalKey,
              child: Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  widget.fromProfile!=null?SizedBox():

                  Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
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
                                  width: 1, color: Colors.grey)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(color: Colors.grey),
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
                                width: 1, color: Colors.grey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
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
                    SizedBox(
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
                        suffixIcon: Obx(() => isValidEmail.value?Icon(Icons.check_circle_outline_outlined,color: Colors.green,):SizedBox()),
                        hintText: "Email".tr,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide:
                          BorderSide(color: CustomTheme.theamColor, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide(
                                width: 1, color: Colors.grey)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      validator: (value) {
                        print(value);
                        if (!GetUtils.isEmail(value!)) {
                          isValidEmail.value=false;
                          return 'Please enter Valid email'.tr;
                        }else{
                          isValidEmail.value=true;
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
                  ],),

                  widget.fromProfile==null?SizedBox():SizedBox(height: MediaQuery.of(context).size.height/4,),
                  Text(
                    "Phone Number".tr,
                    style: const TextStyle(
                        fontSize: 16,
                        fontFamily: FontStyles.gilroyBold,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  IntlPhoneField(
                    disableLengthCheck: true,
                    showDropdownIcon: true,
                    cursorWidth: 0,
                    // initialValue: selectedCountry,
                     initialCountryCode: "CI",
                    controller: textEditingControllerMobile,
                    keyboardType: TextInputType.number,
                    cursorColor: notifire.getwhiteblackcolor,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    // initialCountryCode: loginModel!.data!.defaultCountry!=null?loginModel!.data!.defaultCountry!:"CI",
                    autovalidateMode: AutovalidateMode.onUserInteraction,


                    // dropdownIcon: Icon(
                    //   Icons.arrow_drop_down,
                    //   color: notifire.getgreycolor,
                    // ),
                    dropdownTextStyle:
                    TextStyle(color: notifire.getgreycolor),
                    style: const TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    onCountryChanged: (value) {
                      print(value.code);
                      print(value.dialCode);
                      selectedCountry = value.dialCode;
                      selectedCountryIso = value.code;
                      // userloginController.number.text = '';
                      // userloginController.password.text = '';
                    },
                    onChanged: (value) {
                      if(textEditingControllerMobile.text.length>12){
                        textEditingControllerMobile.text=textEditingControllerMobile.text.substring(0,12);
                        textEditingControllerMobile.selection = TextSelection.fromPosition(
                          TextPosition(offset: textEditingControllerMobile.text.length),
                        );

                      }
                    },
                    // decoration: const InputDecoration(border: InputBorder.none),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: notifire.getgreycolor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: notifire.getgreycolor,
                        ),
                      ),
                      hintText: "Mobile Number".tr,
                      hintStyle: TextStyle(
                          color: notifire.getgreycolor,
                          fontWeight: FontWeight.w700),
                    ),
                    invalidNumberMessage: "please enter your mobile number".tr,

                    // validator: (value){
                    //   if(!value!.isValidNumber()){
                    //     return "Enter Valid Number".tr;
                    //   }
                    //   if(value.number.isEmpty){
                    //     return "Enter mobile number";
                    //   }
                    //   return null;
                    // },
                  ),

                  SizedBox(height: 50,),
                  InkWell(onTap: () async {
                    if(!globalKey.currentState!.validate()){
                      return;
                    }
                    if(textEditingControllerMobile.text.isEmpty){
                      showErrorToastMessage("Enter mobile number");
                      return;
                    }
                    if(textEditingControllerMobile.text.length<8 || textEditingControllerMobile.text.length>12){
                      showErrorToastMessage("Check mobile number");
                      return;
                    }
                    UserloginController controller=Get.put(UserloginController());
                    Map map={
                      "phone":textEditingControllerMobile.text,
                      "phone_country":selectedCountry,
                      "email":textEditingControllerEmail.text,
                    };

                    CheckMobileModel model=await controller.checkMobileNumber(map);

                    if(model.status==200){
                      Map mapx={
                        "phone":textEditingControllerMobile.text,
                        "phone_country":selectedCountry,
                        "first_name":textEditingControllerFirstName.text,
                        "last_name":textEditingControllerLastName.text,
                        "email":textEditingControllerEmail.text,
                        "default_country":selectedCountryIso,
                      };
                      Get.off(()=>UserOtpSignUpScreen(number: textEditingControllerMobile.text, countryCode: selectedCountry, otpValue: "${model.data!.otp}", email: textEditingControllerEmail.text,changeMobile: mapx,));
                    }else{
                      showToastMessage(model.error);
                    }
                  },child: Container(padding: EdgeInsets.all(16),decoration: BoxDecoration(color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10)),width: MediaQuery.of(context).size.width,child: Center(child: Text("Submit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
