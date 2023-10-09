import 'dart:convert';
import 'dart:io';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/CustomBottomSheet.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/BookingModel.dart';
import 'package:Tukki/model/CancellationReasonModel.dart';
import 'package:Tukki/model/PropertyDetailsModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_pdf/export_delegate.dart';
import 'package:flutter_to_pdf/export_frame.dart';
import 'package:flutter_to_pdf/flutter_to_pdf.dart';
import 'package:provider/provider.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../../../helper/FontstyleModel.dart';
import '../../../utils/DarkMode.dart';
import '../../../utils/custom_theme.dart';
import '../../../workspace.dart';
import 'package:path_provider/path_provider.dart';


class EReceiptScreen extends StatefulWidget {
  Bookings bookings;
  bool fromPropBooking;
  EReceiptScreen({required this.bookings,required this.fromPropBooking});
  @override
  State<EReceiptScreen> createState() => _EReceiptScreenState();
}


class _EReceiptScreenState extends State<EReceiptScreen> {

  final ExportDelegate exportDelegate = ExportDelegate();
  PropertyDetails? propertyDetails;
  bool exp=false;

  saveFile(document, String name) async {
    Directory? dir;
    if(Platform.isAndroid){
      dir = await getDownloadsDirectory();
    }else{
      dir = await getApplicationCacheDirectory();
    }
    // Directory? dir = await getDownloadsDirectory();
    print(dir);
    final File file = File('${dir!.path}/$name.pdf');
    await file.writeAsBytes(await document.save());
    debugPrint('Saved exported PDF at: ${file.path}');
    return file.path;
  }

  @override
  void initState() {
    super.initState();
    print(widget.bookings.itemData);
    print("xxxxxxx ");
    if(widget.bookings.itemData!=null){
      print("did condition run");
      propertyDetails=PropertyDetails.fromJson(jsonDecode(widget.bookings.itemData.toString().replaceAll("[", "").replaceAll("]", "")));
      setState(() {});
    }

  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: notifire.getbgcolor,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: notifire.getwhiteblackcolor,
            ),
          ),
          title: Text(
            "E-Receipt".tr,
            style: TextStyle(
              fontSize: 17,
              color: notifire.getwhiteblackcolor,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                screenShotWidget(),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(onTap: () async {

                      final ExportOptions overrideOptions = ExportOptions(
                        textFieldOptions: TextFieldOptions.uniform(
                          interactive: false,
                        ),
                        checkboxOptions: CheckboxOptions.uniform(
                          interactive: false,
                        ),
                      );
                      final pdf = await exportDelegate.exportToPdfDocument('1', overrideOptions: overrideOptions);
                      var path=await saveFile(pdf, 'booking-${DateTime.now()}');
                      print(pdf);
                      if(path!=null){
                        showToastMessage("Exported to Pdf".tr);
                        final result = await Share.shareXFiles([XFile(path)], text: 'Share');

                        if (result.status == ShareResultStatus.success) {
                          print('Thank you for sharing the picture!');
                        }
                      }else{
                        showErrorToastMessage("Can not export to Pdf".tr);
                      }

                    },
                      child: Container(padding: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all()),
                        child: Row(mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.picture_as_pdf,color: Colors.red),
                            SizedBox(width: 8,),
                            Text("Export to PDF".tr,style: TextStyle(),),
                          ],
                        ),
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 48,),

              ],
            ),
          ),
        ),
      bottomNavigationBar:widget.fromPropBooking==false?SizedBox(): widget.bookings.status!="Pending"?SizedBox(): ColoredBox(color: Colors.grey.shade200,
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 16,),
            Row(children: [
              SizedBox(width: 16,),
              Expanded(flex: 1,child: InkWell(onTap: () async {
                showLoading();
                var response=await httpPost(Config.getCancelReasons, {"userType":"host"});
                closeLoading();
                if(response!=null){
                  CancellationReasonModel model=CancellationReasonModel.fromJson(response);
                  await showModalBottomSheet(showDragHandle: true,enableDrag: true,context: context, builder: (context) {return CustomBottomSheet(model: model);},).then((value) async {
                    if(value!=null){
                      showLoading();
                      var resp=await httpPost(Config.cancelBookingByHost, {"booking_id":"${widget.bookings.id}","cancellation_reasion":"$value"});
                      closeLoading();
                      if(resp['status']==200){
                        showToastMessage(resp['message']);
                        Navigator.pop(context,"Cancelled");
                      }else{
                        showToastMessage(resp['error']);
                      }
                    }
                  });
                }
              },child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: Colors.black),borderRadius: BorderRadius.circular(10)),child: Center(child: Text("Cancel",style: TextStyle( fontSize: 16, color: Colors.black,)))))),
              SizedBox(width: 16,),
              Expanded(flex: 2,child: InkWell(onTap: () async {
                showLoading();
                var resp=await httpPost(Config.confirmBookingByHost, {"booking_id":"${widget.bookings.id}"});
                closeLoading();
                if(resp['status']==200){
                  showToastMessage(resp['message']);
                  Navigator.pop(context,"Confirmed");
                  // setState((){});
                }else{
                  showToastMessage(resp['error']);
                }
              },child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(color: CustomTheme.theamColor,border: Border.all(color: CustomTheme.theamColor),borderRadius: BorderRadius.circular(10)),child: Center(child: Text("Confirm",style: TextStyle( fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold,)))))),
              SizedBox(width: 16,),
            ],),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }

  Widget EReceiptwidget({String? name, String? value}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(name ?? "", style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
          Text(value ?? "", style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
        ],
      ),
    );
  }

  screenShotWidget(){
    return ExportFrame(
      frameId: '1',
      exportDelegate: exportDelegate,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
       ClipRRect(borderRadius: BorderRadius.circular(10),
          child: SizedBox(
              height: 200,
              child: Row(
                children: [
                  Expanded(child: myNetworkImage(widget.bookings.propImg??'https://icon-library.com/images/no-picture-available-icon/no-picture-available-icon-1.jpg'),),
                ],
              )
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text("${widget.bookings.propTitle}",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,),),

        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text("${widget.bookings.currencyCode} ${widget.bookings.perNight}"),
                Text(' /night'.tr,style: TextStyle(),),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Icon(Icons.star, color: CustomTheme.theamColor,),
                Text("${widget.bookings.rating}", )
              ],
            )
          ],
        ),

        SizedBox(
          height: 4,
        ),
        propertyDetails==null?SizedBox():Text(
          "${propertyDetails!.propertyType}/ ${propertyDetails!.beds} Beds".tr,
        ),

        EReceiptwidget(name: "Booking date".tr, value: "${widget.bookings.createdAt!.split(" ")[0]}"),
        EReceiptwidget(name: "Check in".tr, value: "${widget.bookings.checkOut}"),
        EReceiptwidget(name: "Check out".tr, value: "${widget.bookings.checkOut}"),
        EReceiptwidget(name: "Number of Guest".tr, value: "${widget.bookings.totalGuest}"),
        widget.bookings.hostName==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Host Name".tr.tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.hostName}",style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),
        widget.bookings.hostNumber==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Host Number".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.hostNumber}",style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),
        widget.bookings.hostEmail==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Host Email".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.hostEmail}",style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),

        widget.bookings.userName==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("User Name".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.userName}",style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),
        widget.bookings.userNumber==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("User Number".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.userNumber}",style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),
        widget.bookings.userEmail==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("User Email".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.userEmail}",style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),

        SizedBox(height: 16,),
        EReceiptwidget(name: "Amount(${widget.bookings.totalNight} days)".tr, value: "${widget.bookings.currencyCode} ${double.parse("${double.parse(widget.bookings.perNight!)*double.parse(widget.bookings.totalNight!)}").toStringAsFixed(2)}"),
        EReceiptwidget(name: "Tax".tr, value: "${widget.bookings.currencyCode} ${widget.bookings.ivaTax}"),
        EReceiptwidget(name: "Service Charge".tr, value: "${widget.bookings.currencyCode} ${widget.bookings.serviceCharge}"),
        EReceiptwidget(name: "Security Money".tr, value: "${widget.bookings.currencyCode} ${widget.bookings.securityMoney}"),
        widget.bookings.cancelledCharge==null?SizedBox():widget.bookings.cancelledCharge=="0.00"?SizedBox():EReceiptwidget(name: "Cancelled Charge".tr, value: "${widget.bookings.currencyCode} ${widget.bookings.cancelledCharge}"),
        EReceiptwidget(name: "Total".tr, value: "${widget.bookings.currencyCode} ${widget.bookings.total}"),
        SizedBox(height: 16,),
        widget.bookings.transaction==null?SizedBox():EReceiptwidget(name: "Transaction Id".tr, value: "${widget.bookings.transaction}"),
        SizedBox(height: 16,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Payment Status".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
            Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor),borderRadius: BorderRadius.circular(10)),child: Text("${widget.bookings.paymentStatus}",style: TextStyle( fontSize: 16, color: CustomTheme.theamColor,)))
          ],
        ),
        SizedBox(height: 16,),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Booking Status".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
            Text("${widget.bookings.status}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: notifire.getwhiteblackcolor,))
          ],
        ),

        widget.bookings.cancelledBy==null?SizedBox():Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Cancelled By".tr, style: TextStyle( fontSize: 16, color: notifire.getwhiteblackcolor,),),
              Text("${widget.bookings.cancelledBy}",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: notifire.getwhiteblackcolor,))
            ],
          ),
        ),

        SizedBox(height: 24,),
      ],),
    );
  }
}
