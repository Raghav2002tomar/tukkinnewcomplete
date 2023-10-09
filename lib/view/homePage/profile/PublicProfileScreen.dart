import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/GetUserProfile.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../customWidgets/customWidget.dart';
import '../../../model/GetUserProperties.dart';
import '../../../model/GetVendorPropertyReviews.dart';
import '../../../model/PropertyModel.dart';
import '../../../utils/DarkMode.dart';
import '../../../workspace.dart';
import '../explore/SeeAllProperties.dart';
import 'PublicProfileReview.dart';

class PublicProfileScreen extends StatefulWidget {
  String userId;
  PublicProfileScreen({super.key, required this.userId});

  @override
  State<PublicProfileScreen> createState() => _PublicProfileScreenState();
}

class _PublicProfileScreenState extends State<PublicProfileScreen> {
  GetUserProfile? getUserProfile;
  GetVendorPropertyReviews? getVendorPropertyReviews;
  // GetUserProperties? getUserProperties;
  PropertyModel? getUserProperties;
  int pageValue = 0;
  stateSetter(fn) => setState(() {});
  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    httpPost(Config.getUserProfile, {"userid": widget.userId}).then((response) {
      if (response != null) {
        getUserProfile = GetUserProfile.fromJson(response);
        setState(() {});
      }
    });
    httpPost(Config.getVendorPropertyReviews, {"userid": widget.userId})
        .then((response) {
      if (response != null) {
        getVendorPropertyReviews = GetVendorPropertyReviews.fromJson(response);
        setState(() {});
      }
    });

    httpPost(Config.getUserProperties, {"userid": widget.userId})
        .then((response) {
      if (response != null) {
        // getUserProperties=GetUserProperties.fromJson(response);
        getUserProperties = PropertyModel.fromJson(response);
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      body: getUserProfile == null
          ? Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  primary: true,
                  pinned: false,
                  backgroundColor: Colors.white,
                  expandedHeight: MediaQuery.of(context).size.height * 0.32,
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    background: Container(
                      // decoration: BoxDecoration(border: Border.all(color: Colors.green)),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                colorFilter: new ColorFilter.mode(
                                    Colors.grey.withOpacity(0.5),
                                    BlendMode.dstATop),
                                alignment: Alignment.topCenter,
                                image: getUserProfile!
                                            .data!.profileBackground ==
                                        null
                                    ? NetworkImage(
                                        "https://img3.wallspic.com/previews/7/1/1/7/0/107117/107117-design-sky-white-line-550x310.jpg"
                                        "")
                                    : NetworkImage(getUserProfile!
                                        .data!.profileBackground!),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 16.0, right: 16),
                              child: Container(
                                height: 20,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 48,
                                ),
                                Stack(
                                  children: [
                                    Material(
                                        elevation: 5,
                                        borderRadius: BorderRadius.circular(50),
                                        child: SizedBox(
                                            height: 100,
                                            width: 100,
                                            child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: getUserProfile!.data!
                                                            .profileImage ==
                                                        null
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(16.0),
                                                        child: Image.asset(
                                                          "assets/images/user.png",
                                                        ),
                                                      )
                                                    : Image.network(
                                                        getUserProfile!.data!
                                                            .profileImage!,
                                                        fit: BoxFit.cover,
                                                      )))),
                                    Positioned(
                                        bottom: 0,
                                        right: 0,
                                        child: Container(
                                            padding: EdgeInsets.all(4),
                                            decoration: BoxDecoration(
                                              color: CustomTheme.theamColor,
                                              borderRadius:
                                                  BorderRadius.circular(40),
                                            ),
                                            child: Icon(
                                              Icons.privacy_tip,
                                              color: Colors.white,
                                            )))
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  getUserProfile!.data!.name!,
                                  style: TextStyle(
                                      color: CustomTheme.theamColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: FontStyles.gilroyExtraBold),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16.0, right: 16),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Text(
                                            getUserProfile!
                                                .data!.totalReviewsOnProperties!
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontFamily:
                                                    FontStyles.gilroyBold),
                                          ),
                                          Text("Reviews".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      FontStyles.gilroyMedium)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            getUserProfile!
                                                .data!.totalReviewsOnProperties!
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontFamily:
                                                    FontStyles.gilroyBold),
                                          ),
                                          Text("Rating".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      FontStyles.gilroyMedium)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            getUserProfile!
                                                .data!.yearsOfHosting!
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                fontFamily:
                                                    FontStyles.gilroyBold),
                                          ),
                                          Text("Hosting".tr,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily:
                                                      FontStyles.gilroyMedium)),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Stack(
                    children: [
                      // Container(
                      //   // height: 700,
                      //   decoration: BoxDecoration(
                      //     color: Colors.grey.shade300,
                      //   ),
                      //   child: Center(
                      //     // child: Text("body"),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16),
                        child: Container(
                          // height: 700,
                          padding:
                              EdgeInsets.only(left: 16, right: 16, bottom: 16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  "Hi, I'm Gabriel, I live in Kuala Lumpur, Malaysia. I have some properties here. I'm happy to help you find a comfortable place to stay, don't hesitate to contact me!".tr),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle_rounded,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    getUserProfile!.data!.age!.toString(),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.language,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Speak " .tr+
                                        getUserProfile!.data!.languages!
                                            .toString(),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_history,
                                    size: 30,
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Text(
                                    "Live in " .tr+
                                        getUserProfile!.data!.livecity!
                                            .toString(),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Divider(
                                thickness: 1,
                                color: CustomTheme.theamColor,
                              ),
                              SizedBox(
                                height: 8,
                              ),

                              getVendorPropertyReviews == null
                                  ? Center(
                                      child: Padding(
                                      padding: const EdgeInsets.all(50),
                                      child: CircularProgressIndicator(),
                                    ))
                                  : Container(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "What guest are saying about\n${getUserProfile!.data!.name!}".tr,
                                            style: TextStyle(
                                                color: CustomTheme.theamColor,
                                                fontFamily:
                                                    FontStyles.gilroyBlack,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          getVendorPropertyReviews!
                                                  .data!.reviews!.isEmpty
                                              ? Center(
                                                  child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      16.0),
                                                  child: Text(
                                                      "No Review Available".tr),
                                                ))
                                              : SizedBox(
                                                  height: 150,
                                                  child: PageView.builder(
                                                      onPageChanged: (value) {
                                                        print(value);
                                                        pageValue = value;
                                                        setState(() {});
                                                      },
                                                      pageSnapping: true,
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      itemCount:
                                                          getVendorPropertyReviews!
                                                              .data!
                                                              .reviews!
                                                              .length,
                                                      itemBuilder:
                                                          (itemBuilder, index) {
                                                        return Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  right: 8),
                                                          padding:
                                                              EdgeInsets.all(
                                                                  16),
                                                          decoration:
                                                              BoxDecoration(
                                                                  border: Border
                                                                      .all(
                                                                    color: CustomTheme
                                                                        .theamColor,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10)),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          50,
                                                                      width: 50,
                                                                      child: ClipRRect(
                                                                          borderRadius: BorderRadius.circular(40),
                                                                          child: getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestProfile == null
                                                                              ? Image.asset("assets/images/user.png")
                                                                              : Image.network(
                                                                                  getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestProfile!,
                                                                                  fit: BoxFit.cover,
                                                                                ))),
                                                                  SizedBox(
                                                                    width: 16,
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        "${getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestName}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                FontStyles.gilroyMedium),
                                                                      ),
                                                                      RatingBar
                                                                          .builder(
                                                                        initialRating:
                                                                            double.parse("${getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestRating}"),
                                                                        itemSize:
                                                                            20,
                                                                        ignoreGestures:
                                                                            true,
                                                                        direction:
                                                                            Axis.horizontal,
                                                                        itemCount:
                                                                            5,
                                                                        itemPadding:
                                                                            EdgeInsets.symmetric(horizontal: 0),
                                                                        itemBuilder:
                                                                            (context, _) =>
                                                                                Icon(
                                                                          Icons
                                                                              .star,
                                                                          color:
                                                                              CustomTheme.theamColor,
                                                                        ),
                                                                        onRatingUpdate:
                                                                            (double
                                                                                value) {},
                                                                      ),
                                                                      SizedBox(height: 5,),
                                                                      Text(
                                                                        "${getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestMessage!.length > 100 ? getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestMessage!.substring(0, 100) : getVendorPropertyReviews!.data!.reviews![index].guestResponse!.guestMessage}",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                FontStyles.gilroyMedium),
                                                                      ),
                                                                      SizedBox(height: 5,),
                                                                      Text(
                                                                        "${getVendorPropertyReviews!.data!.reviews![index].createdAt}",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.grey,
                                                                            fontFamily: FontStyles.gilroyMedium),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 8,
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      }),
                                                ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          getVendorPropertyReviews!
                                                  .data!.reviews!.isEmpty
                                              ? SizedBox()
                                              : Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Wrap(
                                                      children: [
                                                        for (var x
                                                            in getVendorPropertyReviews!
                                                                .data!.reviews!)
                                                          Container(
                                                            height: 8,
                                                            width: 8,
                                                            margin:
                                                                EdgeInsets.only(
                                                                    left: 8),
                                                            decoration: BoxDecoration(
                                                                color: getVendorPropertyReviews!.data!.reviews![
                                                                            pageValue] ==
                                                                        x
                                                                    ? CustomTheme
                                                                        .theamColor
                                                                    : Colors
                                                                        .grey,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20)),
                                                          )
                                                      ],
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          Get.to(() =>
                                                              PublicProfileReview(
                                                                userId: widget
                                                                    .userId,
                                                                name:
                                                                    getUserProfile!
                                                                        .data!
                                                                        .name!,
                                                              ));
                                                        },
                                                        child: Text(
                                                          "View All Review".tr,
                                                          style: TextStyle(
                                                              color: CustomTheme
                                                                  .theamColor,
                                                              fontFamily: FontStyles
                                                                  .gilroyMedium,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline),
                                                        ))
                                                  ],
                                                ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: CustomTheme.theamColor,
                                          ),
                                          Text(
                                            "${getUserProfile!.data!.name!} Verification".tr,
                                            style: TextStyle(
                                                color: CustomTheme.theamColor,
                                                fontFamily:
                                                    FontStyles.gilroyBlack,
                                                fontSize: 18),
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.account_circle_rounded,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(getUserProfile!.data!
                                                          .verifiedIdentity ==
                                                      "0"
                                                  ? "Identity not verified ".tr
                                                  : "Verified Identity ".tr)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.email,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(getUserProfile!.data!
                                                          .verifiedEmail ==
                                                      "0"
                                                  ? "Email not verified ".tr
                                                  : "Verified Email ".tr)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 8,
                                              ),
                                              Icon(
                                                Icons.phone_android,
                                              ),
                                              SizedBox(
                                                width: 16,
                                              ),
                                              Text(
                                                getUserProfile!.data!
                                                            .verifiedPhone ==
                                                        "0"
                                                    ? "Phone not verified ".tr
                                                    : "Verified Phone ".tr,
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                          Divider(
                                            thickness: 1,
                                            color: CustomTheme.theamColor,
                                          ),
                                          SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    "${getUserProfile!.data!.name!} Listing".tr,
                                    style: TextStyle(
                                        color: CustomTheme.theamColor,
                                        fontFamily: FontStyles.gilroyBlack,
                                        fontSize: 18),
                                  )),
                                  InkWell(
                                      onTap: () {
                                        Get.to(() => SeeAllPropertiesScreen(
                                              title:
                                                  getUserProfile!.data!.name! +
                                                      " Listing".tr,
                                              locationId: "-1",
                                              userId: widget.userId,
                                            ));
                                      },
                                      child: Text(
                                        "View All Listing".tr,
                                        style: TextStyle(
                                            color: CustomTheme.theamColor,
                                            fontFamily: FontStyles.gilroyMedium,
                                            decoration:
                                                TextDecoration.underline),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              getUserProperties == null
                                  ? Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(50.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                    )
                                  : getUserProperties!.data!.properties!.isEmpty
                                      ? Center(
                                          child: Text("No Listing Availbale".tr))
                                      : myListHorizontal(
                                          getUserProperties!.data!.properties!,
                                          (fn) {},
                                          notifire),
                              SizedBox(
                                height: 8,
                              ),
                              // getUserProperties==null?SizedBox():getUserProperties!.data!.properties!.isEmpty?SizedBox():Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Wrap(children: [
                              //       for(var x in getUserProperties!.data!.properties!)
                              //         Container(height: 8,width: 8,margin: EdgeInsets.only(left: 8),decoration: BoxDecoration(color: getUserProperties!.data!.properties![pageValue]==x?CustomTheme.theamColor: Colors.grey,borderRadius: BorderRadius.circular(20)),)
                              //     ],),
                              //
                              //     InkWell(onTap: (){
                              //       Get.to(()=>SeeAllPropertiesScreen(title: getUserProfile!.data!.name!+" Listing",locationId: "-1",userId: widget.userId,));
                              //     },child: Text("View All Listing",style: TextStyle(color: CustomTheme.theamColor,fontFamily: FontStyles.gilroyMedium,decoration: TextDecoration.underline),)),
                              //   ],
                              // ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
