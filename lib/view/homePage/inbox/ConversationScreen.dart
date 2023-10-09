import 'dart:convert';
import 'dart:ffi';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/PostDatamodel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/workspace.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:http/http.dart' as http;

import '../../../model/Getmessagemodel.dart';
import 'InboxScreen.dart';

class ConversationScreen extends StatefulWidget {
  final String propertyId;
  final String bookingId;
  String title;
  String? conversationId;
  final image;
  String? from;

  ConversationScreen(
      {super.key,
      required this.propertyId,
      required this.bookingId,
      required this.title,
      required this.image,
      this.conversationId,
      this.from
      });

  @override
  State<ConversationScreen> createState() => _ConversationScreenState();
}

class ChatMessage {
  String messageContent;
  String messageType;
  String image;
  ChatMessage(
      {required this.messageContent,
      required this.messageType,
      required this.image});
}

class _ConversationScreenState extends State<ConversationScreen> {
  PostDataModel? postDataModel;
  TextEditingController textEditingControllermessage = TextEditingController();
  List list = [];
  var id;
  RefreshController refreshController = RefreshController();
  num offset = 0;
  ScrollController scrollController = ScrollController();

  onRefresh() {
    fetchData();
  }

  @override
  initState() {
    super.initState();
    isChatOpen = true;

    if (widget.conversationId != null) {
      id = widget.conversationId;
    }
    fetchData();

    FirebaseMessaging.onMessage.listen((event) {
      print(event.data.values.first);
      LatestMessage model = LatestMessage.fromJson(
          jsonDecode(event.data.values.first)['latestmessage']);
      Conversations modelConv = Conversations.fromJson(
          jsonDecode(event.data.values.first)['conversations']);
  
      print(modelConv.id);
      print(id);
    
      if (modelConv.id.toString() == id.toString()) {
        list.add(model);
      }
      setState(() {});
      scrollController.animateTo(
        scrollController.position.maxScrollExtent+100,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    print('Handling a background message ${message.data}');
  }

  fetchData() async {
    if (widget.conversationId == null) {
      var response =
          await controller.conversations(widget.propertyId, widget.bookingId);
      if (response != null) {
        if (response['status'] == 200) {
          if (response['data'] != null) {
            if (response['data']['conversation'] != null) {
              id = response['data']['conversation'];
              print("ADDDDDDDDD TRUECCCCCC $id");
            }
          }
        } else {
          showToastMessage(response['error']);
        }
      }
    }
    postDataModel = await controller.latestmessage("$id", offset);
    if (postDataModel!.data != null &&
        postDataModel!.data!.latestMessage != null) {
      for (var x in postDataModel!.data!.latestMessage!) {
        list.insert(0, x);
      }
      offset = postDataModel!.data!.offset!;
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }

    setState(() {});
  }

  Future<void> sendMsgFunction() async {
    if (textEditingControllermessage.text.isNotEmpty) {
      if (id != null) {
        Map<String, String> postData = {
          "message": textEditingControllermessage.text,
          "read_status": "1",
          "conversation_id": '$id'
        };
        httpPost(Config.Message, postData);
        list.add(LatestMessage(
            message: textEditingControllermessage.text,
            senderid: "${loginModel!.data!.id}",
            name: generalController.myName.value,
            frontImage: generalController.myImage.value));
        setState(() {});
        textEditingControllermessage.clear();
        scrollController.animateTo(
        scrollController.position.maxScrollExtent+100,
        duration: Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
      );
      }
    }
  }

  @override
  void dispose() {
    isChatOpen = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            "Live Chat".tr,
            style: TextStyle(
                color: CustomTheme.theamColor,
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        body: postDataModel == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: SizedBox(
                            height: 40,
                            width: 40,
                            child: Image.network(
                              widget.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontStyles.gilroyBold),
                            ),
                              widget.from==null?SizedBox():  Text(
                              "${widget.from}",
                              style: TextStyle(color: BlackColor, fontSize: 12),
                            ),
                              widget.bookingId==""?SizedBox():  Text(
                              "booking id: ${widget.bookingId}",
                              style: TextStyle(color: BlackColor, fontSize: 12),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 1,
                      color: CustomTheme.theamColor,
                      width: Get.size.width,
                    ),
                  ),
                  Expanded(
                    child: SmartRefresher(
                      header: ClassicHeader(
                        idleText: 'Old Message'.tr,
                        releaseText: 'Release to get Message'.tr,
                        refreshingText: 'Adding...'.tr,
                        completeText: 'Added'.tr,
                        failedText: 'Failed to Add'.tr,
                      ),
                      controller: refreshController,
                      enablePullDown: offset == -1 ? false : true,
                      onRefresh: onRefresh,
                      child: ListView.builder(controller: scrollController,
                        // reverse: true,
                        itemCount: list.length,
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10, bottom: 10),
                        // physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Column(
                                children: [
                                  index != 0 &&
                                          list[index - 1].senderid !=
                                              "${loginModel!.data!.id}" &&
                                          list[index].senderid !=
                                              "${loginModel!.data!.id}"
                                      ? SizedBox()
                                      : index != 0 &&
                                              list[index - 1].senderid ==
                                                  "${loginModel!.data!.id}" &&
                                              list[index].senderid ==
                                                  "${loginModel!.data!.id}"
                                          ? SizedBox()
                                          : Container(
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10, right: 10),
                                                child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                    child: SizedBox(
                                                        height: 40,
                                                        width: 40,
                                                        child: Image.network(
                                                          list[index]
                                                              .frontImage!,
                                                          fit: BoxFit.fill,
                                                          loadingBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  Widget child,
                                                                  ImageChunkEvent?
                                                                      loadingProgress) {
                                                            if (loadingProgress ==
                                                                null) {
                                                              return child;
                                                            } else {
                                                              return Center(
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  value: loadingProgress
                                                                              .expectedTotalBytes !=
                                                                          null
                                                                      ? loadingProgress
                                                                              .cumulativeBytesLoaded /
                                                                          (loadingProgress.expectedTotalBytes ??
                                                                              1)
                                                                      : null,
                                                                ),
                                                              );
                                                            }
                                                          },
                                                          errorBuilder:
                                                              (context,
                                                                  exception,
                                                                  stackTrace) {
                                                            return Container(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(8),
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                    color: Colors
                                                                        .black),
                                                                child:
                                                                    Image.asset(
                                                                  "assets/images/user.png",
                                                                  fit: BoxFit
                                                                      .fill,
                                                                  color: Colors
                                                                      .white,
                                                                ));
                                                          },
                                                        ))),
                                              ),
                                              alignment: (list[index]
                                                          .senderid !=
                                                      "${loginModel!.data!.id}"
                                                  ? Alignment.topLeft
                                                  : Alignment.topRight),
                                            ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 14, right: 14, top: 4, bottom: 4),
                                    child: Align(
                                      alignment: (list[index].senderid !=
                                              "${loginModel!.data!.id}"
                                          ? Alignment.topLeft
                                          : Alignment.topRight),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: (list[index].senderid !=
                                                  "${loginModel!.data!.id}"
                                              ? Colors.grey.shade300
                                              : CustomTheme.theamColor),
                                        ),
                                        padding: EdgeInsets.all(12),
                                        child: Text(
                                          '${list[index].message}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: list[index].senderid !=
                                                    "${loginModel!.data!.id}"
                                                ? BlackColor
                                                : WhiteColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                      // height: 60,
                      color: Colors.white,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: Get.width / 1.4,
                            padding: EdgeInsets.only(left: 16, right: 16),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: TextFormField(
                              minLines: 1,
                              maxLines: 8,
                              controller: textEditingControllermessage,
                              decoration: InputDecoration(
                                  hintText: "Message...".tr,
                                  border: InputBorder.none
                                  // enabledBorder: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //         width: 2, color: CustomTheme.theamColor),
                                  //     borderRadius: BorderRadius.circular(10)),
                                  // focusedBorder: OutlineInputBorder(
                                  //     borderSide: BorderSide(
                                  //         width: 2, color: CustomTheme.theamColor),
                                  //     borderRadius: BorderRadius.circular(10)),
                                  ),
                            ),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          InkWell(
                            onTap: () async {
                              sendMsgFunction();
                        
                            },
                            child: Container(
                              height: 50,
                              width: 50,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: CustomTheme.theamColor,
                                ),
                                child: Icon(
                                  Icons.send,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ));
  }
}
