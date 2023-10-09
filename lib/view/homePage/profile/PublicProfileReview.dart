import 'package:Tukki/view/homePage/profile/PublicProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config/Api.dart';
import '../../../config/http_service.dart';
import '../../../helper/FontstyleModel.dart';
import '../../../model/GetVendorPropertyReviews.dart';
import '../../../utils/custom_theme.dart';

class PublicProfileReview extends StatefulWidget {
  String userId;
  String name;
  PublicProfileReview({super.key,required this.userId,required this.name});

  @override
  State<PublicProfileReview> createState() => _PublicProfileReviewState();
}

class _PublicProfileReviewState extends State<PublicProfileReview> {
  GetVendorPropertyReviews? getVendorPropertyReviews;
  RefreshController refreshController=RefreshController();
  List<Reviews> list=[];
  num offset=0;

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {

    httpPost(Config.getVendorPropertyReviews, {"userid":widget.userId,"offset":"$offset"}).then((response){
      if(response!=null){
        getVendorPropertyReviews=GetVendorPropertyReviews.fromJson(response);
        list.addAll(getVendorPropertyReviews!.data!.reviews!);
        offset=getVendorPropertyReviews!.data!.offset!;
        setState(() {
        });
      }
    });
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }
  onLoading(){
    getData();
  }
  onRefresh(){
    getVendorPropertyReviews=null;
    list=[];
    setState(() {});
    offset=0;
    getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: CustomTheme.theamColor,elevation: 0,title: Text("${widget.name}' Review" ),),
      body:
        SmartRefresher(controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
          child: getVendorPropertyReviews==null?Center(child: CircularProgressIndicator()):
        ListView.builder(shrinkWrap: true,itemCount: list.length,itemBuilder: (itemBuilder,index){
          return Container(margin: EdgeInsets.only(top: 8,bottom: 8,left: 16,right: 16),padding: EdgeInsets.all(16),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor,),borderRadius: BorderRadius.circular(10)),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (builder)=>PublicProfileScreen(userId: )))
                },
                  child: Row(children: [
                    SizedBox(height: 50,width: 50,child: ClipRRect(borderRadius: BorderRadius.circular(40),child: list[index].guestResponse!.guestProfile==null?Image.asset("assets/images/user.png"):Image.network(list[index].guestResponse!.guestProfile!,fit: BoxFit.cover,))),
                    SizedBox(width: 16,),
                    Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
                      Text("${list[index].guestResponse!.guestName}",style: TextStyle(fontFamily: FontStyles.gilroyMedium),),
                      RatingBar.builder(initialRating: double.parse("${list[index].guestResponse!.guestRating}"),itemSize: 20, ignoreGestures: true, direction: Axis.horizontal, itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 0), itemBuilder: (context, _) => Icon(Icons.star, color: CustomTheme.theamColor,), onRatingUpdate: (double value) {  },),
                      SizedBox(height: 5,),
                      
                       Text("${list[index].guestResponse!.guestMessage!.length>100?list[index].guestResponse!.guestMessage!.substring(0,100):list[index].guestResponse!.guestMessage}",style: TextStyle(fontFamily: FontStyles.gilroyMedium),),
               SizedBox(height: 5,),
                Text("${list[index].createdAt}",style: TextStyle(color: Colors.grey,fontFamily: FontStyles.gilroyMedium,fontSize: 12),),
                    ],),
                  ],),
                ),
                SizedBox(height: 8,),
               

                list[index].hostResponse==null || list[index].hostResponse!.hostMessage==null?SizedBox():Container(margin: EdgeInsets.only(top: 8,bottom: 8),padding: EdgeInsets.all(8),decoration: BoxDecoration(color: Colors.grey.shade100,border: Border.all(color: Colors.grey.shade300,),borderRadius: BorderRadius.circular(10)),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(children: [
                        SizedBox(height: 30,width: 30,child: ClipRRect(borderRadius: BorderRadius.circular(40),child: list[index].hostResponse!.hostProfile==null?Image.asset("assets/images/user.png"):Image.network(list[index].hostResponse!.hostProfile!,fit: BoxFit.cover,))),
                        SizedBox(width: 16,),
                        Column(mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.start,children: [
                          Text("${list[index].hostResponse!.hostName}",style: TextStyle(fontFamily: FontStyles.gilroyMedium),),
                        ],),
                      ],),
                      SizedBox(height: 8,),
                      list[index].hostResponse!.hostMessage==null?SizedBox():Text("${list[index].hostResponse!.hostMessage!.length>100?list[index].hostResponse!.hostMessage!.substring(0,100):list[index].hostResponse!.hostMessage}",style: TextStyle(fontFamily: FontStyles.gilroyMedium),),
                      Text("${list[index].createdAt}",style: TextStyle(color: Colors.grey,fontFamily: FontStyles.gilroyMedium,fontSize: 10),),


                    ],
                  ),
                )
              ],
            ),
          );
        }),)
    );
  }
}
