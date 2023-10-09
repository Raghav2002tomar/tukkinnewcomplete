import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/PropertyReviewsModel.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../helper/FontstyleModel.dart';
import '../../utils/ProjectColors.dart';

class PropertyReviewScreen extends StatefulWidget {
  String? id;
  String? userId;
  PropertyReviewScreen({super.key,this.id,this.userId});

  @override
  State<PropertyReviewScreen> createState() => _PropertyReviewScreenState();
}

class _PropertyReviewScreenState extends State<PropertyReviewScreen> {

  PropertyReviewsModel? propertyReviewsModel;
  List<Reviews> list=[];
  num offset=0;
  RefreshController refreshController=RefreshController();


  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    if(widget.userId!=null){}
    var response=await httpPost(Config.getPropertyReviews, {"property_id":widget.id,"offset":'$offset'});
    if(response!=null){
      propertyReviewsModel=PropertyReviewsModel.fromJson(response);
      list.addAll(propertyReviewsModel!.data!.reviews!);
      offset=propertyReviewsModel!.data!.offset!;
      setState(() {
      });
    }
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  onLoading(){
    getData();
  }
  onRefresh(){
    propertyReviewsModel=null;
    list=[];
    setState(() {});
    offset=0;
    getData();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: CustomTheme.theamColor,elevation: 0,title: Text("Reviews"),),
    body: SmartRefresher(controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
      child: propertyReviewsModel==null?Center(child: CircularProgressIndicator(),):ListView.builder(itemCount: list.length,itemBuilder: (itemBuilder,index){
        return Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
          child: Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(borderRadius: BorderRadius.circular(50), child: SizedBox(height: 55,width: 55,child:myNetworkImage(list[index].guestImage)),),
              SizedBox(width: 16,),
              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(list[index].guestName!, style: const TextStyle(fontFamily: FontStyles.gilroyMedium, color: CustomTheme.theamColor, fontSize: 15, fontWeight: FontWeight.w700, letterSpacing: 1),),
                  SizedBox(height: 4,),
                  RatingBar.builder(initialRating: double.parse("${list[index].rating}"),itemSize: 20, ignoreGestures: true, direction: Axis.horizontal, itemCount: 5, itemPadding: EdgeInsets.symmetric(horizontal: 0), itemBuilder: (context, _) => Icon(Icons.star, color: CustomTheme.theamColor,), onRatingUpdate: (double value) {  },),
                  list[index].message==null?SizedBox():Container(width: MediaQuery.of(context).size.width/1.4,margin: EdgeInsets.only(top: 4),child: Text("${list[index].message!}", style: const TextStyle( fontWeight: FontWeight.w600),)),
                  SizedBox(height: 4,),
                  Text("${list[index].updatedAt}", style: TextStyle(color: greyColor),),
                ],
              ),
            ],
          ),
        );
      }),)
    );
  }

  
}
