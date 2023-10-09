import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/UserThreadmodel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/profile/ticket/CreateTicketScreen.dart';
import 'package:Tukki/view/homePage/profile/ticket/TicketReplyScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class OpenTicketScreen extends StatefulWidget {
  OpenTicketScreen({super.key});

  @override
  State<OpenTicketScreen> createState() => _OpenTicketState();
}

class _OpenTicketState extends State<OpenTicketScreen> {
  UserThreadModel? userThreadmodel;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getdata();
  }

  getdata() async {
    userThreadmodel = await controller.getUserOpenTicket();

    setState(() {
      refreshController.refreshCompleted();
    });
  }

  onLoading() {}
  onRefresh() {
    userThreadmodel = null;
    setState(() {});
    getdata();
  }

  stateSetter(fn) => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        enablePullUp: false,
        child: userThreadmodel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : userThreadmodel!.data!.threads!.isEmpty
                ? Center(
                    child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("You don't have any Ticket!".tr,
                          style: TextStyle(
                              color: CustomTheme.theamColor,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "Create a new Ticket.".tr,
                        style: TextStyle(
                            color: CustomTheme.theamColor, fontSize: 16),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CreateTicket()))
                                .then((value) {
                              if (value != null) {
                                userThreadmodel = null;
                                setState(() {});
                                getdata();
                              }
                            });
                          },
                          child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  color: CustomTheme.theamColor,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(
                                "New Ticket".tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ))),
                    ],
                  ))
                : ListView.builder(
                    itemCount: userThreadmodel!.data!.threads!.length,
                    itemBuilder: ((context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TicketReplyScreen(
                                  thread:
                                      userThreadmodel!.data!.threads![index],
                                ),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "${userThreadmodel!.data!.threads![index].title!.tr.length > 20 ? userThreadmodel!.data!.threads![index].title!.tr.substring(0, 19) : userThreadmodel!.data!.threads![index].title!.tr} #${userThreadmodel!.data!.threads![index].threadId}",
                                              style: CustomTheme
                                                  .InboxScreenchatname,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              userThreadmodel!
                                                  .data!
                                                  .threads![index]
                                                  .description!,
                                              style: CustomTheme
                                                  .InboxScreenDescription,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Text(
                                            '${DateFormat('hh:mm a').format(DateTime.parse(userThreadmodel!.data!.threads![index].updatedAt!))}',style: TextStyle(fontSize: 11),),
                                        SizedBox(
                                          height: 2,
                                        ),
                                       Text(
                                              '${DateFormat('yy-MM-dd').format(DateTime.parse(userThreadmodel!.data!.threads![index].updatedAt!))}',
                                              style: TextStyle(fontSize: 11),
                                            ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  height: 1,
                                  color: CustomTheme.theamColor,
                                  width: Get.size.width,
                                ),
                                SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
      ),
      bottomNavigationBar: userThreadmodel == null
          ? SizedBox()
          : userThreadmodel!.data!.threads!.isEmpty
              ? SizedBox()
              : Padding(
                  padding:
                      const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                  child: SizedBox(
                    height: 50,
                    child: GestButton(
                      Width: Get.size.width,
                      height: 50,
                      buttoncolor: blueColor,
                      margin: EdgeInsets.only(top: 15, left: 35, right: 35),
                      buttontext: "New Ticket".tr,
                      style: TextStyle(
                        fontFamily: FontStyles.gilroyBold,
                        color: WhiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      onclick: () {
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreateTicket()))
                            .then((value) {
                          if (value != null) {
                            userThreadmodel = null;
                            setState(() {});
                            getdata();
                          }
                        });
                      },
                    ),
                  ),
                ),
    );
  }
}
