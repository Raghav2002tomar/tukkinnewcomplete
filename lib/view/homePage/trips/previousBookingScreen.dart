import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/model/BookingModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../NoDataFoundScreen.dart';

class PreviousookingScreen extends StatefulWidget {
  bool fromPropBooking;
  PreviousookingScreen({super.key,required this.fromPropBooking});

  @override
  State<PreviousookingScreen> createState() => _PreviousookingScreenStateState();
}

class _PreviousookingScreenStateState extends State<PreviousookingScreen> {

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
      "type": "previous",
      "offset":'$offset'
    };
    var result;
    if(widget.fromPropBooking==true){
      result=await httpPost(Config.vendorbookingRecord, postData);
    }else{
      result=await httpPost(Config.upcommingRecord, postData);
    }
    if (result != null) {
      print(result);
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
      resizeToAvoidBottomInset: true,
      body: SmartRefresher(controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
      child: bookingModel == null ? const Center(child: CircularProgressIndicator()):

  list.isEmpty?Center(child: buildNoDataWidget(context ,"No Cancelled Availabile."),):
      myBookingListWidget(list,"Add Review",stateSetter,widget.fromPropBooking),)
    );
  }
}
