import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/BookrealEstateController.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/GetPropertyPrices.dart';
import 'package:Tukki/model/PropertyDetailsModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/WalletModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/booking/webviewpage.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../homePage/HomePage.dart';

class ReviewSummary extends StatefulWidget {
  final dynamic idFeatured;

  final dynamic numberofguest;
  final dynamic bookingForSomeOne;
  int totalNight;
  PropertyDetails propertyDetails;

  ReviewSummary(
      {super.key,
      required this.idFeatured,
      required this.numberofguest,
      required this.bookingForSomeOne,
      required this.totalNight,
      required this.propertyDetails});

  @override
  State<ReviewSummary> createState() => _ReviewSummaryState();
}

class _ReviewSummaryState extends State<ReviewSummary> {
  BookRealEstateController bookRealEstateController = Get.find();
  PageController _pageControllerslider = PageController();
  final ValueNotifier<int> _currentPageSliderNotifier = ValueNotifier<int>(0);
  TextEditingController textEditingController = TextEditingController();

  var couponValue;
  double basePrice = 0;
  double tax = 0;
  double serviceCharge = 0;
  String currency = "";
  double discount = 0;
  bool isPaymentSuccess = false;
  GetPropertyPrices? getPropertyPrices;
  bool switchWallet = false;
  WalletModel? walletModel;

  @override
  void initState() {
    super.initState();
    _pageControllerslider = PageController();
    _pageControllerslider.addListener(() {
      if (_pageControllerslider.page != null) {
        _currentPageSliderNotifier.value = _pageControllerslider.page!.round();
      }
    });
    textEditingController.addListener(listner);

    // basePrice = double.parse("${widget.propertyDetails.price}") *
    //     double.parse("${widget.totalNight}");
    currency = generalDataModel!.data!.metaData!.generalDefaultCurrency!;
    // tax = basePrice *double.parse(generalDataModel!.data!.metaData!.feesetupIvaTax!) / 100;
    // serviceCharge = basePrice * double.parse(
        // generalDataModel!.data!.metaData!.feesetupGuestServiceCharge!) / 100;
    getData("","");
    getWalletData();
  }

  getWalletData() async {
    var resp = await httpPost(Config.getUserWallet, {});
    if (resp != null) {
      walletModel = WalletModel.fromJson(resp);
      if (walletModel!.status == 200) {

      } else {
        showErrorToastMessage(walletModel!.error);
      }
      setState(() {});
    }
  }

  getData(coupon,wallet) async {
    Map map = {
      "property_id": "${widget.idFeatured}",
      "check_in": "${bookRealEstateController.startDate}",
      "check_out": "${bookRealEstateController.endDate}",
      "coupon_code": coupon,
      "wallet_amount":"$wallet"
    };
    var response = await httpPost(Config.getPropertyPrices, map);
    if (response != null) {
      if (response['status'] == 200) {
        getPropertyPrices = GetPropertyPrices.fromJson(response);
        textEditingController.text = "";
        setState(() {});
      } else {
        showErrorToastMessage(response['error']);
      }
    }
  }

  listner() {
    if (textEditingController.text.isNotEmpty) {
      bookRealEstateController.showAddCouponBtn.value = true;
    } else {
      bookRealEstateController.showAddCouponBtn.value = false;
    }
  }

  bookProperty() async {
    showLoading();

    var couponCode;
    if(getPropertyPrices!.data!.couponCode==null){
      couponCode="";
    }else{
      couponCode=getPropertyPrices!.data!.couponCode;
    }


    var total = basePrice - discount + serviceCharge + tax;
    var result = await bookRealEstateController.bookPropertyMethod(
        "${widget.propertyDetails.propertyId}",
        bookRealEstateController.startDate.value,
        bookRealEstateController.endDate.value,
        "${widget.totalNight-1}",
        "${widget.propertyDetails.price}",
        widget.bookingForSomeOne,
        "${getPropertyPrices!.data!.priceBeforeDiscount}",
        "${getPropertyPrices!.data!.serviceCharge!}", "0", "${getPropertyPrices!.data!.tax!}", '${getPropertyPrices!.data!.grossPrice!}', currency, 'stripe', getPropertyPrices!.data!.walletAmount!.toString(),
        widget.propertyDetails.hostId!,
        widget.numberofguest,
        couponCode,
      getPropertyPrices!.data!.discountPrice!.toString(),
      getPropertyPrices!.data!.couponDiscount!.toString(),
      getPropertyPrices!.data!.discountType!,
      getPropertyPrices!.data!.cleaningCharge!.toString()
    );
    closeLoading();
    if (result != null) {
      if (result['data'] != null) {
        Get.to(() =>
            WebViewPage(url: result['data']['payment_url'],
              bookingId: result['data']['booking_id'].toString(),))!.then((
            value) {
          if (value == null) {
            return;
          }
          // Fluttertoast.showToast(msg: value == "NotPaid" ? "Payment Failed" : "Payment Successful");
          if (value == "Paid") {
            isPaymentSuccess = true;
          } else {
            isPaymentSuccess = false;
          }
          setState(() {});
        });
      }
    }
  }


  checkCouponMethod() async {
    showLoading();
    couponValue = await bookRealEstateController.checkCouponMethod(
        {"coupon_code": textEditingController.text});
    closeLoading();
    if (couponValue != null) {
      print("dissssssss1");
      print(double.parse('${couponValue['min_order_amount']}'));
      print(basePrice);

      if (double.parse('${couponValue['min_order_amount']}') < basePrice) {
        print("dissssssss2");
        discount =
            basePrice * double.parse('${couponValue["coupon_value"]}') / 100;
        showToastMessage("Coupon added");
      } else {
        showToastMessage("Min order amount is less than required for coupon");
      }
      textEditingController.text = "";
      setState(() {});
    }
  }

  @override
  void dispose() {
    _pageControllerslider.dispose();
    textEditingController.removeListener(listner);

    super.dispose();
  }

  onWillPop() {
    if (isPaymentSuccess == false) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return WillPopScope(onWillPop: () => onWillPop(), child:
    Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: isPaymentSuccess == true ? SizedBox() : IconButton(
            onPressed: () {
              if (isPaymentSuccess == false) {
                Get.back();
              }
            },
            icon: Icon(
              Icons.arrow_back,
              color: notifire.getwhiteblackcolor,
            )),
        title: Text(
          isPaymentSuccess == false ? 'Review Summary'.tr : "Booking Summary".tr,
          style: TextStyle(
              fontSize: 17,
              fontFamily: FontStyles.gilroyBold,
              color: notifire.getwhiteblackcolor),
        ),
      ),
      body: getPropertyPrices == null ? Center(
        child: CircularProgressIndicator(),) : SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: Get.size.width,
                        height: 200,
                        child: PageView.builder(pageSnapping: true,
                            controller: _pageControllerslider,
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.propertyDetails.galleryImageUrls!
                                .length,
                            itemBuilder: (context, index) {
                              return FadeInImage.assetNetwork(
                                fadeInCurve: Curves.easeInCirc,
                                placeholder:
                                "assets/images/ezgif.com-crop.gif",
                                height: 200,
                                width: Get.size.width,
                                image: widget.propertyDetails.galleryImageUrls!
                                    .elementAt(index),
                                fit: BoxFit.cover,
                              );
                            }),
                      ),
                      ValueListenableBuilder<int>(
                        valueListenable: _currentPageSliderNotifier,
                        builder: (context, value, child) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                  widget.propertyDetails.galleryImageUrls!
                                      .length, (index) {
                                return Container(
                                  margin:
                                  EdgeInsets.only(top: 200, left: 5),
                                  width: 8.0,
                                  height: 8.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: value == index
                                        ? CustomTheme.theamColor
                                        : Colors.grey,
                                  ),
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text("${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${getPropertyPrices!.data!.pricePerNight!}",
                                style: CustomTheme.featuredslidertitle),
                            Text('/night'.tr,
                                style: CustomTheme.mostviewnight),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: CustomTheme.theamColor,
                          ),
                          Text(
                              widget.propertyDetails.propertyRating!,
                              style: CustomTheme.mostviewrating)
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.propertyDetails.title!,
                            style: CustomTheme.mostviewdescription,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "${widget.propertyDetails.propertyType!} Beds ${widget
                              .propertyDetails.beds!} ",
                          style: CustomTheme.mostviewbeds,
                        ),
                      ],
                    ),
                  )
                ],
              ),

              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Check in".tr,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                  Obx(
                        () =>
                        Text(
                          '${bookRealEstateController.startDate}',
                          style: TextStyle(
                            fontFamily: FontStyles.gilroyBold,
                            fontSize: 15,
                            color: CustomTheme.theamColor,
                          ),
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Check out".tr,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                  Obx(() =>
                        Text(
                          '${bookRealEstateController.endDate}',
                          style: TextStyle(
                            fontFamily: FontStyles.gilroyBold,
                            fontSize: 15,
                            color: CustomTheme.theamColor,
                          ),
                        ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Number of Guest".tr,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                  Text(
                    widget.numberofguest,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyBold,
                      fontSize: 15,
                      color: CustomTheme.theamColor,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Booking for someone".tr,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium,
                      fontSize: 15,
                      color: notifire.getwhiteblackcolor,
                    ),
                  ),
                  Text(
                    widget.bookingForSomeOne.isEmpty ? 'N/A' : widget
                        .bookingForSomeOne,
                    style: TextStyle(
                      fontFamily: FontStyles.gilroyBold,
                      fontSize: 15,
                      color: CustomTheme.theamColor,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16,),
              isPaymentSuccess == true ? SizedBox() : Visibility(
                child: Container(
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Coupon".tr,
                        style: TextStyle(
                          color: notifire.getwhiteblackcolor,
                          fontFamily: FontStyles.gilroyBold,
                          fontSize: 17,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: Get.size.width,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            SvgPicture.asset(
                              'assets/images/Ticket.svg',
                              height: 25,
                              width: 25,
                              color: notifire.getgreycolor,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextField(
                                controller: textEditingController,
                                decoration: InputDecoration.collapsed(
                                  hintText: "coupon code".tr,),
                                style: TextStyle(
                                  fontFamily: FontStyles.gilroyMedium,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                            Spacer(),

                            Obx(() => bookRealEstateController.showAddCouponBtn.value ==
                                false ? SizedBox() : InkWell(
                              onTap: () async {

                                showLoading();
                                if(switchWallet){
                                  await getData(textEditingController.text,"${walletModel!.data!.walletBalance!}");
                                }else{
                                  await getData(textEditingController.text,"");
                                }

                                closeLoading();
                              },
                              child: Text(
                                'Apply'.tr,
                                style: TextStyle(
                                  fontFamily: FontStyles.gilroyBold,
                                  fontSize: 16,
                                  color: CustomTheme.theamColor,
                                ),
                              ),
                            )),

                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: notifire.getblackwhitecolor,
                          borderRadius: BorderRadius.circular(10),
                          border:
                          Border.all(color: CustomTheme.theamColor, width: 2),
                        ),
                      )
                    ],
                  ),
                ),
              ),

    
              isPaymentSuccess==true?SizedBox():walletModel==null?SizedBox(): walletModel!.data!.walletBalance == null ? SizedBox():
              walletModel!.data!.walletBalance==0?SizedBox():
              Column(
                children: [SizedBox(height: 24,),
                  Container(padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text("Pay from Wallet".tr, style: TextStyle(
                        fontFamily: "Gilroy Bold", fontWeight: FontWeight.w500,)),
                      SizedBox(height: 8,),
                      Text("Wallet Balance".tr, style: TextStyle(fontFamily: FontStyles.gilroyMedium,)),
                      SizedBox(height: 8,),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            children: [
                              Text("Available for Payment : ".tr, style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,)),
                              walletModel!.data!.walletBalance == null ? SizedBox() : Text(
                                '$currency ${walletModel!.data!.walletBalance!}',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          walletModel == null ? SizedBox() : SizedBox(height: 16,
                              child: Switch(
                                  value: switchWallet, onChanged: (onChanged) async {
                                print(onChanged);
                                var cp;
                                if(getPropertyPrices!.data!.couponCode==null){
                                  cp="";
                                }else{
                                  cp=getPropertyPrices!.data!.couponCode;
                                }
                                showLoading();
                                if(onChanged==true){
                                  await getData(cp,"${walletModel!.data!.walletBalance!}");
                                }else{
                                  await getData(cp,"");
                                }
                                closeLoading();
                                switchWallet = onChanged;
                                setState(() {

                                });
                              }))
                        ],
                      ),
                      getPropertyPrices!.data!.remainingWalletBalance=='0' && !switchWallet ?SizedBox():SizedBox(height: 8,),
                      getPropertyPrices!.data!.remainingWalletBalance=='0' && !switchWallet?SizedBox():Wrap(
                        children: [
                          Text("Remaining Wallet Balance : ".tr, style: TextStyle(fontFamily: FontStyles.gilroyMedium,)),
                          Text("$currency ${getPropertyPrices!.data!.remainingWalletBalance!}", style: TextStyle(fontFamily: "Gilroy Bold",)),
                        ],
                      )
                    ],),),
                ],
              ),

              SizedBox(
                height: 24,
              ),

              rowX("Amount ( ${getPropertyPrices!.data!.totalNights!} ${int.parse(getPropertyPrices!.data!.totalNights!)>1?"nights":"night"} )", "$currency ${getPropertyPrices!.data!.priceBeforeDiscount!}"),
              getPropertyPrices!.data!.discountPrice != "0" ? rowX(getPropertyPrices!.data!.discountType!, "- ${currency} ${getPropertyPrices!.data!.discountPrice!}") : SizedBox(),
              getPropertyPrices!.data!.couponDiscount == "0" ? SizedBox() : rowX("Coupon ( ${getPropertyPrices!.data!.couponCode!} )", "- $currency ${getPropertyPrices!.data!.couponDiscount!}"),
              getPropertyPrices!.data!.serviceCharge == "0" ? SizedBox() : rowX("Service Charge", "$currency ${getPropertyPrices!.data!.serviceCharge!}"),
              getPropertyPrices!.data!.cleaningCharge == "0" ? SizedBox() : rowX("Cleaning Charge", "$currency ${getPropertyPrices!.data!.cleaningCharge!}"),
              getPropertyPrices!.data!.tax == 0 ? SizedBox() : rowX("Tax", "$currency ${getPropertyPrices!.data!.tax!}"),
              getPropertyPrices!.data!.walletAmount == "0" ? SizedBox() : rowX("Wallet", "- $currency ${getPropertyPrices!.data!.walletAmount!}"),

              SizedBox(height: 8,),
              Divider(thickness: 1, color: CustomTheme.theamColor,),
              rowX("Total Price".tr, "$currency ${getPropertyPrices!.data!.grossPrice!}"),
              SizedBox(height: 16,),

              Container(
                margin: CustomTheme.verticalPagePadding,
                child: GestButton(
                  height: 50,
                  buttoncolor: blueColor,
                  buttontext: isPaymentSuccess == false
                      ? "Continue".tr
                      : "See My Bookings".tr,
                  style: TextStyle(
                    fontFamily: "Gilroy Bold",
                    color: WhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  onclick: () async {
                  
                    if (isPaymentSuccess == false) {
                      bookProperty();
                      // _showBottomSheet(context);
                      return;
                    }
                    generalController.currentIndex.value = 2;
                    Get.offAll(() => HomePage(initialIndex: 2,));
                  },
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    ),);
  }

  rowX(f1, f2) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(f1, style: TextStyle(
            fontFamily: FontStyles.gilroyMedium,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            color: notifire.getwhiteblackcolor,
          ),
          ),
          Text(
            f2,
            style: TextStyle(
              fontFamily: FontStyles.gilroyMedium,
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: CustomTheme.theamColor,
            ),
          ),
        ],
      ),
    );
  }
}