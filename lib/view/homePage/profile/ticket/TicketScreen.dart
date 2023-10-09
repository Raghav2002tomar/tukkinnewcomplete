import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/UserThreadmodel.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/profile/ticket/CloseTicketScreen.dart';
import 'package:Tukki/view/homePage/profile/ticket/CreateTicketScreen.dart';
import 'package:Tukki/view/homePage/profile/ticket/OpenTicketScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int index = 0;

  List list = [
    OpenTicketScreen(),
    CloseTicketScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(initialIndex: 0, vsync: this, length: 2);
    tabController!.addListener(() {
      index = tabController!.index;
      setState(() {});
    });
  }
  stateSetter(fn) => setState(() {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: notifire.getbgcolor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            color: notifire.getwhiteblackcolor,
          ),
        ),
        title: Text(
          'Ticket'.tr,
          style: TextStyle(
              fontSize: 22,
              fontFamily: FontStyles.gilroyMedium,
              fontWeight: FontWeight.w700,
              color: CustomTheme.theamColor),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateTicket()))
                    .then((value) {
                });
              },
              child: Image.asset('assets/images/Plus.png'))
        ],
      ),
      body: SafeArea(
          child: Column(children: <Widget>[
            TabBar(
              controller: tabController,
              labelColor: CustomTheme.theamColor,
              labelStyle: TextStyle(
                  fontSize: 18,
                  fontFamily: FontStyles.gilroyMedium,
                  fontWeight: FontWeight.w700),
              unselectedLabelColor: Colors.grey,

              tabs:  [
                Tab(
                  text: 'Open'.tr,
                ),
                Tab(
                  text: 'Closed'.tr,
                ),
              ], // list of tabs
            ),
            SizedBox(
              height: 8,
            ),
            Expanded(child: list[index]),
          ])),
    );
  }
}
