import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
          ),
        ),
        title: Text(
          "Wallet".tr,
          style: TextStyle(
            fontSize: 17,
            fontFamily: FontStyles.gilroyBold,
            color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      // body: SizedBox(
      //   height: Get.size.height,
      //   width: Get.size.width,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       GetBuilder<HomePageController>(builder: (context){
      //         return GetBuilder<WalletController>(builder: (controller) {
      //           return Container(
      //             height: Get.height * 0.28,
      //             width: Get.size.width,
      //             margin: EdgeInsets.only(left: 15, top: 15, right: 15),
      //             alignment: Alignment.topLeft,
      //             child: Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 SizedBox(height: 30),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 0, left: 15),
      //                   child: Text(
      //                     "Wallet".tr,
      //                     textAlign: TextAlign.start,
      //                     style: TextStyle(
      //                       fontSize: 22,
      //                       fontFamily: FontStyles.gilroyBold,
      //                       color: WhiteColor,
      //                     ),
      //                   ),
      //                 ),
      //                 SizedBox(height: 40),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 10, left: 15),
      //                   child: Text(
      //                     "${generalDataModel!.data!.metaData!.generalDefaultCurrency}${walletController.walletInfo?.wallet}",
      //                     textAlign: TextAlign.start,
      //                     style: TextStyle(
      //                       fontSize: 45,
      //                       fontFamily: FontStyles.gilroyBold,
      //                       color: WhiteColor,
      //                     ),
      //                   ),
      //                 ),
      //                 Padding(
      //                   padding: const EdgeInsets.only(top: 0, left: 15),
      //                   child: Text(
      //                     "Your current Balance".tr,
      //                     style: TextStyle(
      //                       fontSize: 20,
      //                       fontFamily: FontStyles.gilroyBold,
      //                       color: WhiteColor,
      //                     ),
      //                   ),
      //                 ),
      //               ],
      //             ),
      //             decoration: BoxDecoration(
      //               image: DecorationImage(
      //                 image: AssetImage("assets/images/walletIMage.png"),
      //                 fit: BoxFit.fill,
      //               ),
      //             ),
      //           );
      //         },);
      //       },),
      //         Padding(
      //         padding: const EdgeInsets.only(top: 10, left: 25),
      //         child: Text(
      //           "History".tr,
      //           style: TextStyle(
      //             fontSize: 17,
      //             color: notifire.getwhiteblackcolor,
      //             fontFamily: FontStyles.gilroyMedium,
      //           ),
      //         ),
      //       ),
      //       Expanded(
      //         child: GetBuilder<WalletController>(builder: (context) {
      //           return walletController.isLoading
      //               ? walletController.walletInfo!.walletitem.isNotEmpty
      //                   ? ListView.builder(
      //                       itemCount:
      //                           walletController.walletInfo?.walletitem.length,
      //                       itemBuilder: (context, index) {
      //                         return Container(
      //                           margin: EdgeInsets.all(10),
      //                           child: ListTile(
      //                             leading: Container(
      //                               height: 70,
      //                               width: 60,
      //                               padding: EdgeInsets.all(12),
      //                               child: Image.asset(
      //                                 "assets/images/Wallet.png",
      //                                 color: blueColor,
      //                               ),
      //                               decoration: BoxDecoration(
      //                                 borderRadius: BorderRadius.circular(10),
      //                                 color: Color(0xFFf6f7f9),
      //                               ),
      //                             ),
      //                             title: Text(
      //                               walletController.walletInfo
      //                                       ?.walletitem[index].tdate ??
      //                                   "",
      //                               maxLines: 1,
      //                               style: TextStyle(
      //                                 color: notifire.getwhiteblackcolor,
      //                                 fontFamily: FontStyles.gilroyBold,
      //                                 // fontSize: 16,
      //                                 overflow: TextOverflow.ellipsis,
      //                               ),
      //                             ),
      //                             subtitle: Text(
      //                               walletController.walletInfo
      //                                       ?.walletitem[index].status ??
      //                                   "",
      //                               maxLines: 1,
      //                               style: TextStyle(
      //                                 color: notifire.getwhiteblackcolor,
      //                                 fontFamily: FontStyles.gilroyMedium,
      //                                 overflow: TextOverflow.ellipsis,
      //                               ),
      //                             ),
      //                             trailing: walletController.walletInfo
      //                                         ?.walletitem[index].status ==
      //                                     "Credit"
      //                                 ? TextButton(
      //                                     onPressed: () {},
      //                                     child: Text(
      //                                         "${walletController.walletInfo?.walletitem[index].amt ?? ""}${generalDataModel!.data!.metaData!.generalDefaultCurrency} +"),
      //                                   )
      //                                 : TextButton(
      //                                     onPressed: () {},
      //                                     child: Text(
      //                                       "${walletController.walletInfo?.walletitem[index].amt ?? ""}${generalDataModel!.data!.metaData!.generalDefaultCurrency} -",
      //                                       style: TextStyle(
      //                                         color: Colors.orange.shade300,
      //                                       ),
      //                                     ),
      //                                   ),
      //                           ),
      //                           decoration: BoxDecoration(
      //                             border:
      //                                 Border.all(color: Colors.grey.shade200),
      //                             borderRadius: BorderRadius.circular(20),
      //                           ),
      //                         );
      //                       },
      //                     )
      //                   : Center(
      //                       child: Column(
      //                         mainAxisAlignment: MainAxisAlignment.center,
      //                         children: [
      //                           Padding(
      //                             padding: const EdgeInsets.only(left: 30),
      //                             child: Image.asset(
      //                               "assets/images/bookingEmpty.png",
      //                               height: 110,
      //                               width: 100,
      //                             ),
      //                           ),
      //                           SizedBox(
      //                             height: 20,
      //                           ),
      //                           Text(
      //                             "Go & Add your Amount".tr,
      //                             style: TextStyle(
      //                               color: notifire.getgreycolor,
      //                               fontFamily: FontStyles.gilroyBold,
      //                             ),
      //                           )
      //                         ],
      //                       ),
      //                     )
      //               : Center(
      //                   child: CircularProgressIndicator(),
      //                 );
      //         }),
      //       ),
      //       GestButton(
      //         Width: Get.size.width,
      //         height: 50,
      //         buttoncolor: blueColor,
      //         margin: EdgeInsets.only(top: 15, left: 35, right: 35),
      //         buttontext: "ADD AMOUNT".tr,
      //         style: TextStyle(
      //           fontFamily: FontStyles.gilroyBold,
      //           color: WhiteColor,
      //           fontSize: 16,
      //           fontWeight: FontWeight.bold,
      //         ),
      //         onclick: () {
      //           // Get.toNamed(Routes.addWalletScreen);
      //           Navigator.push(context, MaterialPageRoute(builder: (context)=>AddWalletScreen()));
      //         },
      //       ),
      //       SizedBox(
      //         height: 20,
      //       ),
      //
      //     ],
      //   ),
      // ),
    );
  }
}