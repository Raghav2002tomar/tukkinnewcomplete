import 'package:Tukki/controller/BookrealEstateController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/BookDateRealEstate.dart';
import 'package:Tukki/model/PropertyDetailsModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';

import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/booking/ReviewSummary.dart';
import 'package:Tukki/workspace.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../controller/GeneralController.dart';

class BookRealEstate extends StatefulWidget {
  final dynamic idFeatured;
  PropertyDetails propertyDetails;
 BookRealEstate({super.key, required this.idFeatured,required this.propertyDetails});

  @override
  State<BookRealEstate> createState() => _BookRealEstateState();
}

class _BookRealEstateState extends State<BookRealEstate> {
  int Numberofguest = 1;
  bool chack = false;

  String te = '';
  String EndDate = '';

  int count = 1;
  List<DateTime> selectedDates = [];
  String checkDateResult = "true";
  String checkDateMsg = "";
  bool _isChecked = false;
  String rangeCount = '';
  bool visible = false;

  final TextEditingController _textController = TextEditingController();
  List days = [];
  BookRealEstateController bookrealEstateController = Get.find();
  late Future<BookdDate> bookedDateFuture;
  List<DateTime> alreadySelectedList = [];
  bool processing = true;
  DateRangePickerController dateRangePickerController = DateRangePickerController();
  List<DateTime> availableDates=[];
  List availableDatesPrice=[];


  checkTermsAndCondition(bool? newbool) {
    chack = newbool ?? false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    bookrealEstateController.idFeatured = widget.idFeatured;
    print(widget.propertyDetails.availableDates);
    for(var x in widget.propertyDetails.availableDates!){
      print(x.date);
      if(DateTime.parse(x.date!).isBefore(DateTime.now())){
        continue;
      }
      availableDates.add(DateTime.parse(x.date!));
      availableDatesPrice.add(x.price!);
    }
    // DateTime oneExtraDay=DateTime.parse("${widget.propertyDetails.availableDates![widget.propertyDetails.availableDates!.length-1].date}").add(Duration(days: 1));


    // availableDates.add(oneExtraDay);
    // availableDatesPrice.add(widget.propertyDetails.availableDates![widget.propertyDetails.availableDates!.length-1].price!);

    print("AVVVVVV");
    getData();
  }



  getData() async {
    BookdDate bookdDate = await bookrealEstateController.bookDateApi(idFeatured: '${widget.idFeatured}');
    for (int i = 0; i < bookdDate.data!.propertyBookingDate!.length; i++) {
      List<DateTime> daysx = getDaysInBetween(
          DateTime.tryParse(bookdDate.data!.propertyBookingDate![i].checkIn!)!,
          DateTime.tryParse(bookdDate.data!.propertyBookingDate![i].checkOut!)!);
      alreadySelectedList.addAll(daysx);
    }
    processing = false;
    setState(() {});
  }

  List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
    List<DateTime> days = [];
    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      days.add(startDate.add(Duration(days: i)));
    }
    print("DAYSSSSS $days");
    return days;
  }


onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      bookrealEstateController.startDate.value = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)}';
    
      if(alreadySelectedList.contains(args.value.startDate.add(Duration(days: 1))) && args.value.endDate==null){
        print('Hello ${'${args.value.startDate.add(Duration(days: 1))}'}');
        
        bookrealEstateController.endDate.value = '${DateFormat('yyyy-MM-dd').format(args.value.startDate.add(Duration(days: 1)))}';
      }else{
        if(availableDates.last== args.value.startDate && args.value.endDate==null){
          bookrealEstateController.endDate.value = '${DateFormat('yyyy-MM-dd').format(args.value.startDate.add(Duration(days: 1)))}';
        }else{
        
          bookrealEstateController.endDate.value = '${DateFormat('yyyy-MM-dd').format(args.value.endDate ?? args.value.startDate)}';
        }
      }
      
       bookrealEstateController.isDateAvailale==false;
      //  setState(() {
        
      //  });
      bookrealEstateController.checkDateApi(idFeatured: '${bookrealEstateController.idFeatured}').then((value){
        setState(() {
        });
      });
    } else if (args.value is DateTime) {
      // _selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      // _dateCount = args.value.length.toString();
    } else {
      // _rangeCount = args.value.length.toString();
    }
  }


  @override
  void dispose() {

    bookrealEstateController.startDate.value='';
    bookrealEstateController.endDate.value='';
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
      backgroundColor: notifire.getbgcolor,
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
            )),
        title: Text(
          'Book Real Estate'.tr,
          style: TextStyle(
              fontSize: 17,
              fontFamily: FontStyles.gilroyBold,
              color: notifire.getwhiteblackcolor),
        ),
      ),
      body: processing
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 10, left: 15),
                  child: Row(
                    children: [
                      Text(
                        "Select Date".tr,
                        style: TextStyle(
                            fontSize: 17, color: notifire.getwhiteblackcolor),
                      ),
                    ],
                  ),
                ),
              ),

            
            
              SizedBox(height: 16,),
              SizedBox(
                height: 400,
                child: Container(
                  padding: EdgeInsets.only(left: 8,right: 8),
                  margin: EdgeInsets.all(0),
                  decoration: BoxDecoration(color: Color.fromARGB(238, 233, 216, 178), borderRadius: BorderRadius.circular(15),),
                  child: SfDateRangePicker(
                          controller: dateRangePickerController,
                          onSelectionChanged: onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                          enablePastDates: false,
                          endRangeSelectionColor: Colors.transparent,
                          startRangeSelectionColor: Colors.transparent,
                          rangeSelectionColor: Colors.transparent,
                          headerStyle: DateRangePickerHeaderStyle(textStyle: TextStyle(fontFamily: FontStyles.gilroyBlack, color: notifire.getwhiteblackcolor,),),
                          // monthViewSettings: DateRangePickerMonthViewSettings(blackoutDates: alreadySelectedList,
                          // specialDates: availableDates),
                          monthCellStyle: DateRangePickerMonthCellStyle(textStyle: TextStyle(color: Colors.grey),specialDatesTextStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),blackoutDateTextStyle: TextStyle(color: Colors.white,),blackoutDatesDecoration: BoxDecoration(shape: BoxShape.circle,color: Colors.redAccent.shade100)),

                    cellBuilder: (context, cellDetails) {
                            DateTime now=DateTime.now();
                            return Container(margin: EdgeInsets.all(1),alignment: Alignment.center,decoration: 
                            BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Greycolor),
                            color: 
                            alreadySelectedList.contains(cellDetails.date)  ?Colors.red:
                            // bookrealEstateController.endDate.value!=null && bookrealEstateController.endDate.value.isNotEmpty &&DateTime.parse(bookrealEstateController.endDate.value)==cellDetails.date && alreadySelectedList.contains(DateTime.parse(bookrealEstateController.endDate.value))?Colors.purple:
                            bookrealEstateController.startDate.value.isNotEmpty && DateTime.parse(bookrealEstateController.startDate.value)==cellDetails.date?CustomTheme.theamColor:
                            bookrealEstateController.endDate.value!=null && bookrealEstateController.endDate.value.isNotEmpty && DateTime.parse(bookrealEstateController.endDate.value)==cellDetails.date?CustomTheme.theamColor:
                            bookrealEstateController.startDate.value!=null && bookrealEstateController.endDate.value!=null &&  bookrealEstateController.startDate.value.isNotEmpty && bookrealEstateController.endDate.value.isNotEmpty && DateTime.parse(bookrealEstateController.startDate.value).isBefore( cellDetails.date) && DateTime.parse(bookrealEstateController.endDate.value).isAfter( cellDetails.date)?CustomTheme.theamColor:
                             
                             Colors.transparent),
                            
                            child: Center(child: Column(mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(cellDetails.date.day.toString(),style: TextStyle(color: cellDetails.date.isBefore(now)?Colors.grey: alreadySelectedList.contains(cellDetails.date)?Colors.white:availableDates.contains(cellDetails.date)?Colors.black:Colors.grey,decoration: cellDetails.date.isBefore(now)?TextDecoration.none:availableDates.contains(cellDetails.date)?TextDecoration.none: alreadySelectedList.contains(cellDetails.date)?TextDecoration.none:TextDecoration.lineThrough),),
                                !availableDates.contains(cellDetails.date)?SizedBox():alreadySelectedList.contains(cellDetails.date)?SizedBox():Text(
                                "${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${double.parse("${availableDatesPrice.elementAt(availableDates.indexOf(cellDetails.date))}").toInt()}",style: TextStyle(fontSize: 8),),
                                ],
                            )),);
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                   
                
                    Row(
                      children: [
                        Row(children: [
                          ClipRRect(borderRadius: BorderRadius.circular(40),child: Container(height: 10,width: 10,color: Colors.red,)),
                          SizedBox(width: 5),
                          Text("Not Available".tr),
                          

                        ],),
                        SizedBox(width: 20,),
                          Row(children: [
                      ClipRRect(borderRadius: BorderRadius.circular(40),child: Container(height: 10,width: 10,color: CustomTheme.theamColor)),
                      SizedBox(width: 5,),
                      Text("Selected for Booking".tr),

                    ],),
                      ],
                    ),
                    SizedBox(height: 8,),
                  
                  ],
                ),
              ),
              SizedBox(height: 16,),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Check in".tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: FontStyles.gilroyBold,
                          color: notifire.getwhiteblackcolor,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Text(
                        "Check out".tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: FontStyles.gilroyBold,
                          color: notifire.getwhiteblackcolor,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 55,
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: notifire.getblackwhitecolor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Obx(() => Text(
                                '${bookrealEstateController.startDate}',
                                style: TextStyle(
                                  fontFamily: FontStyles.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                ),
                              )),
                          Spacer(),
                          SvgPicture.asset(
                                "assets/images/Calendar.svg",
                            height: 25,
                            width: 25,
                            color: BlackColor,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 55,
                      margin: EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),

                          Obx(() => Text(
                                '${bookrealEstateController.endDate}',
                                style: TextStyle(
                                  fontFamily: FontStyles.gilroyMedium,
                                  color: notifire.getwhiteblackcolor,
                                ),
                              )),

                          //  Text(
                          //     "dd/mm/yyyy",
                          //     style: TextStyle(
                          //       fontFamily: FontStyles.gilroyMedium,
                          //       color: notifire.getgreycolor,
                          //     ),
                          //   ),
                          Spacer(),
                          SvgPicture.asset(
                                "assets/images/Calendar.svg",
                            height: 25,
                            width: 25,
                            color: BlackColor,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: notifire.getblackwhitecolor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 100,
                width: Get.size.width,
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.only(left: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Number of Guest".tr,
                              style: TextStyle(
                                color: notifire.getwhiteblackcolor,
                                fontFamily: FontStyles.gilroyBold,
                                fontSize: 17,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "${"Allowed Max"} ${widget.propertyDetails.personAllowed!} ${"Guest"}".tr,
                              style: TextStyle(
                                color: notifire.getwhiteblackcolor,
                                fontFamily: FontStyles.gilroyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.all(5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (Numberofguest > 1)
                                    Numberofguest = Numberofguest - 1;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.remove,
                                  color: CustomTheme.theamColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CustomTheme.theamColor,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "$Numberofguest",
                                  // "${bookrealEstateController.count}",
                                  style: TextStyle(
                                      color: notifire.getwhiteblackcolor,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (Numberofguest < int.parse(widget.propertyDetails.personAllowed!))
                                    Numberofguest = Numberofguest + 1;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add,
                                  color: CustomTheme.theamColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CustomTheme.theamColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: notifire.getblackwhitecolor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: Row(
                  children: [
                    Text(
                      "Note to Owner (optional)".tr,
                      style: TextStyle(
                        fontSize: 17,
                        fontFamily: FontStyles.gilroyBold,
                        color: notifire.getwhiteblackcolor,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                child: TextFormField(
                  minLines: 5,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: notifire.getwhiteblackcolor,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    focusedBorder: InputBorder.none,
                    border: InputBorder.none,
                    hintText: "Notes".tr,
                    hintStyle: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                    ),
                  ),
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 16,
                    color: notifire.getwhiteblackcolor,
                  ),
                ),
                decoration: BoxDecoration(
                  color: notifire.getblackwhitecolor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: const Color.fromARGB(255, 125, 123, 123)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Booking for someone".tr,
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: FontStyles.gilroyBold,
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                  Spacer(),
                  Transform.scale(
                    scale: 1,
                    child: InkWell(
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            _isChecked = value!;
                          });
                          if (value!) {
                            print('xyz');
                            Future.delayed(Duration(milliseconds: 50))
                                .then((value) {
                              Scrollable.ensureVisible(
                                  GlobalObjectKey(1).currentContext!);
                            });
                          }
                        },
                      ),
                      onTap: () {
                        print("hello jii");
                      },
                    ),
                  ),
                ],
              ),

              if (_isChecked)
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                  child: TextField(
                    key: GlobalObjectKey(1),
                    controller: _textController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: notifire.getgreycolor),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(color: notifire.getgreycolor),
                      ),
                      labelText: "Name of guest".tr,
                      labelStyle: TextStyle(
                        color: BlackColor,
                      ),
                    ),
                  ),
                ),
              SizedBox(
                height: 150,
              )
            ],
          ),
        ),

        Obx(() => bookrealEstateController.isDateChecking.value==true?
          Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: CustomTheme.theamColor),child: CircularProgressIndicator(color: Colors.white,)),
                ],
              ),
            ],
          ) :
          SizedBox(),),

         bookrealEstateController.isDateAvailale==false?SizedBox():Positioned(
          bottom: 20,
          left: 20,
          right: 20,
          child: GestButton(
            Width: Get.size.width,
            height: 50,
            buttoncolor: blueColor,
            margin: EdgeInsets.only(top: 15, left: 30, right: 30),
            buttontext: "Continue".tr,
            style: TextStyle(
              fontFamily: FontStyles.gilroyBold,
              color: WhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            onclick: () {
              chack == true;
              if(bookrealEstateController.startDate.value.isEmpty || bookrealEstateController.endDate.value.isEmpty){
                Fluttertoast.showToast(msg: 'Select date to continue'.tr);
                return;
              }
              if(bookrealEstateController.isDateAvailale==false){
                Fluttertoast.showToast(msg: 'Date is not available, try again.'.tr);
                return;
              }
              List totalNight=getDaysInBetween(
                  DateTime.tryParse(bookrealEstateController.startDate.value)!,
                  DateTime.tryParse(bookrealEstateController.endDate.value)!);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewSummary(
                    idFeatured: widget.idFeatured,
                    numberofguest: Numberofguest.toString(),
                    bookingForSomeOne: _textController.text,
                    totalNight: totalNight.length,
                    propertyDetails: widget.propertyDetails,
                  ),
                ),
              );
            },
          ),
        )
       
      ]), 
    );
  }

  void open() {}
}
