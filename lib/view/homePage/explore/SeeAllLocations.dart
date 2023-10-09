import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/LocationsModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/view/homePage/explore/SeeAllProperties.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SeeAllLocationsScreen extends StatefulWidget {
  SeeAllLocationsScreen({super.key});

  @override
  State<SeeAllLocationsScreen> createState() =>
      SeeAllLocationsState();
}

class SeeAllLocationsState extends State<SeeAllLocationsScreen> {

  LocationsModel? locationsModel;
  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var response = await httpPost(Config.yourLocation, {});
    if(response!=null){
      locationsModel=LocationsModel.fromJson(response);
    }
    setState(() {
    });
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
          "Select Location".tr,
          style: TextStyle(
            fontSize: 17,
            fontFamily: FontStyles.gilroyBold,
            color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      body: locationsModel==null?Center(child: CircularProgressIndicator()):GridView.builder(
        itemCount: locationsModel!.data!.locations!.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 3,
            mainAxisExtent: 240,
            mainAxisSpacing: 3),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print('hello');

            },
            child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 0, vertical: 0),
                child: InkWell(
                  onTap: () {

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => PropertyByLocationScreen(locations: locationsModel!.data!.locations![index],)));
                    Navigator.push(context, MaterialPageRoute(builder: (context) => SeeAllPropertiesScreen(title: locationsModel!.data!.locations![index].cityName!,locationId: "${locationsModel!.data!.locations![index].id}",)));
                  },
                  onHover: (value) {
                  },
                  child: Column(
                    children: [
                      Container(
                        // Width: Get.size.width,
                        // color: Colors.white,

                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Container(
                                // color: Colors.white,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  child: SizedBox(width: 150,
                                    height: 150,
                                    child: myNetworkImage("${locationsModel!.data!.locations!.elementAt(index).image}")
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        child: Text(
                          locationsModel!.data!.locations!
                              .elementAt(index)
                              .cityName ??
                              "",
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: FontStyles.gilroyBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }


}
