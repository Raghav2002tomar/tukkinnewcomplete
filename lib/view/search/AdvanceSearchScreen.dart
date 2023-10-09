import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/LocationsModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/search/searchScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:flutter_svg/flutter_svg.dart';


class AdvanceSearchScreen extends StatefulWidget {
  const AdvanceSearchScreen({super.key});

  @override
  State<AdvanceSearchScreen> createState() => AdvanceSearchState();
}

class AdvanceSearchState extends State<AdvanceSearchScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  LocationsModel? locationsModel;
  bool shouldShow=false;


  searchCity(value) async {
    shouldShow=true;
    setState(() {
    });
    var response=await httpPost(Config.searchCities, {"searchTerm":value});
    if(response!=null){
      locationsModel=LocationsModel.fromJson(response);
      setState(() {});
    }
  }

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {

      print(args.value.startDate);
      print(args.value.endDate);
      controller.startDate.value = '${DateFormat('yyyy-MM-dd').format(args.value.startDate)}';
      controller.endDate.value = args.value.endDate==null?"":'${DateFormat('yyyy-MM-dd').format(args.value.endDate)}';
    } else if (args.value is DateTime) {
      // _selectedDate = args.value.toString();
    } else if (args.value is List<DateTime>) {
      // _dateCount = args.value.length.toString();
    } else {
      // _rangeCount = args.value.length.toString();
    }
  }

  searchMethod(){
    if(!_formKey.currentState!.validate()){
      return;
    }
    if(controller.startDate.value.isEmpty || controller.endDate.value.isEmpty){
      showToastMessage("Select Check IN and Check Out date".tr);
      return;
    }
    if(controller.citySelected==null){
      showToastMessage("Selected city from dropdown".tr);
      return;
    }
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>SearchScreen(checkIn: controller.startDate.value,checkout: controller.endDate.value,guest: controller.numberOfGuest.value.toString(),cityName:controller.textEditingControllerCity.text,slat: controller.slat,slong: controller.sLong,))).then((value) {
      if(value!=null){
        Navigator.pop(context);
      }
    });
  }

  clearMethod(){
    controller.citySelected=null;
    controller.textEditingControllerCity.text="";
    controller.startDate.value="";controller.endDate.value="";
    controller.numberOfGuest.value=1;
    controller.dateRangePickerController.selectedRange=null;
  }


  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);

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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Where".tr,
                  style: TextStyle(
                    color: notifire.getwhiteblackcolor,
                    fontFamily: FontStyles.gilroyBold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),

                GooglePlaceAutoCompleteTextField(
                  textEditingController: controller.textEditingControllerCity,
                  googleAPIKey: Config.googleKey,
                  countries: ["CI"],
                  inputDecoration: InputDecoration(
                      hintText: "Enter Address".tr, border: InputBorder.none),
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    print("hello");
                    print(prediction.lat.toString());
                    print(prediction.lng.toString());
                    controller.slat=prediction.lat.toString();
                    controller.sLong=prediction.lng.toString();
                    FocusManager.instance.primaryFocus?.unfocus();
                    controller.citySelected=controller.textEditingControllerCity.text;
                    controller.textEditingControllerCity.text = prediction.description!;
                    controller.textEditingControllerCity.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));

                  },
                  itemClick: (Prediction prediction) {

                    // print(prediction.lat.toString());
                    // print(prediction.lng.toString());
                    //
                    // controller.slat=prediction.lat.toString();
                    // controller.sLong=prediction.lng.toString();
                    // FocusManager.instance.primaryFocus?.unfocus();
                    // controller.citySelected=controller.textEditingControllerCity.text;
                    // controller.textEditingControllerCity.text = prediction.description!;
                    // controller.textEditingControllerCity.selection = TextSelection.fromPosition(TextPosition(offset: prediction.description!.length));
                  },
                  seperatedBuilder: Divider(
                    color: CustomTheme.theamColor,
                    thickness: 1,
                  ),
                ),

                // TextFormField(
                //   controller: controller.textEditingControllerCity,
                //   keyboardType: TextInputType.name,
                //   cursorColor: notifire.getwhiteblackcolor,
                //   autovalidateMode: AutovalidateMode.onUserInteraction,
                //   onChanged: (value){
                //     searchCity(value);
                //   },
                //   style: TextStyle(
                //     fontFamily: FontStyles.gilroyMedium,
                //     fontSize: 14,
                //     fontWeight: FontWeight.w600,
                //     color: notifire.getwhiteblackcolor,
                //   ),
                //   decoration: InputDecoration(
                //     hintText: "Search Destination",
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //       borderSide:
                //       BorderSide(color: CustomTheme.theamColor, width: 1),
                //     ),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(15),
                //         borderSide:
                //         BorderSide(width: 1, color: CustomTheme.theamColor)),
                //     border: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(15),
                //       borderSide: BorderSide(color: CustomTheme.theamColor),
                //     ),
                //   ),
                //   validator: (value) {
                //     print(value);
                //     if (value == null || value.isEmpty) {
                //       return 'Please select city'.tr;
                //     }
                //     return null;
                //   },
                // ),
                SizedBox(
                  height: 16,
                ),
                Stack(children: [
                  shouldShow==true?SizedBox():Column(mainAxisSize: MainAxisSize.min,children: [
                  Row(
                    children: [
                      Text(
                        "Select Date".tr,
                        style: TextStyle(
                          color: notifire.getwhiteblackcolor,
                          fontFamily: FontStyles.gilroyBold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(238, 233, 216, 178),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: SfDateRangePicker(
                      controller: controller.dateRangePickerController,
                      onSelectionChanged: onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                      enablePastDates: false,
                      headerStyle: DateRangePickerHeaderStyle(
                        textStyle: TextStyle(
                          fontFamily: FontStyles.gilroyBlack,
                          color: notifire.getwhiteblackcolor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16,),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Check in".tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontStyles.gilroyBold,
                            color: notifire.getwhiteblackcolor,
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Text(
                          "Check out".tr,
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: FontStyles.gilroyBold,
                            color: notifire.getwhiteblackcolor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(
                                controller.startDate.value.isNotEmpty?controller.startDate.value:"DD/MM/YYYY",
                                style: TextStyle(
                                    fontFamily: FontStyles.gilroyMedium,
                                    color: notifire.getgreycolor,
                                    fontWeight: FontWeight.bold
                                ),
                              )),
                              SvgPicture.asset(
                                "assets/images/Calendar.svg",
                                height: 30,
                                width: 30,
                                color: BlackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 16,),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(() => Text(controller.endDate.value.isNotEmpty?controller.endDate.value:"DD/MM/YYYY",
                                style: TextStyle(
                                    fontFamily: FontStyles.gilroyMedium,
                                    color: notifire.getgreycolor,
                                    fontWeight: FontWeight.bold),)),
                              SizedBox(width: 8,),
                              SvgPicture.asset(
                                "assets/images/Calendar.svg",
                                height: 30,
                                width: 30,
                                color: BlackColor,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24,),
                  Container(padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: notifire.getblackwhitecolor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Number of Guest".tr,
                          style: TextStyle(
                            color: notifire.getwhiteblackcolor,
                            fontFamily: FontStyles.gilroyBold,
                            fontSize: 17,
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (controller.numberOfGuest > 1)
                                    controller.numberOfGuest = controller.numberOfGuest - 1;
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.remove,
                                  color: CustomTheme.theamColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CustomTheme.theamColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 8,),
                            Container(width: 30,
                              alignment: Alignment.center,
                              child: Obx(() => Text(
                                '${controller.numberOfGuest.value}',
                                // "${bookrealEstateController.count}",
                                style: TextStyle(
                                    color: notifire.getwhiteblackcolor,
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                            SizedBox(width: 8,),
                            InkWell(
                              onTap: () {
                                controller.numberOfGuest.value++;
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.add,
                                  color: CustomTheme.theamColor,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: CustomTheme.theamColor,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 16,),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8,),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SvgPicture.asset('assets/images/Trash.svg'),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'clear'.tr,
                            style: CustomTheme.MainProfileScreenLogout,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      clearMethod();
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestButton(
                    height: 50,
                    buttoncolor: blueColor,
                    buttontext: "Continue".tr,
                    style: TextStyle(
                      fontFamily: "Gilroy Bold",
                      color: WhiteColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    onclick: () async {
                      searchMethod();
                    },
                  )
                ],),
                  shouldShow==false?SizedBox():
                  locationsModel==null?Container(padding: EdgeInsets.only(top: 50),child: Center(child: CircularProgressIndicator()),):
                  Container(color: Colors.white,child: ListView.builder(shrinkWrap: true,itemCount: locationsModel!.data!.locations!.length,itemBuilder: (itemBuilder,index){
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: InkWell(
                        onTap: (){
                          controller.textEditingControllerCity.text=locationsModel!.data!.locations!.elementAt(index).cityName!;
                          controller.slat=locationsModel!.data!.locations!.elementAt(index).latitude!;
                          controller.sLong=locationsModel!.data!.locations!.elementAt(index).longitude!;
                          FocusManager.instance.primaryFocus?.unfocus();
                          shouldShow=false;
                          controller.citySelected=controller.textEditingControllerCity.text;
                          setState(() {
                          });
                        },
                        child: Row(
                          children: [
                            SizedBox(height: 40,width: 40,child: ClipRRect(borderRadius: BorderRadius.circular(15),child: myNetworkImage(locationsModel!.data!.locations!.elementAt(index).image!),),),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(locationsModel!.data!.locations!.elementAt(index).cityName!,style: TextStyle(fontSize: 18),),
                            ),

                          ],
                        ),
                      ),
                    );
                  }),),

                ],),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
