import 'dart:convert';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/controller/LoginController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/LoginModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/PhoneUpdateScreen.dart';
import 'package:Tukki/view/auth/loginScreen.dart';
import 'package:Tukki/view/homePage/explore/ExplorePage.dart';
import 'package:Tukki/view/homePage/inbox/InboxScreen.dart';
import 'package:Tukki/view/homePage/profile/MainProfileScreen.dart';
import 'package:Tukki/view/homePage/trips/MyReservationScreen.dart';
import 'package:Tukki/view/homePage/wishlist/WishListScreen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import '../../workspace.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  int initialIndex;
  HomePage({Key? key,required this.initialIndex}) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  late ColorNotifire notifire;

  List<Widget> myChildren = [
    ExploreScreen(),
    WishListScreen(),
    MyReservationScreen(fromPropBooking: false),
    InboxScreen(),
    MainProfileScreen()
  ];

  @override
  void initState() {
    super.initState();
    generalController.tabController = TabController(length: 5, vsync: this,initialIndex: widget.initialIndex);
    if(generalDataModel==null){
      generalController.fetchGeneralSettings();
    }
    generalController.tabController.addListener(() {
      generalController.currentIndex.value=generalController.tabController.index;
    });

    getUserData();
  }
  getUserData() async {

    //
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.remove('Firstuser');
    // await prefs.remove('Remember');
    // token="";
    // GetStorage().erase();

    UserloginController userLoginController = Get.put(UserloginController());
    userLoginController.getUserLocation();

    String data= await GetStorage().read("UserData");
    print("----------");
    print(data);
    print("---------");
    if(data.isNotEmpty){
      try{
        var json=jsonDecode(data);
        loginModel=LoginModel.fromJson(json);

        if(loginModel!.data!=null){
          if(loginModel!.data!.token!=null){
            token=loginModel!.data!.token!;
          }
          if(loginModel!.data!.firstName!=null){
            generalController.myName.value=loginModel!.data!.firstName!;
          }
          if(loginModel!.data!.profileImage!=null && loginModel!.data!.profileImage!['url']!=null){
            generalController.myImage.value=loginModel!.data!.profileImage!['url'];
          }
          if(loginModel!.data!.token==null){
            showToastMessage("Token now found! login again".tr);
            print("LOGOUTReason 1");
            Get.offAll(()=>LoginScreen());
          }else
          if(loginModel!.data!.phone==null){
            showToastMessage("Complete Your Profile".tr);
            print("LOGOUTReason 2");
            Get.offAll(()=>PhoneUpdateScreen());
          }
        }else{
          showToastMessage("Token now found! login again".tr);
          print("LOGOUTReason 3");
          Get.offAll(()=>LoginScreen());
        }
      }catch(e){

        showToastMessage("Token now found! login again".tr);
        print("LOGOUTReason 4");
        Get.offAll(()=>LoginScreen());
      }
    }else{
      showToastMessage("Token now found! login again".tr);
      print("LOGOUTReason 5");
      Get.offAll(()=>LoginScreen());
    }

    controller.updateToken();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    // return Scaffold(backgroundColor: Colors.white,body: Column(children: [
    //   Expanded(child: ClipRRect(borderRadius: BorderRadius.only(topRight: Radius.circular(15)),child: Container(decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.only(topRight: Radius.circular(20))),)) ),
    //   Expanded(child: Container(color: Colors.green,)),
    // ],),);
    return Obx(() =>
    generalController.failed.value==true?Scaffold(body: Center(child: Column(mainAxisSize: MainAxisSize.min,
    children: [
      Text("Something went wrong".tr),
      SizedBox(height: 16,),
      InkWell(onTap: (){
        generalController.fetchGeneralSettings();
      },child: Container(padding: EdgeInsets.only(top: 16,bottom: 16,left: 32,right: 32),decoration: BoxDecoration(color: Colors.orange,borderRadius: BorderRadius.circular(20)),child: Text("Reload",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
    ],
    ),),):
    generalController.hasGeneralData.value==false?
    Scaffold(body: Center(child: CircularProgressIndicator(),),):

    Scaffold(
    resizeToAvoidBottomInset: false,
    body: TabBarView(
      physics: NeverScrollableScrollPhysics(),
      controller: generalController.tabController,
      children: myChildren,
    ),
    floatingActionButton: InkWell(onTap: (){
      generalController.currentIndex.value=2;
      generalController.tabController.index=2;
    },
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          border: Border.all(
              width: 5.0, color: Colors.white, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(50),
          color: WhiteColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            ('assets/images/Frame 5.svg'),
            height: 50,
          ),
        ),
      ),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      color: Color.fromARGB(255, 248, 236, 217),
      child: TabBar(
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: notifire.getbgcolor, width: 2),
          insets: EdgeInsets.only(bottom: 52),
        ),
        controller: generalController.tabController,
        padding: const EdgeInsets.symmetric(vertical: 6),
        tabs: [
          Tab(
            child: Column(
              children: [
                generalController.currentIndex.value == 0
                    ? SvgPicture.asset(
                  "assets/images/Searchthemecolor.svg",
                  // scale: 1,
                  // color: CustomTheme.theamColor,
                )
                    : SvgPicture.asset(
                  "assets/images/Search.svg",
                  // scale: 1,
                  // color: Colors.black,
                ),
                Text(
                  "Explore".tr,
                  style: TextStyle(fontSize: 12,
                    color:generalController.currentIndex.value == 0 ? CustomTheme.theamColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Tab(
            child: Column(
              children: [
                generalController.currentIndex.value == 1
                    ? SvgPicture.asset(
                  "assets/images/Heartthemecolor.svg",
                  // scale: 1,
                  // color: CustomTheme.theamColor,
                )
                    : SvgPicture.asset(
                  "assets/images/Heart.svg",
                  // scale: 1,
                  // color: Colors.black,
                ),
                // SizedBox(height: 3),
                Text(
                  "Wishlist".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: FontStyles.gilroyMedium,
                    color:
                    generalController.currentIndex.value == 1 ? CustomTheme.theamColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Tab(
            child: Column(
              children: [
                generalController.currentIndex.value == 2 ? Text('df') : Text(''),
                SizedBox(height: 15),
                Text(
                  "Trips".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: FontStyles.gilroyMedium,
                    color:
                    generalController.currentIndex.value == 2 ? CustomTheme.theamColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),

          Tab(
            child: Stack(
              children: [
                Column(
                  children: [
                    generalController.currentIndex.value == 3
                        ? SvgPicture.asset(
                      "assets/images/Chatthemecolor.svg",
                      // scale: 1,
                      // color: CustomTheme.theamColor,
                    )
                        :SvgPicture.asset(
                      "assets/images/Chat.svg",
                      // scale: 1,
                      // color: Colors.black,
                    ),
                    // SizedBox(height: 3),
                    Text(
                      "Inbox".tr,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: FontStyles.gilroyMedium,
                        color:
                        generalController.currentIndex.value == 3 ? CustomTheme.theamColor : Colors.black,
                      ),
                    ),
                  ],
                ),

                Obx(() => generalController.msgUpdater.value==true?Container(height: 10,width: 10,decoration: BoxDecoration(color: RedColor,borderRadius: BorderRadius.circular(20)),):SizedBox())
              ],
            ),
          ),

          Tab(
            child: Column(
              children: [
                generalController.currentIndex.value == 4
                    ? SvgPicture.asset(
                  "assets/images/Profilethemecolor.svg",
                   semanticsLabel: 'My SVG Image'
                  // scale: 1,
                  // color: CustomTheme.theamColor,
                )
                    : SvgPicture.asset(
                  "assets/images/Profile.svg",
                   semanticsLabel: 'My SVG Image'
                  // scale: 1,
                  // color: CustomTheme.theamColor,
                ),
                // SizedBox(height: 3),
                Text(
                  "Profile".tr,
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: FontStyles.gilroyMedium,
                    color:
                    generalController.currentIndex.value == 4 ? CustomTheme.theamColor : Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    ));
  }
}