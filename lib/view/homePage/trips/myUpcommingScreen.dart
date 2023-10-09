import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/model/BookingModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/Text.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyUpCommingScreen extends StatefulWidget {
  bool fromPropBooking;
  MyUpCommingScreen({super.key, required this.fromPropBooking});

  @override
  State<MyUpCommingScreen> createState() => _MyUpCommingScreenStateState();
}

class _MyUpCommingScreenStateState extends State<MyUpCommingScreen> {
  RefreshController refreshController = RefreshController();
  BookingModel? bookingModel;
  List<Bookings> list = [];
  num offset = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    Map<String, String> postData = {"type": "upcoming", "offset": '$offset'};
    var result;
    if (widget.fromPropBooking == true) {
      result = await httpPost(Config.vendorbookingRecord, postData);
    } else {
      result = await httpPost(Config.upcommingRecord, postData);
    }
    if (result != null) {
      bookingModel = BookingModel.fromJson(result);
      if (bookingModel!.data != null) {
        list.addAll(bookingModel!.data!.bookings!);
        offset = bookingModel!.data!.offset!;
      }
      setState(() {});
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }
  }

  onLoading() {
    getData();
  }

  onRefresh() {
    bookingModel = null;
    list = [];
    setState(() {});
    offset = 0;
    getData();
  }

  stateSetter(fn) => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SmartRefresher(
      controller: refreshController,
      onRefresh: onRefresh,
      onLoading: onLoading,
      enablePullUp: offset == -1 ? false : true,
      child: bookingModel == null
          ? Center(child: CircularProgressIndicator())
          : list.isEmpty
              ? Center(
                  child: buildNoDataWidget(context, "No upcoming Booking Availability.".tr(),
                     ),
                )
              : myBookingListWidget(
                  list, "Cancel", stateSetter, widget.fromPropBooking),
    ));
  }
}
