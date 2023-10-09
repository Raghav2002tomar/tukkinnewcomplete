import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/profile/AddBankAccountScreen.dart';
import 'package:Tukki/view/homePage/profile/FinancialReportScreen.dart';
import 'package:Tukki/view/homePage/profile/LanguageScreen.dart';
import 'package:Tukki/view/homePage/profile/UpdatePasswordScreen.dart';
import 'package:Tukki/view/wallet/AddWalletScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

bool newMesage = true;
bool Otp = true;
bool newReview = true;
bool newsLater = true;
bool darkMode = true;

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: notifire.getwhiteblackcolor,
            )),
        title: Text(
          "Setting".tr,
          style: TextStyle(
              fontSize: 16,
              color: BlackColor,
              fontFamily: FontStyles.gilroyMedium),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // settingWidget(
            //   name: "Setting".tr,
            //   imagePath: "assets/images/Setting.png",
            //   onTap: () {
            //   },
            // ),

            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Notification'.tr,
                          style: CustomTheme.MainProfileScreenHeading,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    width: Get.size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.message),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Email Notification".tr,
                          style: TextStyle(
                            fontFamily: FontStyles.gilroyMedium,
                            fontSize: 16,
                            color: notifire.getwhiteblackcolor,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: newMesage,
                          activeColor: CustomTheme.theamColor,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              newMesage = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: CustomTheme.theamColor,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  SizedBox(
                    height: 45,
                    width: Get.size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.message),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Sms Notification".tr,
                          style: TextStyle(
                            fontFamily: FontStyles.gilroyMedium,
                            fontSize: 16,
                            color: notifire.getwhiteblackcolor,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: newMesage,
                          activeColor: CustomTheme.theamColor,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              newMesage = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),Container(
                    height: 1,
                    color: CustomTheme.theamColor,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  SizedBox(
                    height: 45,
                    width: Get.size.width,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.message),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          "Push Notification".tr,
                          style: TextStyle(
                            fontFamily: FontStyles.gilroyMedium,
                            fontSize: 16,
                            color: notifire.getwhiteblackcolor,
                          ),
                        ),
                        const Spacer(),
                        Switch(
                          // This bool value toggles the switch.
                          value: newMesage,
                          activeColor: CustomTheme.theamColor,
                          onChanged: (bool value) {
                            // This is called when the user toggles the switch.
                            setState(() {
                              newMesage = value;
                            });
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: CustomTheme.theamColor,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),

                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                   Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Account'.tr,
                          style: CustomTheme.MainProfileScreenHeading,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (() {
                      Get.to(()=>AddBankAccountScreen());
                    }),
                    child: SizedBox(
                      height: 45,
                      width: Get.size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.wallet_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Bank Account".tr,
                            style: TextStyle(
                              fontFamily: FontStyles.gilroyMedium,
                              fontSize: 16,
                              color: notifire.getwhiteblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: notifire.getwhiteblackcolor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'User'.tr,
                          style: CustomTheme.MainProfileScreenHeading,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: (() {
                      Get.to(()=>AddWalletScreen());
                    }),
                    child: SizedBox(
                      height: 45,
                      width: Get.size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.wallet_outlined),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "User Wallet".tr,
                            style: TextStyle(
                              fontFamily: FontStyles.gilroyMedium,
                              fontSize: 16,
                              color: notifire.getwhiteblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: notifire.getwhiteblackcolor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),


            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text(
                          'Vendor'.tr,
                          style: CustomTheme.MainProfileScreenHeading,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 45,
                    width: Get.size.width,
                    child: InkWell(onTap: (){
                      Get.to(()=>FinancialReportScreen());
                    },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.wallet),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Vendor Wallet".tr,
                            style: TextStyle(
                              fontFamily: FontStyles.gilroyMedium,
                              fontSize: 16,
                              color: notifire.getwhiteblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: notifire.getwhiteblackcolor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   child: Column(
            //     children: [
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       const Padding(
            //         padding: EdgeInsets.only(left: 20),
            //         child: Row(
            //           children: [
            //             Text(
            //               'Mode',
            //               style: CustomTheme.MainProfileScreenHeading,
            //             ),
            //           ],
            //         ),
            //       ),
            //       const SizedBox(
            //         height: 10,
            //       ),
            //       SizedBox(
            //         height: 45,
            //         width: Get.size.width,
            //         child: Row(
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             const SizedBox(
            //               width: 20,
            //             ),
            //             Icon(Icons.dark_mode_sharp),
            //             SizedBox(
            //               width: 8,
            //             ),
            //             Text(
            //               "Dark Mode",
            //               style: TextStyle(
            //                 fontFamily: FontStyles.gilroyMedium,
            //                 fontSize: 16,
            //                 color: notifire.getwhiteblackcolor,
            //               ),
            //             ),
            //             const Spacer(),
            //             Switch(
            //               // This bool value toggles the switch.
            //               value: darkMode,
            //               activeColor: CustomTheme.theamColor,
            //               onChanged: (bool value) {
            //                 // This is called when the user toggles the switch.
            //                 setState(() {
            //                   darkMode = value;
            //                 });
            //               },
            //             ),
            //             const SizedBox(
            //               width: 20,
            //             ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                 Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        // SizedBox(
                        //   width: 20,
                        // ),
                        // Icon(Icons.security),
                        //  SizedBox(
                        //   width: 8,
                        // ),
                        Text(
                          'Security'.tr,
                          style: CustomTheme.MainProfileScreenHeading,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(()=>UpdatePassword());
                    },
                    child: SizedBox(
                      height: 45,
                      width: Get.size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.password_sharp),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Change Password".tr,
                            style: TextStyle(
                              fontFamily: FontStyles.gilroyMedium,
                              fontSize: 16,
                              color: notifire.getwhiteblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: notifire.getwhiteblackcolor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                   InkWell(
                    onTap: () {
                      Get.to(()=>ChangeLanguage());
                    },
                    child: SizedBox(
                      height: 45,
                      width: Get.size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.password_sharp),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "Change Language".tr,
                            style: TextStyle(
                              fontFamily: FontStyles.gilroyMedium,
                              fontSize: 16,
                              color: notifire.getwhiteblackcolor,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                            color: notifire.getwhiteblackcolor,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
