import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/VendorWallet.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/homePage/profile/PayoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../model/GetVendorWalletTransactions.dart';
import '../../../utils/ProjectColors.dart';
import '../../../workspace.dart';
import 'package:get/get.dart';

class FinancialReportScreen extends StatefulWidget {
  const FinancialReportScreen({super.key});

  @override
  State<FinancialReportScreen> createState() => _FinancialReportScreenState();
}

class _FinancialReportScreenState extends State<FinancialReportScreen> {


  VendorWallet? vendorWallet;
  GetVendorWalletTransactions? getVendorWalletTransactions;
  List<WalletTransactionsDetails> list=[];
  RefreshController refreshController=RefreshController();
  num offset=0;
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    httpPost(Config.getVendorWallet, {}).then((response) {
      if(response!=null){
        vendorWallet=VendorWallet.fromJson(response);
        setState(() {
        });
      }
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    });

    httpPost(Config.getVendorWalletTransactions, {"offset":"$offset"}).then((response) {
      if(response!=null){
        getVendorWalletTransactions=GetVendorWalletTransactions.fromJson(response);
        list.addAll(getVendorWalletTransactions!.data!.walletTransactionsDetails!);
        offset=getVendorWalletTransactions!.data!.offset!;
        setState(() {
        });
      }
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    });

  }

  onLoading(){
    getData();
  }
  onRefresh(){
    getVendorWalletTransactions=null;
    vendorWallet=null;
    list=[];
    setState(() {});
    offset=0;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: CustomTheme.theamColor,elevation: 0,title: Text("Financial Report",style: TextStyle(color: Colors.white),),centerTitle: true,),
      body:
        SmartRefresher(controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
        child: vendorWallet==null?Center(child: CircularProgressIndicator()):SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              Container(padding: EdgeInsets.all(24),decoration: BoxDecoration(color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Wallet Balance".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium),),
                  ],
                ),
                SizedBox(height: 8,),
                Icon(Icons.wallet,color: Colors.white,size: 40,),
                SizedBox(height: 8,),
                Text("${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${vendorWallet!.data!.walletBalance!}",style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyExtraBold,fontSize: 24),),
                SizedBox(height: 8,),
                InkWell(onTap: (){
                  Get.to(()=>PayoutScreen(walletBalance: vendorWallet!.data!.walletBalance!,));
                },
                  child: Container(padding: EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Payout".tr,style: TextStyle(color: Colors.black,fontFamily: FontStyles.gilroyMedium,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                )

              ],),),
              SizedBox(height: 16,),

              Container(padding: EdgeInsets.all(24),decoration: BoxDecoration(color: Colors.cyan.shade400,borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(generalDataModel!.data!.metaData!.generalDefaultCurrency!+" "+vendorWallet!.data!.pendingToWithdrawl!,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyBold,fontSize: 16),),
                        SizedBox(height: 8,),
                        Text("Pending Withdraw".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium),),
                      ],
                    ),
                    Icon(Icons.money_outlined)
                  ],
                ),
              ],),),
              SizedBox(height: 16,),

              Container(padding: EdgeInsets.all(24),decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(generalDataModel!.data!.metaData!.generalDefaultCurrency!+" "+vendorWallet!.data!.totalWithdrawled!,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyBold,fontSize: 16),),
                        SizedBox(height: 8,),
                        Text("Total Withdrawal Amount".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium),),
                      ],
                    ),
                    Icon(Icons.money_outlined)
                  ],
                ),
              ],),),
              SizedBox(height: 16,),

              Container(padding: EdgeInsets.all(24),decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(generalDataModel!.data!.metaData!.generalDefaultCurrency!+" "+vendorWallet!.data!.totalEarning!,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyBold,fontSize: 16),),
                        SizedBox(height: 8,),
                        Text("Total Earnings".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium),),
                      ],
                    ),
                    Icon(Icons.money_outlined)
                  ],
                ),
              ],),),
              SizedBox(height: 16,),

              Container(padding: EdgeInsets.all(24),decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(10),),child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(generalDataModel!.data!.metaData!.generalDefaultCurrency!+" "+vendorWallet!.data!.refunded!,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyBold,fontSize: 16),),
                        SizedBox(height: 8,),
                        Text("Total Refund".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium),),
                      ],
                    ),
                    Icon(Icons.money_outlined)
                  ],
                ),
              ],),),


              SizedBox(height: 24,),
              Row(
                children: [
                  SizedBox(width: 8,),
                  Text("Transactions".tr,style: TextStyle(fontFamily: FontStyles.gilroyBold,fontSize: 20),),
                ],
              ),

              getVendorWalletTransactions==null?Center(child: CircularProgressIndicator(),):
              list.isEmpty?Center(child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("No Transaction Availble".tr),
              ),):
              ListView.builder(physics: NeverScrollableScrollPhysics(),itemCount: list.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
                return Container(margin: EdgeInsets.only(top: 16),
                  decoration: BoxDecoration(
                    color: notifire.getblackwhitecolor,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: greyColor),
                  ),
                  // height: 60,
                  child: ListTile(
                    leading: Icon(
                      Icons.wallet,
                      size: 30,
                      color: BlackColor,
                    ),
                    title: Text(
                      list.elementAt(index).description!,
                      style: TextStyle(
                          fontSize: 16, fontFamily: FontStyles.gilroyBold),
                    ),

                    subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4,),
                        Text(
                          list.elementAt(index).type!,
                          style: TextStyle( color:list[index].type=="debit"?Colors.red:Colors.green,
                              fontSize: 16, fontFamily: FontStyles.gilroyMedium),
                        ),

                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          list.elementAt(index).createdAt!,
                          style: TextStyle(
                              fontSize: 16, fontFamily: FontStyles.gilroyMedium),
                        ),
                      ],
                    ),
                    trailing: Text(
                      generalDataModel!.data!.metaData!.generalDefaultCurrency!+"\n"+list.elementAt(index).amount!,textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16, fontFamily: FontStyles.gilroyBold, color:list.elementAt(index).type=="credit"?Colors.green: RedColor),
                    ),

                  ),
                );
              },)

            ],),
          ),
        ),)
    );
  }
}
