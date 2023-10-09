import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/CancellationPoliciesModel.dart';
import 'package:Tukki/model/LocationsModel.dart';
import 'package:Tukki/model/MyPropertiesModel.dart';
import 'package:Tukki/model/PropertyTypeModel.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/addproperty/AddPropertyScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import '../../model/AmenitiesModel.dart';
import '../homePage/explore/PropertyDetailsScreen.dart';

class MyPropertiesScreen extends StatefulWidget {
  const MyPropertiesScreen({super.key});

  @override
  State<MyPropertiesScreen> createState() => _MyPropertiesScreenState();
}

class _MyPropertiesScreenState extends State<MyPropertiesScreen> {

  MyPropertiesModel? myPropertiesModel;
  List<Properties> list=[];
  RefreshController refreshController=RefreshController();
  num offset=0;

  // AmenitiesModel? amenitiesModel;
  // PropertyTypeModel? propertyTypeModel;
  // LocationsModel? locationsModel;
  // CancellationPoliciesModel? cancellationPoliciesModel;
  // List<Amenities> listAmenities=[];
  // List<PropertyTypes> listPropertyType=[];
  // List<Locations> listLocation=[];
  // List<CancellationPolicies> listCancellationPolicies=[];

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var response=await httpPost(Config.myProperties, {"offset":"$offset"});
    if(response!=null){
      myPropertiesModel=MyPropertiesModel.fromJson(response);
      if(myPropertiesModel!.data!=null){
        list.addAll(myPropertiesModel!.data!.properties!);
        offset=myPropertiesModel!.data!.offset!;
      }
    }
    setState(() {});
    refreshController.loadComplete();
    refreshController.refreshCompleted();
  }

  deleteMethod(index) async {
  
    showLoading();
    var response=await httpPost(Config.deleteProperty, {"id":list[index].id.toString()});
    closeLoading();
    if(response!=null){
      if(response['status']==200){
        showToastMessage(response['message']);
        list.removeAt(index);
        setState(() {});
      }else{
        showToastMessage(response['error']);
      }
    }
  }

  onLoading(){
    getData();
  }
  onRefresh(){
    myPropertiesModel=null;
    list=[];
    setState(() {});
    offset=0;
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        elevation: 0,backgroundColor: CustomTheme.theamColor,leading: IconButton(
        onPressed: () {Get.back();},
        icon: Icon(Icons.arrow_back,),),title: Text("My Properties"),
        actions: [InkWell(onTap: (){

          Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddPropertyScreen())).then((value){
            myPropertiesModel=null;
            list=[];
            offset=0;
            setState(() {});
            getData();
          });
        },child: Image.asset("assets/images/Plus.png",color: Colors.white,))],
      ),
      body: SmartRefresher(controller: refreshController,onRefresh: onRefresh,onLoading: onLoading,enablePullUp: offset==-1?false:true,
        child: myPropertiesModel == null
            ? Center(child: CircularProgressIndicator(),)
            : list.isEmpty?Center(child: Column(mainAxisSize: MainAxisSize.min,children: [
          Text("You don't have any listing!".tr,style: TextStyle(color: CustomTheme.theamColor,fontSize: 24,fontWeight: FontWeight.bold)),
          SizedBox(height: 24,),
          Text("List your unused space to make money.",style: TextStyle(color: CustomTheme.theamColor,fontSize: 16),),
          SizedBox(height: 24,),
          InkWell(onTap: (){

            Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddPropertyScreen())).then((value){
              myPropertiesModel=null;
              offset=0;
              list=[];
              setState(() {});
              getData();
            });
          },child: Container(padding: EdgeInsets.all(10),decoration: BoxDecoration(color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(15)),child: Text("Add a new listing".tr,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),))),
        ],),) :
        ListView.builder(
          // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                child: InkWell(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: Get.size.width,
                            height: MediaQuery.of(context).size.height / 4,
                            child: ClipRRect(
                              borderRadius:
                              BorderRadius.circular(10), // Image border
                              child: SizedBox.fromSize(
                                size: const Size.fromRadius(180), // Image radius
                                child: FadeInImage.assetNetwork(
                                  fadeInCurve: Curves.easeInCirc,
                                  placeholder: "assets/images/ezgif.com-crop.gif",
                                  height: 50,
                                  image: list[index].frontImage==null?'':"${list[index].frontImage!.url}",
                                  imageErrorBuilder:
                                      (context, error, stackTrace) {
                                    return Image.asset(
                                      "assets/images/ezgif.com-crop.gif",
                                      fit: BoxFit.fill,
                                    );
                                  },
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          Positioned(right: 0,
                            child: Row(mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(onTap: (){

                                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>AddPropertyScreen(properties: list[index],))).then((value){
                                    myPropertiesModel=null;
                                    offset=0;
                                    list=[];
                                    setState(() {});
                                    getData();
                                  });
                                },child: Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(8)),child: Icon(Icons.edit,color: Colors.white,))),
                                SizedBox(width: 8,),
                                InkWell(onTap: (){
                                  showDeleteDialog(context,index);
                                },child: Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: Colors.redAccent.shade200,borderRadius: BorderRadius.circular(8)),child: Icon(Icons.delete_forever_rounded,color: Colors.white,))),
                              ],
                            ),
                          ),

                          Positioned(right: 0,bottom: 0,
                            child: Row(mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(padding: EdgeInsets.all(6),decoration: BoxDecoration(color: list[index].status=="0"?Colors.redAccent.shade200:Colors.green,borderRadius: BorderRadius.circular(8)),child: Row(
                                  children: [
                                    Icon(Icons.circle,color: Colors.white,size: 10,),
                                    SizedBox(width: 6,),
                                    Text(list[index].status=="0"?"Inactive": "Active",style: TextStyle(color: Colors.white),)
                                  ],
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text.rich(TextSpan(
                                text:
                                "${generalDataModel!.data!.metaData!.generalDefaultCurrency} ${list[index].price}",
                                style: const TextStyle(
                                    fontSize: 18,
                                    color: CustomTheme.theamColor,
                                    fontWeight: FontWeight.w600),
                                children: const <InlineSpan>[
                                  TextSpan(
                                    text: ' /night',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.star,
                                color: CustomTheme.theamColor,
                                size: 15,
                              ),
                              Text("${list[index].propertyRating}",
                                  style: CustomTheme.featuredsliderrating)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            list[index].title!.length > 40 ? list[index].title!.substring(0, 39) : list[index].title!,
                            style: CustomTheme.mostviewdescription,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Row(
                        children: [
                          Text(
                            "${list[index].propertyType} ",
                            style: CustomTheme.mostviewhome,
                          ),
                          Text(
                            "/ ${list[index].beds} beds",
                            style: CustomTheme.mostviewbeds,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onTap: () async {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyDetailsScreen(id: list.elementAt(index).id)));
                  },
                ),
              );
            }),)
    );
  }

  Future<void> showDeleteDialog(BuildContext context,index) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text('Are you sure?'.tr,style: TextStyle(color: CustomTheme.theamColor,fontSize: 16, fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.w700),),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Icon(Icons.error,size: 75,color: Colors.red,),
                Text('Do you want to delete your property?'.tr,textAlign: TextAlign.center,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),),
                // Text('Would you like to approve of this message?'),
              ],
            ),
          ),
          actions: <Widget>[
            Column(
              children: [
                Row(children: [
                  Expanded(child: InkWell(onTap: (){},child: InkWell(onTap: (){
                    Navigator.pop(context);
                  },child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Cancel".tr,style: TextStyle(fontFamily: FontStyles.gilroyMedium,),)))))),
                  Expanded(child: InkWell(onTap: (){
                    Navigator.pop(context);
                    deleteMethod(index);},child: Container(margin: EdgeInsets.only(left: 8,right: 8),padding: EdgeInsets.all(10),decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor),color: CustomTheme.theamColor,borderRadius: BorderRadius.circular(10) ),child: Center(child: Text("Yes".tr,style: TextStyle(color: Colors.white,fontFamily: FontStyles.gilroyMedium,fontWeight: FontWeight.bold),))))),
                ],),
                SizedBox(height: 8,)
              ],
            )
          ],
        );
      },
    );
  }
}
