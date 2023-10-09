import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/PayoutModel.dart';
import 'package:Tukki/model/PayoutTransaction.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/Api.dart';

class PayoutScreen extends StatefulWidget {
  String walletBalance;
  PayoutScreen({super.key,required this.walletBalance});

  @override
  State<PayoutScreen> createState() => _PayoutScreenState();
}

const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
String dropdownValue = list.first;

class _PayoutScreenState extends State<PayoutScreen> {

  GlobalKey<FormState> globalKey=GlobalKey();
  num offset=0;
  RefreshController refreshController=RefreshController();
  PayoutTransaction? payoutTransaction;
  TextEditingController textEditingController=TextEditingController();
  List<PayoutTransactions> list=[];

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var ress=await httpPost(Config.getPayoutTransactions, {"offset":"$offset"});
    if(ress!=null){
      payoutTransaction=PayoutTransaction.fromJson(ress);
      list.addAll(payoutTransaction!.data!.payoutTransactions!);
      offset=payoutTransaction!.data!.offset!;

    }
    setState(() {});
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  onLoading(){
    getData();
  }
  onRefresh(){
    payoutTransaction=null;
    list=[];
    setState(() {});
    offset=0;
    getData();
  }
  
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
          "Payout".tr,
          style: TextStyle(
            fontSize: 17,
            fontFamily: FontStyles.gilroyBold,
            color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      body:
          SmartRefresher(
            controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: Get.height * 0.28,
                          width: Get.size.width,
                          alignment: Alignment.topLeft,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/payout_orange.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 30),
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 15),
                                child: Text(
                                  "Payout".tr,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 22,
                                    fontFamily: FontStyles.gilroyBold,
                                    color: WhiteColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 40),
                              Padding(
                                padding: const EdgeInsets.only(top: 10, left: 15),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 15),
                                child: Text(
                                  "${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${widget.walletBalance}",
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontFamily: FontStyles.gilroyBold,
                                    color: WhiteColor,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 0, left: 15),
                                child: Text(
                                  "Your Total Earning".tr,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: FontStyles.gilroyBold,
                                    color: WhiteColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Text(
                          "History".tr,
                          style: TextStyle(
                            fontSize: 17,
                            color: notifire.getwhiteblackcolor,
                            fontFamily: FontStyles.gilroyMedium,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        payoutTransaction==null?Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: CircularProgressIndicator()),):
                        list.isEmpty?Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(child: Text("No data found".tr)),
                        ):
                        ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount:list.length,itemBuilder: (itemBuilder,index){
                          return Container(margin: EdgeInsets.only(top: 8),
                            decoration: BoxDecoration(
                              color: notifire.getblackwhitecolor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: greyColor),),
                            height: 60,
                            width: Get.size.width,
                            child: ListTile(
                              leading: Icon(
                                Icons.wallet,
                                size: 30,
                                color: BlackColor,
                              ),
                              title: Column(
                                children: [
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                       list[index].createdAt!,
                                        style: TextStyle(
                                            fontSize: 16, fontFamily: FontStyles.gilroyBold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                       list[index].payoutStatus!,
                                        style: TextStyle(color:list[index].payoutStatus=="Pending"?Colors.red:Colors.green,
                                            fontSize: 16, fontFamily: FontStyles.gilroyMedium),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Text(
                                "${list[index].currency} ${list[index].amount}",
                                style: TextStyle(
                                    fontSize: 16, fontFamily: FontStyles.gilroyBold, color:list[index].payoutStatus=="Pending"?Colors.red:Colors.green),
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 50,
          child: GestButton(
            Width: Get.size.width,
            height: 50,
            buttoncolor: blueColor,
            margin: EdgeInsets.only(top: 15, left: 35, right: 35),
            buttontext: "Payout".tr,
            style: TextStyle(
              fontFamily: FontStyles.gilroyBold,
              color: WhiteColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            onclick: () {
              // textEditingController.text=widget.walletBalance;
              payoutBottomSheet();
            },
          ),
        ),
      ),
    );
  }

  payoutBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: SizedBox(
            height: 600,
            child: Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  'Payment Request'.tr,
                  style:
                  TextStyle(fontFamily: FontStyles.gilroyBold, fontSize: 20),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Minimum amount: 10".tr,
                  style: TextStyle(
                      fontFamily: FontStyles.gilroyMedium, fontSize: 16),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(width: MediaQuery.of(context).size.width/1.1,
                  child: Form(
                    key: globalKey,
                    child: TextFormField(
                      controller: textEditingController,

                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: notifire.getgreycolor),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: notifire.getgreycolor),
                        ),
                        hintText: "Amount".tr,
                        hintStyle: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Enter Amount";
                        }else
                        if(double.parse(value.replaceAll(",", ""))>double.parse(widget.walletBalance.replaceAll(",", ""))){
                          return "Max Amount Exceeded";
                        }else
                        if(double.parse(value.replaceAll(",", ""))<10){
                          return "Minimum Amount is 10";
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(children: [
                    Expanded(
                      child: InkWell(onTap: () async {
                        Navigator.pop(context);
                      },child: Container(padding: EdgeInsets.all(16),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: CustomTheme.theamColor.withOpacity(.2)),child: Center(child: Text("Cancel",style: TextStyle(color: CustomTheme.theamColor,fontWeight: FontWeight.bold),)))),
                    ),
                    SizedBox(width: 24,),
                    Expanded(
                      child: InkWell(onTap: () async {
                        if(!globalKey.currentState!.validate()){
                          return;
                        }
                        showLoading();
                        var response=await httpPost(Config.insertPayout, {"amount":textEditingController.text,"currency":"${generalDataModel!.data!.metaData!.generalDefaultCurrency!}"});
                        textEditingController.text="";
                        closeLoading();
                        if(response!=null){
                          PayoutModel model=PayoutModel.fromJson(response);
                          if(model.status==200){
                            showToastMessage(model.message);
                            Navigator.pop(context);
                            payoutTransaction=null;
                            offset=0;
                            list=[];
                            setState(() {
                            });
                            getData();
                          }else{
                            showErrorToastMessage(model.error);
                          }
                        }
                      },child: Container(padding: EdgeInsets.all(16),decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: CustomTheme.theamColor),child: Center(child: Text("Proceed",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)))),
                    )
                  ],),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  
}
