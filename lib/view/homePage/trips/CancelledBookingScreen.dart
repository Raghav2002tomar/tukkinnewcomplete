import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/BookingModel.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:get/get.dart';

class CancelledBookingScreen extends StatefulWidget {
  bool fromPropBooking;
  CancelledBookingScreen({super.key,required this.fromPropBooking});

  @override
  State<CancelledBookingScreen> createState() => _CancelledBookingScreenState();
}

class _CancelledBookingScreenState extends State<CancelledBookingScreen> {

  RefreshController refreshController=RefreshController();
  BookingModel? bookingModel;
  List<Bookings> list=[];
  num offset=0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Map<String, String> postData = {
      "type": "Cancelled",
      "offset":'$offset'
    };
    var result;
    if(widget.fromPropBooking==true){
      result=await httpPost(Config.vendorbookingRecord, postData);
    }else{
      result=await httpPost(Config.upcommingRecord, postData);
    }
    if (result != null) {
      bookingModel=BookingModel.fromJson(result);
      if(bookingModel!.data!=null){
        list.addAll(bookingModel!.data!.bookings!);
        offset=bookingModel!.data!.offset!;
      }
      setState(() {});
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
  }

  onLoading(){
    getData();
  }
  onRefresh(){
    bookingModel=null;
    list=[];
    setState(() {});
    offset=0;
    getData();
  }

  stateSetter(fn) => setState(() {
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SmartRefresher(controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
          child: bookingModel == null ? Center(child: CircularProgressIndicator()):
      list.isEmpty?Center(child: buildNoDataWidget(context ,"No Cancelled Availabile.".tr),):
      myBookingListWidget(list,"Cancelled".tr,stateSetter,widget.fromPropBooking),)
    );
  }
}
