import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/controller/WishListController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/model/PropertyModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/Text.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

WishListController wishListController = Get.find();

class _WishListScreenState extends State<WishListScreen> {
  PropertyModel? propertyModel;
  bool noData = false;
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response = await httpPost(Config.getWishlist, {});
    if (response != null) {
      propertyModel = PropertyModel.fromJson(response);
    } else {
      noData = true;
    }
    setState(() {});
  }

  stateSetter(fn) => setState(() {});

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return WillPopScope(
      onWillPop: () async {
        generalController.tabController.index = 0;
        generalController.currentIndex.value = 0;
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: notifire.getbgcolor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              generalController.tabController.index = 4;
              generalController.currentIndex.value = 4;
            },
            icon: Icon(
              Icons.arrow_back,
              color: notifire.getwhiteblackcolor,
            ),
          ),
          title: Text(
            "Wishlist".tr,
            style: TextStyle(
                fontSize: 17,
                fontFamily: FontStyles.gilroyBold,
                color: CustomTheme.theamColor),
          ),
        ),
        body: propertyModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : noData == true
                ? Center(
                    child: Text("No Data Found".tr),
                  )
                : propertyModel!.data!.properties!.isEmpty
                    ? Center(
                        child: buildNoDataWidget(context, "Please add".tr),
                      )
                    : myList(propertyModel!.data!.properties, false, true,
                        stateSetter),
      ),
    );
  }

  Widget univerLoader() {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
