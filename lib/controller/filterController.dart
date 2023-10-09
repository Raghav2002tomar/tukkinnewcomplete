import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterController extends GetxController{
  List selectedAmenitiesList = [].obs;
  List selectedPropertyList = [].obs;
  int selectedBeds=1;
  int selectedBathroom=1;
  bool showMore=true;
  RxDouble startRange=0.0.obs;
  RxDouble endRage=0.0.obs;
}