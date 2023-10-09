import 'dart:math';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/ReplyThredModel.dart';
import 'package:Tukki/model/UserThreadmodel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/Text.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TicketReplyScreen extends StatefulWidget {
  final Threads thread;
  TicketReplyScreen({super.key, required this.thread});

  @override
  State<TicketReplyScreen> createState() => _TicketReplyScreenState();
}

class _TicketReplyScreenState extends State<TicketReplyScreen> {
  TextEditingController textEditingControllerreply = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ReplyThreadsModel? replyThreads;
  List<ReplyThreadsData> list = [];
  bool newMesage = true;
  RefreshController refreshController = RefreshController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  getdata() async {
    Map<String, String> postData = {
      "thread_id": widget.thread.threadId.toString()
    };
    var response = await httpPost(Config.getReplyThreads, postData);
    replyThreads = ReplyThreadsModel.fromJson(response);
    list = replyThreads!.data!.replyThreadsData!;

    setState(() {});
  }

//  getUsercloseTicket(thread_id) async {
//      Map<String, String> postData = {"thread_status": widget.thread.threadId.toString()};
//     var response = await httpPost(Config.getUserThreads, postData);
//     if (response != null) {
//       return UserThreadModel.fromJson(response);
//     }
//   }
  replySupportTicket(thread_id, message) async {
    Map<String, String> postData = {
      "thread_id": widget.thread.threadId.toString(),
      "message": textEditingControllerreply.text
    };
    var response = await httpPost(Config.replyToSupportTicket, postData);

    ReplyThreadsData replyThreadsData =
        ReplyThreadsData.fromJson(response['data']['reply']);
    list.add(replyThreadsData);
    setState(() {
      
    });

    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: const Duration(microseconds: 1),
          curve: Curves.fastOutSlowIn);
      textEditingControllerreply.clear();
    });
  }

  onLoading() {}

  onRefresh() {
    replyThreads = null;

    setState(() {
      refreshController.refreshCompleted();
    });
    getdata();
  }

  stateSetter(fn) => setState(() {});
  @override
  Widget build(BuildContext context) {
    print(widget.thread.threadStatus);
    print("=======");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
          "${"Reply on "} #${widget.thread.threadId.toString()}",
          style: TextStyle(
              fontSize: 18,
              color: CustomTheme.theamColor,
              fontWeight: FontWeight.w700,
              fontFamily: FontStyles.gilroyMedium),
        ),
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: onRefresh,
        onLoading: onLoading,
        enablePullUp: false,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, anim1, anim2) {
                          return FadeTransition(
                            opacity: anim1,
                            child: AlertDialog(
                              content: Container(
                                width: Get.size.width * 0.8,
                                height: Get.size.height *
                                    0.5, // 80% of screen width
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Reply",
                                        style: TextStyle(
                                            color: CustomTheme.theamColor,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: notifire.getblackwhitecolor,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all(
                                              color: const Color.fromARGB(
                                                  255, 125, 123, 123)),
                                        ),
                                        child: Form(
                                          key:
                                              _formKey, // You'll need to define this GlobalKey<FormState> formKey = GlobalKey<FormState>();
                                          child: TextFormField(
                                            controller:
                                                textEditingControllerreply,
                                            minLines: 10,
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                            maxLength:
                                                150, // this makes sure the field doesn't accept more than 150 chars
                                            cursorColor:
                                                notifire.getwhiteblackcolor,
                                            decoration:  InputDecoration(
                                              contentPadding:
                                                  EdgeInsets.all(10),
                                              focusedBorder: InputBorder.none,
                                              border: InputBorder.none,
                                              hintText: "Reply",
                                              hintStyle: TextStyle(
                                                fontFamily:
                                                    FontStyles.gilroyMedium,
                                                fontSize: 15,
                                              ),
                                              counterText:
                                                  "", // to hide the counter, remove if you want to show it
                                            ),
                                            style: TextStyle(
                                              fontFamily:
                                                  FontStyles.gilroyMedium,
                                              fontSize: 16,
                                              color:
                                                  notifire.getwhiteblackcolor,
                                            ),
                                            validator: (value) {
                                              if (value!.length > 150) {
                                                return 'Please enter 150 characters or less.';
                                              }
                                              return null;
                                            },
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      GestButton(
                                        Width: Get.size.width,
                                        height: 50,
                                        buttoncolor: blueColor,
                                        margin: const EdgeInsets.only(
                                            top: 15, left: 30, right: 30),
                                        buttontext: "Reply Ticket",
                                        style: TextStyle(
                                          fontFamily: FontStyles.gilroyBold,
                                          color: WhiteColor,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        onclick: () async {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            replySupportTicket(
                                                widget.thread.id,
                                                textEditingControllerreply
                                                    .text);
                                            Navigator.of(context).pop();
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        barrierDismissible: true,
                        barrierLabel: "Dismiss",
                        transitionDuration: Duration(milliseconds: 400),
                        barrierColor: Colors.black.withOpacity(0.7),
                        transitionBuilder: (context, anim1, anim2, child) {
                          return Transform.scale(
                            scale: anim1.value,
                            child: Opacity(opacity: anim1.value, child: child),
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(
                              left: 8, right: 8, top: 4, bottom: 4),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: CustomTheme.theamColor, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Reply',
                                  style: TextStyle(
                                      color: CustomTheme.theamColor,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(
                                Icons.reply_outlined,
                                color: CustomTheme.theamColor,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 200,
                        ),
                        widget.thread.threadStatus == '0'
                            ? SizedBox()
                            : Switch(
                                // This bool value toggles the switch.
                                value: newMesage,
                                activeColor: CustomTheme.theamColor,
                                onChanged: (bool value) async {
                                  print("tyuio");

                                  Map<String, String> postData = {
                                    "thread_id":
                                        widget.thread.threadId.toString(),
                                  };
                                  var response = await httpPost(
                                      Config.closeSupportTicket, postData);
                                  print(response);

                                  print("fyhdusik----");

                                  // This is called when the user toggles the switch.
                                  setState(() {
                                    newMesage = value;
                                  });
                                },
                              ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                decoration: BoxDecoration(
                  boxShadow: kElevationToShadow[4],
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                ),
                width: Get.size.width,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " #${widget.thread.threadId.toString()}",
                            style: TextStyle(
                                fontSize: 18,
                                color: CustomTheme.theamColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontStyles.gilroyMedium),
                          ),
                          widget.thread.threadStatus == '0'
                              ? Text('Close',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: FontStyles.gilroyMedium))
                              : Text('Active',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.green,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: FontStyles.gilroyMedium))
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          Text(
                            " ${widget.thread.title.toString()}",
                            style: TextStyle(
                                fontSize: 18,
                                color: CustomTheme.theamColor,
                                fontWeight: FontWeight.w700,
                                fontFamily: FontStyles.gilroyMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(
                            " ${widget.thread.description.toString()}",
                            style: TextStyle(
                                fontSize: 16,
                                // color: CustomTheme.theamColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: FontStyles.gilroyMedium),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Divider(
                        height: 15,
                        color: greyColor,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: replyThreads == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      ):list.isEmpty?Center(child: buildNoDataWidget(context ,"No Reply Available."),)
                    : ListView.builder(
                        controller: _scrollController,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: list.length,
                        itemBuilder: ((context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  boxShadow: kElevationToShadow[4],
                                  color: list[index].isAdminReply != "0"
                                      ? Colors.white
                                      : CustomTheme
                                          .theamColor, // changed this line to modify the background color
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.transparent,
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        list[index].message.toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                list[index].isAdminReply != "0"
                                                    ? BlackColor
                                                    : WhiteColor,
                                            fontWeight: FontWeight.w400,
                                            letterSpacing: 1),
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          list[index].isAdminReply != "0"
                                              ? Text(
                                                  "Tukki Admin",
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                )
                                              : Text(
                                                  "You",
                                                  style:
                                                      TextStyle(fontSize: 11),
                                                ),
                                          Column(
                                            children: [
                                              Text(
                                                '${DateFormat('hh:mm a').format(DateTime.parse("${list[index].createdAt}"))}',
                                                style: TextStyle(fontSize: 11),
                                              ),
                                               SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                '${DateFormat('yy-MM-dd').format(DateTime.parse("${list[index].createdAt}"))}',
                                                style: TextStyle(fontSize: 11),
                                              ),
                                             
                                              
                                            ],
                                          ),
                                        ],
                                      ),

                                      //
                                      // ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 16,
                              )
                            ],
                          );
                        })),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ReplyBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: notifire.getblackwhitecolor,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: greyColor),
          ),
          height: Get.size.height,
          width: Get.size.height,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                        color: const Color.fromARGB(255, 125, 123, 123)),
                  ),
                  child: TextFormField(
                    controller: textEditingControllerreply,
                    minLines: 10,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    cursorColor: notifire.getwhiteblackcolor,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                      hintText: "Reply",
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
                ),
                const SizedBox(
                  height: 30,
                ),
                GestButton(
                  Width: Get.size.width,
                  height: 50,
                  buttoncolor: blueColor,
                  margin:  EdgeInsets.only(top: 15, left: 30, right: 30),
                  buttontext: "Reply Ticket",
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyBold,
                    color: WhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  onclick: () async {
                    replySupportTicket(
                        widget.thread.id, textEditingControllerreply.text);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
