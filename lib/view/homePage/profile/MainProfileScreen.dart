import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/addproperty/MyPropertiesScreen.dart';
import 'package:Tukki/view/auth/loginScreen.dart';
import 'package:Tukki/view/homePage/profile/FinancialReportScreen.dart';
import 'package:Tukki/view/homePage/profile/SettingScreen.dart';
import 'package:Tukki/view/homePage/trips/MyReservationScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainProfileScreen extends StatefulWidget {
  const MainProfileScreen({super.key});

  @override
  State<MainProfileScreen> createState() => _MainProfileScreenState();
}

class _MainProfileScreenState extends State<MainProfileScreen> {
  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return WillPopScope(onWillPop: ()async{
      generalController.tabController.index=0;
      generalController.currentIndex.value=0;
      return false;
    },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.EditProfileScreen);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child:generalController.myImage.value.isEmpty ? const Icon(Icons.account_circle_rounded, size: 50,) :
                            Obx(() => SizedBox(
                                height: 50, width: 50,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: '${generalController.myImage.value}',errorWidget: (context, exception, stackTrace) {
                                    return const Icon(Icons.account_circle_rounded, size: 50,);
                                    },
                                )
                            )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Obx(() => Text(generalController.myName.value, style: CustomTheme.MainProfileScreenHeading,)),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                               Row(
                                children: [
                                  Text(
                                    'View and edit profile'.tr,
                                    style: TextStyle(
                                      fontFamily: FontStyles.gilroyMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 1,
                    color: CustomTheme.theamColor,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  const SizedBox(
                    height: 10,
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
                                'Properties'.tr,
                                style: CustomTheme.MainProfileScreenHeading,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        settingWidget(
                          name: "My Properties".tr,
                          imagePath: "assets/images/Work.svg",
                          onTap: () {
                            Get.to(()=>MyPropertiesScreen());
                          },
                        ),
                        Container(
                          height: 1,
                          color: CustomTheme.theamColor,
                          width: MediaQuery.of(context).size.width * 0.90,
                        ),
                        settingWidget(
                          name: "Booking On My Properties".tr,
                          imagePath: "assets/images/Work.svg",
                          onTap: () {
                            print("hello");
                            Get.to(()=>MyReservationScreen(fromPropBooking: true,));
                          },
                        ),
                        Container(
                          height: 1,
                          color: CustomTheme.theamColor,
                          width: MediaQuery.of(context).size.width * 0.90,
                        ),
                        settingWidget(
                          name: "My Booking".tr,
                          imagePath: "assets/images/Work.svg",
                          onTap: () {
                            generalController.currentIndex.value=2;
                            generalController.tabController.index=2;
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1,
                    color: CustomTheme.theamColor,
                    width: MediaQuery.of(context).size.width * 0.90,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                       Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Account Setting'.tr,
                              style: CustomTheme.MainProfileScreenHeading,
                            ),
                          ],
                        ),
                      ),
                      // settingWidget(
                      //   name: "Review".tr,
                      //   imagePath: "assets/images/Star.png",
                      //   onTap: () {
                      //     // showModalBottomSheet(
                      //     //   context: context,
                      //     //   builder: (context) {
                      //     //     return bottomsheet();
                      //     //   },
                      //     // );
                      //   },
                      // ),
                      // Container(
                      //   height: 1,
                      //   color: CustomTheme.theamColor,
                      //   width: MediaQuery.of(context).size.width * 0.90,
                      // ),
                      settingWidget(
                        name: "Setting".tr,
                        imagePath: "assets/images/Setting.svg",
                        onTap: () {
                          Get.to(()=>SettingScreen());
                        },
                      ),
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                      settingWidget(
                        name: "Wishlist".tr,
                        imagePath: "assets/images/Profile1.svg",
                        onTap: () {
                          generalController.currentIndex.value=1;
                          generalController.tabController.index=1;
                        },
                      ),
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                      settingWidget(
                        name: "About".tr,
                        imagePath: "assets/images/Danger Circle.svg",
                        onTap: () {
                          Get.toNamed(Routes.aboutusscreen);
                        },
                      ),
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(()=>FinancialReportScreen());
                    },
                    child: SizedBox(
                      height: 45,
                      width: Get.size.width,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.analytics_outlined),
                          const SizedBox(
                            width: 15,
                          ),
                          Text(
                            "Financial Report".tr,
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
                  Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Text(
                              'Support',
                              style: CustomTheme.MainProfileScreenHeading,
                            ),
                          ],
                        ),
                      ),
                      settingWidget(
                        name: "Privacy Policy".tr,
                        imagePath: "assets/images/Shield Done.svg",
                        onTap: () {
                          Get.toNamed(Routes.privacypolicyscreen);
                        },
                      ),
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                      settingWidget(
                        name: "Tickets".tr,
                        imagePath: "assets/images/2 User.svg",
                        onTap: () {
                          Get.toNamed(Routes.getHelpScreen);
                        },
                      ),
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),
                      settingWidget(
                        name: "Give us Feedback".tr,
                        imagePath: "assets/images/Send.svg",
                        onTap: () {
                          Get.toNamed(Routes.giveUsFeeback);
                        },
                      ),
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      ),

                      InkWell(
                        onTap: (){

                          dialogDelet(BuildContext context){
                            return showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  // title: Text('Are you sure?'.tr,style: TextStyle(color: CustomTheme.theamColor,fontSize: 16, fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.w700),),
                                  content: SingleChildScrollView(
                                    child: ListBody(
                                      children: <Widget>[
                                        Icon(Icons.error,size: 75,color: Colors.red,),
                                        Text('Do you want to Delete your Account?'.tr,textAlign: TextAlign.center,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),),
                                        // Text('Would you like to approve of this message?'),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    Column(
                                      children: [
                                        Row(children: [
                                          Expanded(child: InkWell(onTap: (){
                                            Navigator.pop(context);
                                          },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Cancel".tr,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),))))),
                                          Expanded(child: InkWell(onTap: () async {
                                            Navigator.pop(context);
                                            var res=await httpPost(Config.deleteAccount, {});
                                            if(res!=null){
                                              if(res['status']==200){

                                                showToastMessage(res['message']);
                                                final prefs = await SharedPreferences.getInstance();
                                                await prefs.remove('Firstuser');
                                                await prefs.remove('Remember');
                                                token="";
                                                generalController.myImage.value="";
                                                generalController.myName.value="";
                                                GetStorage().erase();
                                                Get.offAll(()=>LoginScreen());
                                              }else{
                                                showErrorToastMessage(res['error']);
                                              }
                                            }
                                          },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor),color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Delete".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium,fontWeight: FontWeight.bold),))))),
                                        ],),
                                        SizedBox(height: 8,)
                                      ],
                                    )
                                  ],
                                );
                              },
                            );
                          }
                          dialogDelet(context);
                        },
                        child: SizedBox(
                          height: 45,
                          width: Get.size.width,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              Image.asset("assets/images/Delete.png",
                                height: 20,
                                width: 30,
                                color: notifire.getwhiteblackcolor,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Delete Account".tr,
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
                      Container(
                        height: 1,
                        color: CustomTheme.theamColor,
                        width: MediaQuery.of(context).size.width * 0.90,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            'Log Out'.tr,
                            style: CustomTheme.MainProfileScreenLogout,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                           SvgPicture.asset('assets/images/Logout.svg')
                        ],
                      ),
                    ),
                    onTap: () {
                      logoutSheet(context);
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  logoutSheet(BuildContext context) {
    return Get.bottomSheet(
      Container(
        height: 220,
        width: Get.size.width,
        decoration: BoxDecoration(
          color: notifire.getbgcolor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Logout".tr,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: FontStyles.gilroyBold,
                color: CustomTheme.theamColor,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Divider(
                color: notifire.getgreycolor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Are you sure you want to log out?".tr,
              style: TextStyle(
                fontFamily: FontStyles.gilroyMedium,
                fontSize: 16,
                color: notifire.getwhiteblackcolor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(
                        "Cancle".tr,
                        style: const TextStyle(
                          color: CustomTheme.theamColor,
                          fontFamily: FontStyles.gilroyBold,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFeef4ff),
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final prefs = await SharedPreferences.getInstance();
                      //  save('isLoginBack', true);
                      await prefs.remove('Firstuser');
                      await prefs.remove('Remember');
                      token="";
                      GetStorage().erase();
                      // getData.remove("UserLogin");
                      // getData.remove("countryId");
                      // getData.remove("countryName");
                      // getData.remove("currentIndex");
                      // generalController.tabController.index=0;
                      // generalController.currentIndex.value=0;
                      // setState((){});
                      Get.offAll(()=>LoginScreen());
                    },
                    child: Container(
                      height: 60,
                      margin: const EdgeInsets.all(15),
                      alignment: Alignment.center,
                      child: Text(
                        "Yes".tr,
                        style: TextStyle(
                          color: WhiteColor,
                          fontFamily: FontStyles.gilroyBold,
                          fontSize: 16,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: CustomTheme.theamColor,
                        borderRadius: BorderRadius.circular(45),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
  Widget settingWidget({Function()? onTap, String? name, String? imagePath}) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 45,
        width: Get.size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 20,
            ),
            SvgPicture.asset(
              imagePath ?? "",
              
              color: notifire.getwhiteblackcolor,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              name ?? "",
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
    );
  }

}



