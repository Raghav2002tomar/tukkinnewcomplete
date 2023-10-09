import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/PropertyModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SeeAllPropertiesScreen extends StatefulWidget {
  String title;
  String locationId;
  String? userId;
  SeeAllPropertiesScreen({super.key,required this.title,required this.locationId,this.userId});

  @override
  State<SeeAllPropertiesScreen> createState() => SeeAllPropertiesState();
}


class SeeAllPropertiesState extends State<SeeAllPropertiesScreen> {

  PropertyModel? propertyModel;
  RefreshController refreshController=RefreshController();
  num offset=0;
  var list=[];
  @override
  void initState() {
    super.initState();
    print(widget.userId.toString()+" vvvvvvvvvv");
    fetchData();
  }

  fetchData() async {
    var response;
    if(widget.userId!=null){
      print("OFFFFSETXXXXXXXX $offset");
      response=await httpPost(Config.getUserProperties, {"userid":widget.userId,"offset":"$offset"});
    }else

    if(widget.title=="Most Viewed Properties"){
      response = await httpPost(Config.mostViewedProperties, {"offset":"$offset"});
    }else if(widget.title=="Recommended Properties"){
      response = await httpPost(Config.featuredProperties, {"offset":"$offset"});
    }else{
      response = await httpPost(Config.getPropertiesByLocation, {"location_id": widget.locationId,"offset":"$offset"});
    }
    if(response!=null){
      propertyModel=PropertyModel.fromJson(response);
      list.addAll(propertyModel!.data!.properties!);
      offset=propertyModel!.data!.offset!;
      print("OFFFFSET $offset");
    }
    setState(() {});
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }
  onLoading(){
    fetchData();
  }
  onRefresh(){
    propertyModel=null;
    list=[];
    setState(() {});
    offset=0;
    fetchData();
  }

  stateSetter(fn) => setState(() {
  });

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

    return Scaffold(
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
          widget.title.tr,
          style: TextStyle(
            fontSize: 17,
            fontFamily: FontStyles.gilroyBold,
            color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      body: SmartRefresher(
        controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
      child: propertyModel == null
          ? Center(child: CircularProgressIndicator(),)
          : list.isEmpty?Center(child: buildNoDataWidget(context, "No Data founds".tr),):
      myList(list, false,false,stateSetter),),
    );
  }
}
