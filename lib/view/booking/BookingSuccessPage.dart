import 'dart:async';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class BookingSuccessPage extends StatefulWidget {
  String bookingId;
  BookingSuccessPage({super.key,required this.bookingId});

  @override
  State<BookingSuccessPage> createState() => _BookingSuccessPageState();
}

class _BookingSuccessPageState extends State<BookingSuccessPage> {
  String status="";
  int time=5;

  @override
  void initState() {
    super.initState();
    getData();

  }
  getData() async {
    var response=await httpPost(Config.bookingpaymentsuccess, {"booking_id":'${widget.bookingId}'});
    if(response!=null){
      status=response['data']['bookingpayment'];
      setState(() {
      });
    }

    Timer.periodic(Duration(seconds: 1),(timer) {
      if(timer.tick==5){
        timer.cancel();
        Navigator.pop(context,status);
      }
      time--;
      setState(() {
      });

    },);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: status.isEmpty?Center(child: CircularProgressIndicator(),): Padding(padding: EdgeInsets.all(16),child:
        Column(children: [

          SizedBox(height: 150,),
          Lottie.asset(
            status=="Paid".tr?'assets/lottie/success.json':
            'assets/lottie/failed.json',
            fit: BoxFit.fill,repeat: false
          ),
          SizedBox(height: 50,),
          InkWell(onTap: (){
            Navigator.pop(context,"from Successs".tr);
          },child: Text(status=="Paid".tr?"Payment Successful".tr:"Payment Failed".tr,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)),
          SizedBox(height: 24,),
          Text("You will redirected automatically in $time".tr)
        ],),),
    );
  }
}
