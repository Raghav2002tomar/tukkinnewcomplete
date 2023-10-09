import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/CustomBottomSheet.dart';
import 'package:Tukki/customWidgets/CustomToast.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/BookingModel.dart';
import 'package:Tukki/model/CancellationReasonModel.dart';
import 'package:Tukki/model/LocationsModel.dart';
import 'package:Tukki/model/PropertyModel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/explore/PropertyDetailsScreen.dart';
import 'package:Tukki/view/homePage/explore/SeeAllProperties.dart';
import 'package:Tukki/view/homePage/inbox/ConversationScreen.dart';
import 'package:Tukki/view/homePage/trips/E_RecieptScreen.dart';
import 'package:Tukki/view/homePage/wishlist/WishListScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

popularLocationsWidget(List<Locations> list, notifire) {
  return SizedBox(
      height: 170,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () async {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAllPropertiesScreen(title: list[index].cityName!,locationId: "${list[index].id}",)));
            },
            child: Container(
              height: 180,
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  const SizedBox(
                    width: 8,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 180,
                        width: 130,
                        margin: const EdgeInsets.all(0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child:
                            SizedBox(height: 140,
                              child:
                              myNetworkImage(list.elementAt(index).image),)

                          // FadeInImage.assetNetwork(
                          //   fadeInCurve: Curves.easeInCirc,
                          //   placeholder: "assets/images/ezgif.com-crop.gif",
                          //   height: 140,
                          //   image: list.elementAt(index).image ?? "",
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                      ),
                      Column(
                        children: [
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 130,
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                gradient: LinearGradient(
                                  colors: [
                                    CustomTheme.theamColor.withOpacity(.3),
                                    CustomTheme.theamColor.withOpacity(.4),
                                    CustomTheme.theamColor.withOpacity(.5),
                                    CustomTheme.theamColor.withOpacity(.6),
                                    CustomTheme.theamColor.withOpacity(.7),
                                    CustomTheme.theamColor.withOpacity(.8),
                                    CustomTheme.theamColor.withOpacity(.9),
                                    CustomTheme.theamColor.withOpacity(1),
                                  ],
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    list.elementAt(index).cityName!.length > 10
                                        ? list
                                            .elementAt(index)
                                            .cityName!
                                            .substring(0, 9)
                                        : list.elementAt(index).cityName ?? "",
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ));
}

int wishListLoadingHorizontal = -1;
myListHorizontal(List<Properties> list, StateSetter setState, notifire) {
  return SizedBox(
    height: 250,
    child: ListView.builder(
      itemCount: list.length>5?5:list.length,
      scrollDirection: Axis.horizontal,
      // physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PropertyDetailsScreen(id: list.elementAt(index).id)));
          },
          child: Column(
            children: [
              Container(
                height: 170,
                margin: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  color: notifire.getblackwhitecolor,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Stack(
                      children: [
                        Container(
                          height: 180,
                          width: 250,
                          margin: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: FadeInImage.assetNetwork(
                              fadeInCurve: Curves.easeInCirc,
                              placeholder: "assets/images/ezgif.com-crop.gif",
                              height: 140,
                              image: list.elementAt(index).image ?? "",
                              imageErrorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                    "assets/images/ezgif.com-crop.gif");
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: wishListLoadingHorizontal == index
                                  ? Colors.transparent
                                  : const Color(0xFFedeeef),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                wishListLoadingHorizontal == index
                                    ? const SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator())
                                    : InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          child: Image.asset(
                                            "assets/images/HeartTheamcolor.png",
                                            height: 20,
                                            width: 20,
                                            color: list[index].isInWishlist ==
                                                    false
                                                ? Colors.orange
                                                : Colors.red,
                                          ),
                                        ),
                                        onTap: () async {
                                          wishListLoadingHorizontal = index;
                                          setState(() {});

                                          if (list[index].isInWishlist ==
                                              false) {
                                            var value = await wishListController
                                                .addTowishlist(list[index].id);

                                            if (value == true) {
                                              var vvv = list[index];
                                              vvv.wishlistSetter = true;
                                              list[index] = vvv;
                                            }
                                          } else {
                                            var value = await wishListController
                                                .removeToWishlist(
                                                    list[index].id);

                                            if (value == true) {
                                              var vvv = list[index];
                                              vvv.wishlistSetter = false;
                                              list[index] = vvv;
                                            }
                                          }
                                          wishListLoadingHorizontal = -1;
                                          setState(() {});
                                        },
                                      ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: FontStyles.gilroyMedium,
                                    color: blueColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        // Expanded(
                        //   child: Column(
                        //     crossAxisAlignment:
                        //         CrossAxisAlignment.start,
                        //     children: [
                        //       Row(
                        //         children: [],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 250,
                // color: RedColor,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text.rich(TextSpan(
                              text:
                                  "${generalDataModel!.data!.metaData!.generalDefaultCurrency} ${list.elementAt(index).price}",
                              style: const TextStyle(
                                  fontSize: 15,
                                  color: CustomTheme.theamColor,
                                  fontWeight: FontWeight.w600),
                              children: const <InlineSpan>[
                                TextSpan(
                                  text: ' /night',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                )
                              ])),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.star,
                              color: CustomTheme.theamColor,
                              size: 15,
                            ),
                            Text(list.elementAt(index).propertyRating! ?? "",
                                style: CustomTheme.featuredsliderrating)
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          list.elementAt(index).name!.length > 21
                              ? list.elementAt(index).name!.substring(0, 20)
                              : list.elementAt(index).name! ?? "",
                          style: CustomTheme.featuredsliderdescription,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      children: [
                        Text(
                          '${list.elementAt(index).propertyType!}/',
                          style: CustomTheme.featuredsliderhome,
                        ),
                        Text(
                          '${list.elementAt(index).beds!} beds',
                          style: CustomTheme.featuredsliderbeds,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}

int wishListLoading = -1;
myList(list, shrink, fromWishList, StateSetter setState) {
  return ListView.builder(
      shrinkWrap: shrink,
      physics: shrink == false
          ? const BouncingScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      itemCount: shrink == true
          ? list!.length > 4
              ? 4
              : list!.length
          : list!.length,
      itemBuilder: (context, index) {
        return InkWell(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          width: Get.size.width,
                          height: MediaQuery.of(context).size.height / 4,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(10), // Image border
                            child: SizedBox.fromSize(
                              size: const Size.fromRadius(180), // Image radius
                              child: FadeInImage.assetNetwork(
                                fadeInCurve: Curves.easeInCirc,
                                placeholder: "assets/images/ezgif.com-crop.gif",
                                height: 50,
                                image: "${list![index].image}",
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/ezgif.com-crop.gif",
                                    fit: BoxFit.fill,
                                  );
                                },
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 15,
                          child: Container(
                            decoration: BoxDecoration(
                              color: wishListLoading == index
                                  ? Colors.transparent
                                  : const Color(0xFFedeeef),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                wishListLoading == index
                                    ? const SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator())
                                    : InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.all(3),
                                          child: Image.asset(
                                            "assets/images/HeartTheamcolor.png",
                                            height: 20,
                                            width: 20,
                                            color: list[index].isInWishlist ==
                                                    false
                                                ? Colors.orange
                                                : Colors.red,
                                          ),
                                        ),
                                        onTap: () async {
                                          print("qwertyuiop ${list![index].isInWishlist}");

                                          wishListLoading = index;
                                          setState(() {});

                                          if (list[index].isInWishlist == false) {
                                            var value = await wishListController.addTowishlist(list[index].id);
                                            print("vvvvv $value");

                                            if (value == true) {
                                              var vvv = list![index];
                                              vvv.wishlistSetter = true;
                                              list[index] = vvv;
                                            }
                                          } else {
                                            var value = await wishListController.removeToWishlist(list[index].id);
                                            print("vvvvv $value");

                                            if (value == true) {
                                              if (fromWishList == true) {
                                                list.removeAt(index);
                                              } else {
                                                var vvv = list![index];
                                                vvv.wishlistSetter = false;
                                                list[index] = vvv;
                                              }
                                            }
                                          }
                                          wishListLoading = -1;
                                          setState(() {});
                                        },
                                      ),
                                Text(
                                  "",
                                  style: TextStyle(
                                    fontFamily: FontStyles.gilroyMedium,
                                    color: blueColor,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text.rich(TextSpan(
                                  text:
                                      "${generalDataModel!.data!.metaData!.generalDefaultCurrency} ${list![index].price}",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      color: CustomTheme.theamColor,
                                      fontWeight: FontWeight.w600),
                                  children: const <InlineSpan>[
                                    TextSpan(
                                      text: ' /night',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ])),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: CustomTheme.theamColor,
                                  size: 15,
                                ),
                                Text("${list![index].propertyRating}",
                                    style: CustomTheme.featuredsliderrating)
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${list![index].name!.length > 40 ? list![index].name!.substring(0, 39) : list![index].name!}",
                                style: CustomTheme.mostviewdescription,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Container(
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.s,
                            children: [
                              Text(
                                "${list![index].propertyType} ",
                                style: CustomTheme.mostviewhome,
                              ),
                              Text(
                                "/ ${list![index].beds} beds",
                                style: CustomTheme.mostviewbeds,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              )),
          onTap: () async {
            Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyDetailsScreen(id: list!.elementAt(index).id)));
          },
        );
      });
}

myBookingListWidget(List<Bookings> list, btnText,StateSetter setState,bool fromPropBooking) {
  innerMethod(context,index) async {
    if(btnText == "Cancel"){
      showLoading();
      var response=await httpPost(Config.getCancelReasons, {"userType":fromPropBooking==true?"host":"guest"});
      closeLoading();
      if(response!=null){
        CancellationReasonModel model=CancellationReasonModel.fromJson(response);
        await showModalBottomSheet(showDragHandle: true,enableDrag: true,context: context, builder: (context) {
          return CustomBottomSheet(model: model);},).then((value) async {
          if(value!=null){
            showDialog<void>(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  // title: Text('Are you sure?'.tr,style: TextStyle(color: CustomTheme.theamColor,fontSize: 16, fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.w700),),
                  content: SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Icon(Icons.error,size: 75,color: Colors.red,),
                        Text('Do you want to cancel this booking?'.tr,textAlign: TextAlign.center,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),),
                        // Text('Would you like to approve of this message?'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    Column(
                      children: [
                        Row(children: [
                          Expanded(child: InkWell(onTap: (){
                            Navigator.pop(context);
                          },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("No".tr,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),))))),
                          Expanded(child: InkWell(onTap: () async {
                            Navigator.pop(context);
                            showLoading();
                            var resp;
                            if(fromPropBooking==true){
                              resp=await httpPost(Config.cancelBookingByHost, {"booking_id":"${list[index].id}","cancellation_reasion":"$value"});
                            }else{
                              resp=await httpPost(Config.cancelBookingByUser, {"booking_id":"${list[index].id}","cancellation_reasion":"$value"});
                            }
                            closeLoading();
                            if(resp['status']==200){
                              showToastMessage(resp['message']);
                              list.removeAt(index);
                              setState((){});
                            }else{
                              showToastMessage(resp['error']);
                            }
                          },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor),color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Yes".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium,fontWeight: FontWeight.bold),))))),
                        ],),
                        SizedBox(height: 8,)
                      ],
                    )
                  ],
                );
              },
            );
          }
        });
      }
    }else if(btnText=="Add Review"){
      print(list[index].id);
      if(list[index].reviewStatus!=null && list[index].reviewStatus!= "0"){
        await showModalBottomSheet(isDismissible: true,showDragHandle: true,enableDrag: true,context: context, builder: (context) {return bottomSheetReviewed(list[index].reviewRating,list[index].review);},);
      }else{
        RxInt count=0.obs;
        textEditingControllerReview.text="";
        await showModalBottomSheet(isScrollControlled: true,showDragHandle: true,enableDrag: true,context: context, builder: (context) {
          return bottomSheetReview(list[index].id,count,fromPropBooking,list[index],setState,context);},);
      }
    }
  }
  return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyDetailsScreen(id: list.elementAt(index).itemid)));
                  },
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: Get.size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(10), // Image border
                              child: SizedBox.fromSize(
                                size:
                                    const Size.fromRadius(180), // Image radius
                                child: FadeInImage.assetNetwork(
                                  fadeInCurve: Curves.easeInCirc,
                                  placeholder:
                                      "assets/images/ezgif.com-crop.gif",
                                  height: 50,
                                  image: "${list[index].propImg}",
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/ezgif.com-crop.gif",
                                      fit: BoxFit.fill,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              top: 10,
                              right: 10,
                              child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: CustomTheme.theamColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    list[index].paymentStatus!,
                                    style: TextStyle(color: Colors.white),
                                  ))),

                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: InkWell(onTap: (){
                                Get.to(()=>ConversationScreen(propertyId: '${list[index].itemid}',bookingId: '${list[index].id}',image: list[index].propImg,title: list[index].propTitle!));
                              }, child: Container(padding: EdgeInsets.all(8), decoration: BoxDecoration(color: CustomTheme.theamColor, borderRadius: BorderRadius.circular(10)),
                                    child: Image.asset("assets/images/Send.png",color: Colors.white,)),
                              )),

                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Text.rich(TextSpan(
                                    text: "${generalDataModel!.data!.metaData!.generalDefaultCurrency} ${list[index].total}",
                                    style: const TextStyle(fontSize: 18, color: CustomTheme.theamColor, fontWeight: FontWeight.w600),
                                    children: <InlineSpan>[
                                      TextSpan(
                                        text: ' / ${list[index].totalNight} ${int.parse("${list[index].totalNight}") > 1 ? 'nights' : 'night'}',
                                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                      )
                                    ])),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(
                                    Icons.calendar_month,
                                    color: CustomTheme.theamColor,
                                    size: 15,
                                  ),
                                  Text("${list[index].checkIn}",
                                      style: CustomTheme.featuredsliderrating)
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${list[index].propTitle!.length > 40 ? list[index].propTitle!.substring(0, 39) : list[index].propTitle!}",
                                style: CustomTheme.mostviewdescription,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            children: [
                              Expanded(
                                  child: InkWell(
                                onTap: () async {
                                  innerMethod(context,index);
                                },
                                child: Container(
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      // color: btnText == "Cancel" ? RedColor:yelloColor,
                                       color: btnText=="Cancelled"?Color.fromARGB(128, 128, 128, 128): btnText == "Cancel" ? Colors.red :list[index].reviewStatus!=null && list[index].reviewStatus!= "0"?Colors.blue:CustomTheme.theamColor ,
                                        borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      // child: Text("Cancel"),
                                        child: Text(list[index].reviewStatus!=null && list[index].reviewStatus== "1" ?"View Review".tr: btnText, style: TextStyle(color: Colors.white,
                                          // color: list[index].status=="Cancelled"?Colors.black:Colors.white, 
                                        fontWeight: FontWeight.bold),
                                    )
                                    
                                    )
                                    ),
                              )),
                              SizedBox(
                                width: 16,
                              ),
                              Expanded(
                                  child: InkWell(onTap: () async {

                                    if(btnText!="Add Review" &&list[index].status=="Pending" && fromPropBooking==true){
                                      showLoading();
                                      var resp=await httpPost(Config.confirmBookingByHost, {"booking_id":"${list[index].id}"});
                                      closeLoading();
                                      if(resp['status']==200){
                                        showToastMessage(resp['message']);
                                        list[index].statusSetter="Confirmed";
                                        setState((){});

                                      }else{
                                        showToastMessage(resp['error']);
                                      }
                                    }else{
                                      Navigator.push(context, MaterialPageRoute(builder: (builder)=>EReceiptScreen(bookings:list[index],fromPropBooking: fromPropBooking,))).then((value){
                                        if(value!=null){
                                          list[index].statusSetter=value;
                                          setState((){});
                                        }
                                      });
                                    }
                                    }, child: Container(
                                    padding: EdgeInsets.all(12), decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(10)),
                                      child: Center(child: Text(btnText!="Add Review" && fromPropBooking==true &&list[index].status=="Pending"?"Confirm": "E-Reciept", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),))),
                              ))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ],
            ));
      });
}


myNetworkImage(image){
  return Image.network(image,fit: BoxFit.cover,
    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
      if (loadingProgress == null) {
        return child;
      } else {
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      }
    },
    errorBuilder: (context, exception, stackTrace) {
      return Image.asset("assets/images/ezgif.com-crop.gif",fit: BoxFit.fill,);},);
}

TextEditingController textEditingControllerReview=TextEditingController();
bottomSheetReview(id,count,bool fromPropBooking,Bookings bookings,StateSetter setState,context) {
  return Container(
    padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom),
    // height: 600,
    child: SingleChildScrollView(
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Leave a Review",
            style: TextStyle(
                fontSize: 20,
                fontFamily: FontStyles.gilroyBold,
                color: CustomTheme.theamColor),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 1,
            width: Get.size.width,
            color: greyColor,
          ),
          const SizedBox(
            height: 16,
          ),
          RatingBar.builder(
            minRating: 1,
            direction: Axis.horizontal,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: CustomTheme.theamColor,
            ),
            onRatingUpdate: (rating) {
              controller.selectedRatingValue.value=rating;
            },
          ),
          SizedBox(height: 8,),
          Obx(() => Text("Rating : ${controller.selectedRatingValue.value}",style: TextStyle(fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.bold,),)),
          const SizedBox(
            height: 16,
          ),
          Container(
            height: 1,
            width: Get.size.width,
            color: greyColor,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Container(
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(15),
                border:
                Border.all(color: const Color.fromARGB(255, 125, 123, 123)),
              ),
              child: TextFormField(
                controller: textEditingControllerReview,
                minLines: 5,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                cursorColor: notifire.getwhiteblackcolor,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none,
                  hintText: "Add Review here",
                  hintStyle: TextStyle(
                    fontFamily: FontStyles.gilroyMedium,
                    fontSize: 15,
                  ),
                ),
                onChanged: (value){
                  if(value.length> 150){
                    textEditingControllerReview.text=value.substring(0,150);
                    textEditingControllerReview.selection = TextSelection.fromPosition(TextPosition(offset: textEditingControllerReview.text.length),);
                  }
                  count.value=value.length;
                },
                style: TextStyle(
                  fontFamily: FontStyles.gilroyMedium,
                  fontSize: 16,
                  color: notifire.getwhiteblackcolor,
                ),
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end,children: [
            Obx(() => Text('${count}/150   ',style: TextStyle(fontFamily: FontStyles.gilroyMedium,),))
          ],),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {

                  controller.selectedRatingValue.value=0.0;
                  textEditingControllerReview.text="";
                  Navigator.of(context).pop();
                },
                child: Container(
                  padding:
                  const EdgeInsets.only(left: 30, right: 30, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomTheme.theamColor.withOpacity(.3)),
                  child: Text("Maybe Later".tr,
                      style: const TextStyle(
                          color: CustomTheme.theamColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
              InkWell(
                onTap: () async {
                  if(controller.selectedRatingValue.value==0.0){
                    showErrorToastMessage("Select rating");
                    return;
                  }
                  if(textEditingControllerReview.text.isEmpty){
                    showErrorToastMessage("Write Message");
                    return;
                  }

                  showLoading();
                  var response;
                  if(fromPropBooking==true){
                    response=await httpPost(Config.giveReviewByHost, {"rating":"${controller.selectedRatingValue.value.toInt()}","message":textEditingControllerReview.text,"booking_id":'$id'});
                  }else{
                    response=await httpPost(Config.giveReviewByUser, {"rating":"${controller.selectedRatingValue.value.toInt()}","message":textEditingControllerReview.text,"booking_id":'$id'});
                  }
                  closeLoading();
                  if(response!=null){
                    if(response['status']==200){
                      showToastMessage(response['message']);

                      bookings.reviewStatusSetter="1";
                      bookings.reviewRatingSetter="${controller.selectedRatingValue.value.toInt()}";
                      bookings.reviewSetter=textEditingControllerReview.text;
                      textEditingControllerReview.text="";
                      controller.selectedRatingValue.value=0.0;
                      setState((){});
                      Navigator.of(context).pop("popped");
                    }else{
                      showToastMessage(response['error']);
                    }
                  }
                },
                child: Container(
                  padding:
                  const EdgeInsets.only(left: 45, right: 45, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: CustomTheme.theamColor),
                  child: Text("Submit".tr,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            ],
          ),
          SizedBox(height: 24,)
        ],
      ),
    ),
  );
}


bottomSheetReviewed(rating,text) {
  return SingleChildScrollView(
    child: Column(
      children: [
        const Text(
          "Review by you", style: TextStyle(
              fontSize: 20,
              fontFamily: FontStyles.gilroyBold,
              color: CustomTheme.theamColor),
        ),
        const SizedBox(height: 20,),
        Container(
          height: 1,
          width: Get.size.width,
          color: greyColor,
        ),
        const SizedBox(
          height: 8,
        ),
        RatingBar.builder(
          ignoreGestures: true,
          initialRating: double.parse(rating),
          minRating: 1,
          direction: Axis.horizontal,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: CustomTheme.theamColor,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        const SizedBox(
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Text(text,style: TextStyle(fontSize: 16,fontFamily: FontStyles.gilroyMedium,),),
        ),
        const SizedBox(
          height: 50,
        ),
      ],
    ),
  );
}

showToastMessage(message) {
  var cancel = BotToast.showCustomText(
    align: Alignment(0, 0.8),
    toastBuilder: (toastBuilder) {
      return CustomToastMessage(message: "$message",);
    },
  );
}
showErrorToastMessage(message) {
  var cancel = BotToast.showCustomText(
    align: Alignment(0, 0.8),
    toastBuilder: (toastBuilder) {
      return CustomToastMessage(message: message,error: true,);
    },
  );
}

GestButton({
  String? buttontext,
  Function()? onclick,
  double? Width,
  double? height,
  Color? buttoncolor,
  EdgeInsets? margin,
  TextStyle? style,
}) {
  return GestureDetector(
    onTap: onclick,
    child: Container(
      padding: EdgeInsets.all(16),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: CustomTheme.theamColor,
        boxShadow: [
          BoxShadow(
            color: CustomTheme.theamColor,
            offset: const Offset(
              0.5,
              0.5,
            ),
            blurRadius: 1,
          ), //BoxShadow
        ],
      ),
      child: Text(buttontext!, style: style),
    ),
  );
}


dialogExit(BuildContext context){
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        // title: Text('Are you sure?'.tr,style: TextStyle(color: CustomTheme.theamColor,fontSize: 16, fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.w700),),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Icon(Icons.error,size: 75,color: Colors.red,),
              Text('Do you want to exit?'.tr,textAlign: TextAlign.center,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),),
              // Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          Column(
            children: [
              Row(children: [
                Expanded(child: InkWell(onTap: (){
                  Navigator.pop(context);
                },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Cancel".tr,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),))))),
                Expanded(child: InkWell(onTap: (){Navigator.pop(context);SystemNavigator.pop();
                },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor),color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Exit".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium,fontWeight: FontWeight.bold),))))),
              ],),
              SizedBox(height: 8,)
            ],
          )
        ],
      );
    },
  );
}