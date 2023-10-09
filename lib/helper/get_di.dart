import 'package:Tukki/controller/BookrealEstateController.dart';
import 'package:Tukki/controller/Controller.dart';
import 'package:Tukki/controller/LoginController.dart';
import 'package:Tukki/controller/WishListController.dart';
import 'package:Tukki/controller/filterController.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => UserloginController());
  Get.lazyPut(() => BookRealEstateController());
  Get.lazyPut(() => WishListController());
  Get.lazyPut(() => FilterController());
}
