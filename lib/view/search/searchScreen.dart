import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/controller/filterController.dart';
import 'package:Tukki/model/PropertyModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/view/homePage/NoDataFoundScreen.dart';
import 'package:Tukki/view/search/AdvanceSearchScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../utils/custom_theme.dart';
import 'FilterScreen.dart';

class SearchScreen extends StatefulWidget {
  String checkIn,checkout,guest,cityName,slat,slong;
  SearchScreen({super.key,required this.checkIn,required this.checkout,required this.guest,required this.cityName,required this.slat,required this.slong});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}


class _SearchScreenState extends State<SearchScreen> {
  FilterController filterController=Get.put(FilterController());
  bool filterAvailable=false;
  PropertyModel? propertyModel;
  TextEditingController textEditingController=TextEditingController();
  RefreshController refreshController=RefreshController();
  List list=[];
  num offset=0;

  @override
  void initState() {
    super.initState();
    searchMethod();
  }

  searchMethod() async {
    String price="${filterController.startRange.value}-${filterController.endRage.value}";
    var result=await searchProperty('',"${filterController.selectedPropertyList}",price,"${filterController.selectedBeds}","${filterController.selectedBathroom}","${filterController.selectedAmenitiesList}","10");
    try{
      propertyModel=PropertyModel.fromJson(result);
      list.addAll(propertyModel!.data!.properties!);
      offset=propertyModel!.data!.offset!;
      print("asdasdasdas $offset");
      print(propertyModel!.data!.offset!);
      setState(() {
      });
      refreshController.loadComplete();
      refreshController.refreshCompleted();
    }catch(e){
    }
  }

  searchProperty(String title,String propertyType,String price,String beds,String bathroom,String facility,String limit) async {
    if(price=="0.0-0.0"){
      price="";
    }
    Map map={
      "title":title,
      "property_type":propertyType,
      "price":price,
      "beds":beds,
      "bathroom":bathroom,
      "facility":facility,
      // "limit":limit,
      "offset":"$offset",
      "Slatitude":controller.slat,
      "Slongitude":controller.sLong,
      "check_in":widget.checkIn,
      "check_out":widget.checkout,
      "guest":widget.guest

    };

    return await httpPost(Config.searchProperty, map);
  }

  onLoading(){
    searchMethod();
  }
  onRefresh(){
    propertyModel=null;
    list=[];
    setState(() {});
    offset=0;
    searchMethod();
  }

  @override
  void dispose() {
    filterController.selectedAmenitiesList = [].obs;
    filterController.selectedPropertyList = [].obs;
    filterController.selectedBeds=1;
    filterController.selectedBathroom=1;
    filterController.showMore=true;
    // filterController.currentRangeValues = const RangeValues(0, 1000);


    super.dispose();
  }

  stateSetter(fn) => setState(() {
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,automaticallyImplyLeading: false,title:  Padding(
        padding: const EdgeInsets.only(top: 0,bottom: 4),
        child:
        Row(
          children: [
            Expanded(
              child: InkWell(onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>AdvanceSearchScreen()));
              },
                child: Container(decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor,width: 2,),borderRadius: BorderRadius.circular(10)),
                  child:

                  Container(padding: EdgeInsets.all(11),
                      // height: 45,
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(width: 2,color: CustomTheme.theamColor)),
                      child: Row(
                        children: [
                          Image.asset('assets/images/homepagesearchicon.png', width: 18, height: 18, fit: BoxFit.fill,color: Colors.black,),
                          SizedBox(width: 8,),
                          SizedBox(width: Get.width/1.7,child: Text(widget.cityName,style: TextStyle(color: Colors.black,fontSize: 14),)),
                        ],
                      )),
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            SizedBox(
              // width: 52,
              child: Stack(
                children: [
                  InkWell(onTap: () async {
                    var value=await Navigator.push(context, MaterialPageRoute(builder: (builder)=>FilterScreen()));
                    if(value!=null){
                      if(value=="true"){
                        filterAvailable=true;
                        onRefresh();
                      }else if(value=="clear"){
                        filterAvailable=false;
                        onRefresh();
                      }
                    }else{
                      filterAvailable=false;
                    }
                    setState(() {
                    });
                  },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      // width: 50,
                      // height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: CustomTheme.theamColor,
                            width: 1.0,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10),
                        color: CustomTheme.theamColor,
                      ),
                      child: Center(
                        child: Image.asset(
                          ('assets/images/Filter.png'),
                        ),
                      ),
                    ),
                  ),
                  !filterAvailable?SizedBox():Positioned(right: 0,child: Container(height: 10,width: 10,decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),)),
                ],
              ),
            ),
          ],
        ),
      ),),
      body:
      // SmartRefresher(
        // controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
        // child: propertyModel == null
        //     ? Center(child: CircularProgressIndicator(),)
        //     : list.isEmpty?Center(child: Text("No data found"),):
        // myList(list, false,false,stateSetter),),

      SmartRefresher(
        controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
        child: propertyModel == null
            ? Center(child: CircularProgressIndicator(),)
            : list.isEmpty?Center(child: buildNoDataWidget(context, "Property Not Available.".tr),):
        myList(list, false,false,stateSetter),)
    );
  }
}
