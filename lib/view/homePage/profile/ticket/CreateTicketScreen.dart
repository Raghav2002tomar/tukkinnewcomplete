import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateTicket extends StatefulWidget {
  CreateTicket({super.key});

  @override
  State<CreateTicket> createState() => _CreateTicketState();
}

class _CreateTicketState extends State<CreateTicket> {
  TextEditingController textEditingControllertitle = TextEditingController();
  TextEditingController textEditingControllerdescription =
  TextEditingController();

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
          "Create Ticket".tr,
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
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Create Ticket".tr,
                        style: TextStyle(
                            fontSize: 22,
                            fontFamily: FontStyles.gilroyMedium,
                            fontWeight: FontWeight.w700,
                            color: CustomTheme.theamColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
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
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getblackwhitecolor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromARGB(255, 125, 123, 123)),
                    ),
                    child: TextFormField(
                      controller: textEditingControllertitle,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: notifire.getwhiteblackcolor,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Title".tr,
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
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: notifire.getblackwhitecolor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromARGB(255, 125, 123, 123)),
                    ),
                    child: TextFormField(
                      controller: textEditingControllerdescription,
                      minLines: 10,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: notifire.getwhiteblackcolor,
                      decoration:  InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
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
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestButton(
                    Width: Get.size.width,
                    height: 50,
                    buttoncolor: blueColor,
                    margin: const EdgeInsets.only(top: 15, left: 30, right: 30),
                    buttontext: "Send Ticket".tr,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyBold,
                      color: WhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onclick: () async {
                      if (textEditingControllertitle.text.isEmpty &&
                          textEditingControllerdescription.text.isEmpty) {
                        showToastMessage('please fill all the field'.tr);
                        return;
                      }
                      showLoading();
                      await controller.createSupportTicket(
                          textEditingControllertitle.text,
                          textEditingControllerdescription.text);
                      closeLoading();
                      showToastMessage("ticket thread created successfully".tr);
                      Navigator.pop(context, "pop");
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
