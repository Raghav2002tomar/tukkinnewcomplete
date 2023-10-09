import 'dart:io';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/PropertyDetailsModel.dart';
import 'package:Tukki/model/StaticModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/addproperty/PropertyReviewScreen.dart';
import 'package:Tukki/view/booking/BookRealEstateScreen.dart';
import 'package:Tukki/view/homePage/explore/fullMapScreen.dart';
import 'package:Tukki/view/homePage/inbox/ConversationScreen.dart';
import 'package:Tukki/view/homePage/profile/PublicProfileScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:webviewx/webviewx.dart';
import 'package:flutter_svg/flutter_svg.dart';


class PropertyDetailsScreen extends StatefulWidget {
  final dynamic id;

  const PropertyDetailsScreen({super.key, required this.id});

  @override
  State<PropertyDetailsScreen> createState() => PropertyDetailsState();
}

class PropertyDetailsState extends State<PropertyDetailsScreen> {
  bool isExpanded = false;
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  final ValueNotifier<bool> isExpand = ValueNotifier<bool>(false);
  final ValueNotifier<bool> isExpandedHouse = ValueNotifier<bool>(false);
  final PageController _pagereviewController = PageController();
  PageController _pageControllerslider = PageController();
  final ValueNotifier<int> _currentPageSliderNotifier = ValueNotifier<int>(0);

  PropertyDetailsModel? propertyDetailsModel;
  bool houseRuleLoading = false;
  bool cancellationLoading = false;
  late GoogleMapController mapController;
  List imageList=[];

  @override
  void initState() {
    super.initState();
    _pageControllerslider = PageController();
    _pageControllerslider.addListener(() {
      if (_pageControllerslider.page != null) {
        _currentPageSliderNotifier.value = _pageControllerslider.page!.round();
      }
    });
    getData();
  }

  getData() async {
    var response = await httpPost(Config.getPropertyDetails, {"property_id": "${widget.id}"});
    if (response != null) {
      propertyDetailsModel = PropertyDetailsModel.fromJson(response);
      imageList.addAll(propertyDetailsModel!.data!.propertyDetails!.galleryImageUrls!);
      imageList.insert(0,propertyDetailsModel!.data!.propertyDetails!.frontImageUrl!);
    }
    setState(() {});
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _zoomIn() {
    mapController.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }

  void _zoomOut() {
    mapController.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }

  @override
  void dispose() {
    _pagereviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      body: propertyDetailsModel == null
          ? const Center(
              child: CircularProgressIndicator(),
            ) :

      Stack(children: [
              NestedScrollView(
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      snap: false,
                      automaticallyImplyLeading: false,
                      onStretchTrigger: ()async{
                        print("hello");
                    },
                      expandedHeight: 300,
                      floating: false,
                      pinned: true,
                      backgroundColor: Colors.white,
                      // leading: InkWell(
                      //   onTap: () {
                      //     Get.back();
                      //   },
                      // ),
                      flexibleSpace: FlexibleSpaceBar(
                        background:
                        Stack(
                          alignment:
                              Alignment.bottomCenter, // Align to the bottom
                          children: [
                            PageView.builder(
                              controller:
                                  _pageControllerslider, // Add the controller here
                              scrollDirection: Axis.horizontal,
                              itemCount: imageList.length,
                              itemBuilder: (context, index) {
                                return FadeInImage.assetNetwork(
                                  fadeInCurve: Curves.easeInCirc,
                                  placeholder:
                                      "assets/images/ezgif.com-crop.gif",
                                  height: 50,
                                  image: imageList.elementAt(index) ?? "",
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                            ValueListenableBuilder<int>(
                              valueListenable: _currentPageSliderNotifier,
                              builder: (context, value, child) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(
                                        imageList.length, (index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
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
                      ),
                    ),
                  ];
                },
                body: SingleChildScrollView(
                  child:
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child:
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          propertyDetailsModel!.data!.propertyDetails!.title ??
                              "",
                          maxLines: 3,
                          style: const TextStyle(
                              fontSize: 20,
                              fontFamily: FontStyles.gilroyMedium,
                              fontWeight: FontWeight.w800,
                              color: CustomTheme.theamColor),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Text(
                              "Property type: ${propertyDetailsModel!.data!.propertyDetails!.propertyType ?? ""}".tr,
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Location: '.tr,
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(141, 66, 66, 66),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: propertyDetailsModel
                                        ?.data?.propertyDetails?.address ??
                                    '${propertyDetailsModel?.data?.propertyDetails?.city}, ${propertyDetailsModel?.data?.propertyDetails?.stateRegion}',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(141, 66, 66, 66),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                          color: CustomTheme.theamColor,
                          thickness: 1,
                        ),

                        InkWell(
                          onTap: (){
                            // Get.to(()=>PublicProfileScreen(userId: "4",));
                            Get.to(()=>PublicProfileScreen(userId: propertyDetailsModel!.data!.propertyDetails!.hostId!.toString(),));

                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(40),
                                child: propertyDetailsModel!.data!.propertyDetails!.hostProfileImage!=null?Image.network(
                                  "${propertyDetailsModel!.data!.propertyDetails!.hostProfileImage}",
                                  height: 50,
                                ):Icon(Icons.account_circle_rounded,size: 40,),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hosted By ${propertyDetailsModel!.data!.propertyDetails!.hostFirstName} ".tr,
                                    style: const TextStyle(
                                        fontFamily: FontStyles.gilroyMedium,
                                        color: CustomTheme.theamColor,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1),
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/images/RIcon.svg'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${propertyDetailsModel!.data!.propertyDetails!.beds ?? ""} Beds",
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Row(
                                children: [
                                    SvgPicture.asset('assets/images/2 User.svg',color: CustomTheme.theamColor,),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                   Text('${propertyDetailsModel!.data!.propertyDetails!.personAllowed} Guest')
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.50,
                              child: Row(
                                children: [
                                   SvgPicture.asset('assets/images/Bathroom.svg'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${propertyDetailsModel!.data!.propertyDetails!.bathroom ?? ""} Bathroom",
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.40,
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/images/SQFT.svg'),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "${propertyDetailsModel!.data!.propertyDetails!.propertySqft ?? ""} m2",
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: CustomTheme.theamColor,
                          thickness: 1,
                        ),

                        const Text('Preferred Check-in',
                            style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,
                                color: CustomTheme.theamColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1)),
                        SizedBox(
                          height: 8,
                        ),
                         Text('Check In : Flexible'.tr),
                        const SizedBox(
                          height: 16,
                        ),
                        Divider(
                          color: CustomTheme.theamColor,
                          thickness: 1,
                        ),

                        Text('About the Place'.tr,
                            style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,
                                color: CustomTheme.theamColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1)),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          propertyDetailsModel!
                                  .data!.propertyDetails!.description ??
                              "",
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: CustomTheme.theamColor,
                          thickness: 1,
                        ),
                        Text('Min / Max Night'.tr,
                            style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,
                                color: CustomTheme.theamColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1)),
                        SizedBox(
                          height: 5,
                        ),
                        Text('1 Min Night'.tr),

                        const SizedBox(
                          height: 8,
                        ),
                        Divider(
                          color: CustomTheme.theamColor,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text('Amenities'.tr, style: TextStyle(fontFamily: FontStyles.gilroyMedium,
                                color: CustomTheme.theamColor,
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1)),
                        SizedBox(height: 8,),
                        Wrap(runSpacing: 16,children: [
                          for(var x in propertyDetailsModel!.data!.propertyDetails!.amenities!)
                            SizedBox(width: MediaQuery.of(context).size.width/2.5,
                              child: Row(children: [
                                ClipRRect(borderRadius: BorderRadius.circular(15), child: SizedBox(height: 20,width: 20,child: myNetworkImage("${x.imageUrl}"),)),
                                SizedBox(width: 8,),
                                Text(x.name!, style: const TextStyle(fontSize: 14, fontFamily: FontStyles.gilroyBold,),),

                              ],),
                            )
                        ],),
                        SizedBox(height: 8,),
                        const Divider(color: CustomTheme.theamColor, thickness: 1,),

                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                             Row(
                              children: [
                                Text('You will be here'.tr, style: TextStyle(fontFamily: FontStyles.gilroyMedium, color: CustomTheme.theamColor, fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1)),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Stack(
                              children: [
                                SizedBox(
                                  height: 300,
                                  child: GoogleMap(scrollGesturesEnabled: true,rotateGesturesEnabled: true,zoomControlsEnabled: true,zoomGesturesEnabled: true,compassEnabled: true,
                                    onMapCreated: _onMapCreated,markers: {Marker(markerId: MarkerId("1"), position: LatLng(double.parse(propertyDetailsModel!.data!.propertyDetails!.latitude!), double.parse(propertyDetailsModel!.data!.propertyDetails!.longitude!)))},
                                      initialCameraPosition: CameraPosition(target: LatLng(double.parse(propertyDetailsModel!.data!.propertyDetails!.latitude!), double.parse(propertyDetailsModel!.data!.propertyDetails!.longitude!)), zoom: 14)),
                                ),
                                Platform.isAndroid?SizedBox(): Positioned(top: 58,right: 16,child: Material(elevation: 2,borderRadius: BorderRadius.circular(8),child: InkWell(onTap: (){
                                  _zoomOut();
                                },child: Container(padding: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child: Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),))))),
                                Platform.isAndroid?SizedBox(): Positioned(top: 16,right: 16,child: Material(elevation: 2,borderRadius: BorderRadius.circular(8),child: InkWell(onTap: (){
                                  _zoomIn();
                                },child: Container(padding: EdgeInsets.only(left: 6,right: 6,top: 1,bottom: 1),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child: Icon(Icons.add))))),
                                Positioned(top: 16,left: 16,child: Material(elevation: 2,borderRadius: BorderRadius.circular(8),child: InkWell(onTap: (){

                                  Get.to(()=>FullMapScreen(latitude: propertyDetailsModel!.data!.propertyDetails!.latitude!,longitude: propertyDetailsModel!.data!.propertyDetails!.longitude!,));
                                },child: Container(padding: EdgeInsets.only(left: 6,right: 6,top: 4,bottom: 4),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child: Icon(Icons.fullscreen,size: 30,))))),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Divider(
                          color: CustomTheme.theamColor,
                          thickness: 1,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/Rating.png',
                                  height: 20,
                                ),
                                Text(
                                    '/ Review (${propertyDetailsModel!.data!.propertyDetails!.totalReviews ?? "No review Here"}'.tr,
                                    style: const TextStyle(
                                        fontFamily: FontStyles.gilroyMedium,
                                        color: CustomTheme.theamColor,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: 1)),
                                const Spacer(),
                                propertyDetailsModel!
                                        .data!.propertyDetails!.reviews!.isEmpty
                                    ? SizedBox()
                                    : TextButton(
                                        onPressed: () {
                                          Get.to(()=>PropertyReviewScreen(id: propertyDetailsModel!.data!.propertyDetails!.propertyId.toString()));
                                        },
                                        child:  Text('See all'.tr)),
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),

                            //
                            propertyDetailsModel!
                                    .data!.propertyDetails!.reviews!.isEmpty
                                ? SizedBox()
                                : SizedBox(
                                    // color: RedColor,
                                    height: 100,
                                    child: PageView.builder(
                                      controller: _pagereviewController,
                                      onPageChanged: (index) {
                                        _currentPageNotifier.value = index;
                                      },
                                      itemCount: propertyDetailsModel!.data!
                                          .propertyDetails!.reviews!.length,
                                      physics: const BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        return Row(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(borderRadius: BorderRadius.circular(50), child: SizedBox(height: 55,width: 55,child: myNetworkImage(propertyDetailsModel!.data!.propertyDetails!.reviews![index].guestProfileImage)),),
                                            SizedBox(width: 16,),
                                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(propertyDetailsModel!.data!.propertyDetails!.reviews![index].guestName!, style: const TextStyle(fontFamily: FontStyles.gilroyMedium, color: CustomTheme.theamColor, fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1),),
                                                SizedBox(height: 4,),
                                                RatingBar.builder(initialRating: double.parse("${propertyDetailsModel!.data!.propertyDetails!.reviews![_currentPageNotifier.value].rating}"),itemSize: 20, ignoreGestures: true, direction: Axis.horizontal, itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 0), itemBuilder: (context, _) => Icon(Icons.star, color: CustomTheme.theamColor,), onRatingUpdate: (double value) {  },),
                                                propertyDetailsModel!.data!.propertyDetails!.reviews![index].message==null?SizedBox():Container(margin: EdgeInsets.only(top: 4),child: Text("${propertyDetailsModel!.data!.propertyDetails!.reviews![index].message!.length>32?propertyDetailsModel!.data!.propertyDetails!.reviews![index].message!.substring(0,32)+"...":propertyDetailsModel!.data!.propertyDetails!.reviews![index].message!}", style: const TextStyle( fontWeight: FontWeight.w600),)),
                                                SizedBox(height: 4,),
                                                Text("${propertyDetailsModel!.data!.propertyDetails!.reviews![index].updatedAt}", style: TextStyle(color: greyColor),),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                            ValueListenableBuilder<int>(
                              valueListenable: _currentPageNotifier,
                              builder: (context, value, child) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    propertyDetailsModel!
                                        .data!
                                        .propertyDetails!
                                        .reviews!
                                        .length, // Same as itemCount in PageView
                                    (index) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 2.0),
                                        width: 8.0,
                                        height: 8.0,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: value == index
                                              ? CustomTheme.theamColor
                                              : Colors.grey,
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            ),
                            SizedBox(
                              height: propertyDetailsModel!
                                      .data!.propertyDetails!.reviews!.isEmpty
                                  ? 0
                                  : 16,
                            ),
                            Divider(
                              color: CustomTheme.theamColor,
                              thickness: 1,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'House Rules'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      houseRuleLoading = true;
                                      setState(() {});
                                      var response = await httpPost(
                                          Config.staticPage, {"id": "3"});
                                      houseRuleLoading = false;
                                      setState(() {});
                                      if (response != null) {
                                        StaticModel staticModel =
                                            StaticModel.fromJson(response);
                                        webBottomModel(context, "House Rules".tr,
                                            staticModel);
                                      }
                                    },
                                    child: houseRuleLoading
                                        ? SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CircularProgressIndicator())
                                        :  Text(
                                            "Read".tr,
                                            style: TextStyle(
                                                color: CustomTheme.theamColor,
                                                fontSize: 15),
                                          ))
                              ],
                            ),
                            Divider(
                              color: CustomTheme.theamColor,
                              thickness: 1,
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                                  'Cancellation Policy'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                TextButton(
                                    onPressed: () async {
                                      cancelletionBottom(context, propertyDetailsModel!.data!.propertyDetails!.cancellationReason!);
                                      // cancellationLoading = true;
                                      // setState(() {});
                                      // var response = await httpPost(
                                      //     Config.staticPage, {"id": "6"});
                                      // cancellationLoading = false;
                                      // setState(() {});
                                      // if (response != null) {
                                      //   StaticModel staticModel =
                                      //       StaticModel.fromJson(response);
                                      //   webBottomModel(context,
                                      //       "Cancellation Policy", staticModel);
                                      // }
                                    },
                                    child: cancellationLoading
                                        ? SizedBox(
                                            height: 25,
                                            width: 25,
                                            child: CircularProgressIndicator())
                                        : Text(
                                            "Flexible".tr,
                                            style: TextStyle(
                                                color: CustomTheme.theamColor,
                                                fontSize: 15),
                                          ))
                              ],
                            ),

                            Divider(
                              color: CustomTheme.theamColor,
                              thickness: 1,
                            ),
                            propertyDetailsModel!.data!.propertyDetails!.hostId==loginModel!.data!.id.toString()?SizedBox(): Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                               Text(
                                  'Contact Host'.tr,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Container(padding: EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 4),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor,width: 2),borderRadius: BorderRadius.circular(10)),
                                  child: InkWell(onTap: (){
                                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>ConversationScreen(propertyId: propertyDetailsModel!.data!.propertyDetails!.propertyId!.toString(), bookingId: "",image: propertyDetailsModel!.data!.propertyDetails!.frontImageUrl, title: propertyDetailsModel!.data!.propertyDetails!.title!)));
                                  },
                                    child: Row(mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text('Message'.tr,style: TextStyle(color: CustomTheme.theamColor,fontWeight: FontWeight.bold)),
                                        SizedBox(width: 8,),
                                        Icon(Icons.send,color: CustomTheme.theamColor,)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            propertyDetailsModel!.data!.propertyDetails!.hostId==loginModel!.data!.id.toString()?SizedBox(): Container(
                              margin: EdgeInsets.only(top: 8),
                              color: CustomTheme.theamColor,
                              height: 1,
                            ),
                            Container(
                              height: 80,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Get.back();
                  },
                ),
                top: 38, // Adjust the position as needed
                left: 9, // Adjust the position as needed
              ),
              Positioned(
                child: Text(propertyDetailsModel!.data!.propertyDetails!.title!.length>30?propertyDetailsModel!.data!.propertyDetails!.title!.substring(0,30):propertyDetailsModel!.data!.propertyDetails!.title!,style: TextStyle(fontFamily:FontStyles.gilroyMedium,fontSize: 20)),
                top: 50, // Adjust the position as needed
                left: 90, // Adjust the position as needed
              ),
            ]),
      bottomSheet: propertyDetailsModel == null
          ? SizedBox()
          : Material(
              elevation: 10,
              child: Container(
                padding: EdgeInsets.all(16),
                height: 80,
                color: Colors.grey.shade200, // Adjust the height as needed

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${propertyDetailsModel!.data!.propertyDetails!.price} ', style: CustomTheme.mostviewtitle),
                         Text('/night'.tr, style: TextStyle(fontSize: 15, color: CustomTheme.theamColor)),
                      ],),
                    propertyDetailsModel!.data!.propertyDetails!.hostId==loginModel!.data!.id.toString()?SizedBox():
                    propertyDetailsModel!.data!.propertyDetails!.availableDates!.isEmpty?SizedBox():
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookRealEstate(
                                        idFeatured: propertyDetailsModel!
                                            .data!.propertyDetails!.propertyId,
                                        propertyDetails: propertyDetailsModel!
                                            .data!.propertyDetails!,
                                      )));
                        },
                        child: Container(
                          padding: EdgeInsets.only(
                              left: 32, right: 32, top: 16, bottom: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: CustomTheme.theamColor),
                          child: Text("Book".tr,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16)),
                        )),
                  ],
                ),
              ),
            ),
    );
  }

  webBottomModel(BuildContext context, string, StaticModel staticModel) async {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                // height:
                //     500, // Set a specific height or use `double.infinity` for full height
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          textAlign: TextAlign.justify,
                          "$string",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      WebViewX(
                          width: Get.width,
                          height: Get.height,
                          initialSourceType: SourceType.html,
                          initialContent:
                              staticModel.data!.staticPage!.content!.tr),
                    ],
                  ),
                )),
          ),
        );
      },
    );
  }
  cancelletionBottom(BuildContext context, value) async {
    showModalBottomSheet(
      showDragHandle: true,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
                // height:
                //     500, // Set a specific height or use `double.infinity` for full height
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left:16.0,right: 16,bottom: 16),
                    child: Column(
                      children: [
                      
                        Container(
                          child: Text(
                            textAlign: TextAlign.justify,
                            "${value['title']}",
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        
                        Container(
                          child: Text(
                            textAlign: TextAlign.justify,
                            "${value['description']}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                    
                      ],
                    ),
                  ),
                )),
          ),
        );
      },
    );
  }
}
