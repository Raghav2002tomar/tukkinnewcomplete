import 'dart:convert';

import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/Getmessagemodel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:Tukki/view/homePage/inbox/ConversationScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

bool isInboxOpen=false;
bool isChatOpen=false;
class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {

  GetMessageModel? getMessageModel;
  List<Conversations> list=[];
  RefreshController refreshController=RefreshController();
  num offset=0;

  @override
  void initState() {
    super.initState();
    isInboxOpen=true;
    fetchData();

    FirebaseMessaging.onMessage.listen((event) {
      messagingFunction(event);
    });
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }
  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Background Message INBOXXXX");
    print('Handling a background message INBOXXX ${message.data}');
    // messagingFunction(event);
  }
  messagingFunction(event){
    Conversations model=Conversations.fromJson(jsonDecode(event.data.values.first)['conversations']);
    if(list.any((element) => element.id==model.id)){
      for(int i=0;i<list.length;i++){
        if(list[i].id==model.id){
          list.removeAt(i);
          list.insert(0, model);
        }
      }
    }else{
      list.insert(0, model);
    }
    setState(() {
    });
  }

  fetchData() async {
    var response = await httpPost(Config.getmessages, {});
    if (response != null) {
      getMessageModel= GetMessageModel.fromJson(response);
      if(getMessageModel!=null && getMessageModel!.data!=null){
        list.addAll(getMessageModel!.data!.conversations!);

        offset=getMessageModel!.data!.offset!;
      }
    }
    refreshController.loadComplete();
    refreshController.refreshCompleted();
    setState(() {});
  }

  onLoading(){
    fetchData();
  }
  onRefresh(){
    getMessageModel=null;
    list=[];
    setState(() {});
    offset=0;
    fetchData();
  }


  @override
  void dispose() {
    isInboxOpen=false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: ()async{
      generalController.tabController.index=0;
      generalController.currentIndex.value=0;
      return false;
    },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: notifire.getbgcolor,
          elevation: 0,
          leading: InkWell(
              onTap: () {
                generalController.currentIndex.value = 4;
                generalController.tabController.index = 4;
              },
              child: Icon(
                Icons.arrow_back,
                color: BlackColor,
              )),
          title: Text(
            "Inbox".tr,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: FontStyles.gilroyBold,
              color: CustomTheme.theamColor,
            ),
          ),
        ),
        body: getMessageModel == null
            ? Center(child: CircularProgressIndicator(),)
            : list.isEmpty?Center(child: buildNoDataWidget(context, "No data found".tr),):
        SmartRefresher(
          controller: refreshController,
          enablePullUp: offset==-1?false:true,
          onRefresh: onRefresh, onLoading: onLoading,

          child: ListView.builder(
                  itemCount: list.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        list[index].readSetter=1;
                        setState(() {
                        });
                      
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ConversationScreen(propertyId: "${list[index].propertyId}",bookingId: "",title: list[index].propertyTitle!, image: list[index].frontImage!,conversationId: list[index].id.toString(),from: list[index].latestMessage,)));
                        bool contains=false;
                        for(int i=0;i<list.length;i++){
                          if(list[index].readStatus==0){
                            contains=true;
                            break;
                          }
                        }
                        if(contains==false){
                          generalController.msgUpdater.value=false;
                        }
                        
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
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
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(50),
                                    child: SizedBox(
                                        height: 50,
                                        width: 50,
                                        child: myNetworkImage(list[index].frontImage.toString()))),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(list[index].propertyTitle!.tr.length > 20 ? list.elementAt(index).propertyTitle!.tr.substring(0, 21) : list.elementAt(index).propertyTitle!.tr, style: CustomTheme.InboxScreenchatname,),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          child: Text("${list[index].latestMessage!.length>30?list[index].latestMessage!.substring(0,30):list[index].latestMessage}",
                                        
                                            style: CustomTheme.InboxScreenDescription,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  children: [
                                    list[index].readStatus==0?Container(height: 10,width: 10,decoration: BoxDecoration(color: RedColor,borderRadius: BorderRadius.circular(20)),):Text(""),
                                    SizedBox(height: 8,),
                                    Text("${list[index].lastMessageAt}",textAlign: TextAlign.center,style: TextStyle(fontSize: 10),),
                                    
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
                    );
                  })),
        ),
      ),
    );
  }
}
