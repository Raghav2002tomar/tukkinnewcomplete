import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/profile/MainProfileScreen.dart';
import 'package:Tukki/view/homePage/trips/CancelledBookingScreen.dart';
import 'package:Tukki/view/homePage/trips/myUpcommingScreen.dart';
import 'package:Tukki/view/homePage/trips/previousBookingScreen.dart';

import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/GeneralController.dart';

class MyReservationScreen extends StatefulWidget {
  bool fromPropBooking;
  MyReservationScreen({super.key, required this.fromPropBooking});
  @override
  State<MyReservationScreen> createState() => MyReservationState();
}

class MyReservationState extends State<MyReservationScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  int index = 0;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(initialIndex: 0, vsync: this, length: 3);
    tabController!.addListener(() {
      index = tabController!.index;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        generalController.tabController.index = 0;
        generalController.currentIndex.value = 0;
        return false;
      },
      child: Scaffold(
          backgroundColor: notifire.getbgcolor,
          appBar: AppBar(
            backgroundColor: notifire.getbgcolor,
            elevation: 0,
            leading: InkWell(
                onTap: () {
                  print("hello");

                  // Navigator.push(MaterialPageRoute(builder:(context)=>MainProfileScreen()));
                  // Navigator.push(context, MaterialPageRoute(builder:(context)=>MainProfileScreen()));
                  // _tabController.animateTo(_tabController.index + 1);
                  //  GeneralController.animateTo(3);
                  if(widget.fromPropBooking==true){
                    Get.back();
                    return;
                  }
                  generalController.currentIndex.value = 4;
                  generalController.tabController.index = 4;
                },
                child: Icon(
                  Icons.arrow_back,
                  color: BlackColor,
                )),
            title: Text(
              widget.fromPropBooking == true
                  ? "Booking On My Properties".tr
                  : "My Booking".tr,
              style: TextStyle(
                fontSize: 19,
                fontFamily: FontStyles.gilroyBold,
                color: CustomTheme.theamColor,
              ),
            ),
          ),
          body: SafeArea(
              child: Column(children: <Widget>[
            TabBar(
              controller: tabController,
              labelColor: CustomTheme.theamColor,
              labelStyle: TextStyle(
                  fontSize: 16,
                  fontFamily: FontStyles.gilroyMedium,
                  fontWeight: FontWeight.w700),
              unselectedLabelColor: Colors.grey,

              tabs:  [
                Tab(
                  text: 'Upcoming'.tr,
                ),
                Tab(
                  text: 'Completed'.tr,
                ),
                Tab(
                  text: 'Cancelled'.tr,
                ),
              ], // list of tabs
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(
                child: [
              MyUpCommingScreen(fromPropBooking: widget.fromPropBooking),
              PreviousookingScreen(fromPropBooking: widget.fromPropBooking),
              CancelledBookingScreen(fromPropBooking: widget.fromPropBooking)
            ][index]),
          ]))),
    );
  }
}
