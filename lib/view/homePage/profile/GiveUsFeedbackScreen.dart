import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/view/addproperty/ThankYouScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GiveUsFeedback extends StatefulWidget {
  const GiveUsFeedback({super.key});

  @override
  State<GiveUsFeedback> createState() => _GiveUsFeedbackState();
}

class _GiveUsFeedbackState extends State<GiveUsFeedback> {
  TextEditingController textEditingControllertitle = TextEditingController();
  TextEditingController textEditingControllerdescription = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  submitMethod() async {
    if(formKey.currentState!.validate()){
      if (textEditingControllerdescription.text.isNotEmpty && textEditingControllertitle.text.isNotEmpty) {
        Map<String, String> postData = {
          "tittle": textEditingControllertitle.text,
          "description": textEditingControllerdescription.text
        };
        showLoading();
        var response = await httpPost(Config.contactUs, postData);
        closeLoading();
        if(response!=null){
          if(response['status']==200){
            showToastMessage(response['message']);
            textEditingControllertitle.clear();
            textEditingControllerdescription.clear();
            Navigator.push(context, MaterialPageRoute(builder: (context) => const ThankYouScreen(fText: "For given Us feedback "))).then((value) {
              if (value != null) {
                Get.back();
              }
            });
          }else{
            showToastMessage(response['error']);
          }
        }
      } else {
        showToastMessage('Please fill all the field'.tr);
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: notifire.getwhiteblackcolor,
          ),
        ),
        title: Text(
          "Give us Feedback".tr,
          style: TextStyle(
            fontSize: 17,
            fontFamily: FontStyles.gilroyBold,
            color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                 Text(
                  'We’ll start with some questions and get you to the right place.'.tr,
                  style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'let’s get you some help. We’re going to ask you somequestions and then connect you with a member ofour support team.'.tr,
                  style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Can you describe your issue in a few sentences? This will help our team understand what’s going on.'.tr,
                  style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: textEditingControllertitle,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration:  InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Title".tr,
                    hintStyle: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                    ),
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return "fill all the field".tr;
                    }
                    return null;
                  },
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 16,
                    color: notifire.getwhiteblackcolor,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: textEditingControllerdescription,
                  minLines: 10,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: notifire.getwhiteblackcolor,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                    hintText: "Description".tr,
                    hintStyle: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 16,
                    color: notifire.getwhiteblackcolor,
                  ),
                    validator: (value){
                      if(value!.isEmpty){
                        return "fill all the field".tr;
                      }
                      return null;
                    }
                ),
                const SizedBox(
                  height: 30,
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
                  onclick: () {
                    submitMethod();
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
               Text(
                  'Or Direct Message to us'.tr,
                  style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                        onTap: () {
                          print(generalDataModel!
                              .data!.metaData!.socialmediaTwitter!);
                          // Expanded( )
                        },
                        child: Image.asset("assets/images/Whatsapp.png")),
                    Image.asset("assets/images/facebook.png"),
                    Image.asset("assets/images/skype.png"),
                    Image.asset("assets/images/twitter .png"),
                    Image.asset("assets/images/email.png"),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
