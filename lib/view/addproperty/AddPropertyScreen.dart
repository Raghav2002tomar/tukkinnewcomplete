import 'dart:convert';
import 'dart:io';
import 'package:Tukki/model/CancellationPoliciesModel.dart';
import 'package:Tukki/model/MyPropertiesModel.dart';
import 'package:Tukki/view/addproperty/ThankYouScreen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/model/AmenitiesModel.dart';
import 'package:Tukki/model/LocationsModel.dart';
import 'package:Tukki/model/PropertyTypeModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/addproperty/SeeImageFullScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../controller/GeneralController.dart';

class AddPropertyScreen extends StatefulWidget {
  Properties? properties;

  AddPropertyScreen({super.key, this.properties});

  @override
  State<AddPropertyScreen> createState() => _AddPropertyScreenState();
}

class _AddPropertyScreenState extends State<AddPropertyScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController textEditingControllerTitle = TextEditingController();
  TextEditingController textEditingControllerDesc = TextEditingController();
  TextEditingController textEditingControllerArea = TextEditingController();
  TextEditingController textEditingControllerAddress = TextEditingController();
  TextEditingController textEditingControllerPrice = TextEditingController();
  TextEditingController textEditingControllerZip = TextEditingController();
  TextEditingController textEditingControllerWeekDiscount =
      TextEditingController();
  TextEditingController textEditingControllerMonthDiscount =
      TextEditingController();
  DateRangePickerController dateRangePickerController =
      DateRangePickerController();

  AmenitiesModel? amenitiesModel;
  PropertyTypeModel? propertyTypeModel;
  LocationsModel? locationsModel;
  CancellationPoliciesModel? cancellationPoliciesModel;
  List<Amenities> listAmenities = [];
  List<PropertyTypes> listPropertyType = [];
  List<Locations> listLocation = [];
  List<CancellationPolicies> listCancellationPolicies = [];

  RxInt totalBeds = 1.obs;
  RxInt totalBathroom = 1.obs;
  RxInt totalAllowed = 1.obs;
  RxList selectedAmenitiesList = [].obs;
  String? selectedPropertyType;
  String? selectedCityName;

  XFile? frontImage;
  List<XFile> galleryImageList = [];
  String? frontImageBase64;
  List galleryImageBase64List = [];
  String selectedMonthlyDiscountType = "percent";
  String selectedWeeklyDiscountType = "percent";
  String? selectedLat, selectedLong;
  int selectedRadio = -1.obs;
  List listDeleteImages = [];

  // DateTime? startDate;
  // DateTime? endDate;
  // RxList dateList=[].obs;
  // RxList selectedPriceMap=[].obs;
  RxString qwer = "0".obs;
  RxInt toggle = 1.obs;
  TextEditingController textEditingControllerFuturePrice =
      TextEditingController();
  FocusNode focusNode = FocusNode();

  String futurePrice = "";
  PickerDateRange? initial;
  List<DateTime> alreadySelectedList = [];

  // var zipCode;
  var country = "";
  var state = "";
  var city = "";

  bool processing = false;
  RxList selectedPriceMap = [].obs;
  RxList dateList = [].obs;
  List<PickerDateRange> initialList = [];

  @override
  void initState() {
    super.initState();
    if (widget.properties != null) {
      print("sssss");
      print(widget.properties!.id);
      textEditingControllerTitle.text = widget.properties!.title!;
      textEditingControllerDesc.text = widget.properties!.description!;
      textEditingControllerArea.text = widget.properties!.propertySqft!;
      textEditingControllerAddress.text = widget.properties!.address!;

      textEditingControllerPrice.text = widget.properties!.price!;
      textEditingControllerWeekDiscount.text =
          widget.properties!.weeklyDiscount!;
      textEditingControllerMonthDiscount.text =
          widget.properties!.monthlyDiscount!;

      totalBeds.value = int.parse(widget.properties!.beds!);
      totalBathroom.value = int.parse(widget.properties!.bathroom!);
      totalAllowed.value = int.parse(widget.properties!.personAllowed!);
      selectedWeeklyDiscountType = widget.properties!.weeklyDiscountType!;
      selectedMonthlyDiscountType = widget.properties!.monthlyDiscountType!;
      selectedLat = widget.properties!.latitude!;
      selectedLong = widget.properties!.longitude!;

      if (widget.properties!.zipPostalCode != null) {
        textEditingControllerZip.text = widget.properties!.zipPostalCode!;
      }
      if (widget.properties!.stateRegion != null) {
        state = widget.properties!.stateRegion!;
      }
      if (widget.properties!.city != null) {
        city = widget.properties!.city!;
      }
      if (widget.properties!.country != null) {
        country = widget.properties!.country!;
      }

      if (widget.properties!.notAvailableDates != null &&
          widget.properties!.notAvailableDates!.isNotEmpty) {
        // startDate =
        //     DateTime.parse(widget.properties!.notAvailableDates!.first.date!);
        // endDate =
        //     DateTime.parse(widget.properties!.notAvailableDates!.last.date!);
        // futurePrice = widget.properties!.notAvailableDates!.first.price!;
        toggle.value = 0;
      }

      if (widget.properties!.availableDates != null) {
        // startDate = DateTime.parse(widget.properties!.availableDates!.first.date!);
        // endDate = DateTime.parse(widget.properties!.availableDates!.last.date!);
        // futurePrice = widget.properties!.availableDates!.first.price!;

        List jsonList = jsonDecode(widget.properties!.availableDates!);
        for (var x in jsonList) {
          print("${x.first['date']}  ${x.last['date']}");
          print("${x.first['price']}  ${x.last['price']}");
          futurePrice = x.first['price'];
          dateList.add(PickerDateRange(DateTime.tryParse(x.first['date']),
              DateTime.tryParse(x.last['date'])));
          initialList.add(PickerDateRange(DateTime.tryParse(x.first['date']),
              DateTime.tryParse(x.last['date'])));
          selectedPriceMap.add({
            "date": PickerDateRange(DateTime.tryParse(x.first['date']),
                DateTime.tryParse(x.last['date'])),
            "value": x.first['price'],
            'status': "Available"
          });
        }
        print("_______ $selectedPriceMap");

        // dateRangePickerController.selectedRanges=[PickerDateRange(DateTime.now(), DateTime.now().add(Duration(days: 4)))];
      }
      textEditingControllerFuturePrice.text = futurePrice;
      for (var x in widget.properties!.bookedDates!) {
        alreadySelectedList.add(DateTime.parse(x.date!));
      }
      print("ALREADDDD $alreadySelectedList");
      print("ALREADDDD ${widget.properties!.bookedDates!.length}");

      setState(() {});
    }
    getData();
  }

  @override
  void dispose() {
    focusNode.dispose(); // Dispose the FocusNode when you're done
    super.dispose();
  }

  getData() async {
    var ameString = GetStorage().read("amenities");

    if (ameString == null) {
      var response = await httpPost(Config.amenities, {});
      if (response != null) {
        amenitiesModel = AmenitiesModel.fromJson(response);
        listAmenities = amenitiesModel!.data!.amenities!;
        GetStorage().write("amenities", response);
      }
    } else {
      amenitiesModel = AmenitiesModel.fromJson(ameString);
      listAmenities = amenitiesModel!.data!.amenities!;
    }

    var typeString = GetStorage().read("propertyType");
    if (typeString == null) {
      var response2 = await httpPost(Config.propertyType, {});
      if (response2 != null) {
        propertyTypeModel = PropertyTypeModel.fromJson(response2);
        listPropertyType = propertyTypeModel!.data!.propertyTypes!;
        GetStorage().write("propertyType", response2);
      }
    } else {
      propertyTypeModel = PropertyTypeModel.fromJson(typeString);
      listPropertyType = propertyTypeModel!.data!.propertyTypes!;
    }

    var yourLocationString = GetStorage().read("yourLocation");
    if (yourLocationString == null) {
      var response3 = await httpPost(Config.yourLocation, {});
      if (response3 != null) {
        locationsModel = LocationsModel.fromJson(response3);
        listLocation = locationsModel!.data!.locations!;
        GetStorage().write("yourLocation", response3);
      }
    } else {
      locationsModel = LocationsModel.fromJson(yourLocationString);
      listLocation = locationsModel!.data!.locations!;
    }

    var cancellationPoliciesString = GetStorage().read("cancellationPolicies");
    if (cancellationPoliciesString == null) {
      var response4 = await httpPost(Config.getCancellationPolicies, {});
      if (response4 != null) {
        cancellationPoliciesModel =
            CancellationPoliciesModel.fromJson(response4);
        listCancellationPolicies =
            cancellationPoliciesModel!.data!.cancellationPolicies!;
        GetStorage().write("cancellationPolicies", response4);
      }
    } else {
      cancellationPoliciesModel =
          CancellationPoliciesModel.fromJson(cancellationPoliciesString);
      listCancellationPolicies =
          cancellationPoliciesModel!.data!.cancellationPolicies!;
    }

    if (widget.properties != null) {
      selectedPropertyType = widget.properties!.propertyTypeId!;
      print("PRPPPPTYPE $selectedPropertyType");
      for (var x in listPropertyType) {
        print(x.name);
        print(x.id);
      }
      selectedCityName = widget.properties!.placeId!;
      selectedRadio = int.parse(widget.properties!.bookingPoliciesId!);
      selectedAmenitiesList.value = widget.properties!.amenitiesId!
          .split(",")
          .map((s) => int.parse(s))
          .toList();
    }
    setState(() {});
  }

  submitMethod() async {
    if (_formKey.currentState!.validate()) {
      if (selectedPropertyType == null) {
        return showToastMessage("Select property type");
      }

      if (selectedCityName == null) {
        return showToastMessage("Select city");
      }
      if (selectedAmenitiesList.isEmpty) {
        return showToastMessage("Select Amenities");
      }
      if (selectedLat == null && selectedLong == null) {
        return showToastMessage("Select Address");
      }
      if (frontImageBase64 == null) {
        return showToastMessage("Select front image");
      }
      if (galleryImageBase64List.isEmpty) {
        return showToastMessage("Select atLeast image");
      }

      if (selectedRadio == -1) {
        return showToastMessage("Select Cancellation Policy");
      }

      if (processing == true) {
        return;
      }

      processing = true;
      print("submit success");

      // List availabilityDatesList = [];
      // List<DateTime> days = [];
      // for (int i = 0; i <= endDate!.difference(startDate!).inDays; i++) {
      //   days.add(startDate!.add(Duration(days: i)));
      // }
      // String status;
      // if (toggle.value == 0) {
      //   status = "Not available";
      // } else {
      //   status = "Available";
      // }
      // String price;
      // if (textEditingControllerFuturePrice.text.isNotEmpty) {
      //   price = textEditingControllerFuturePrice.text;
      // } else {
      //   price = textEditingControllerPrice.text;
      // }
      // for (var day in days) {
      //   availabilityDatesList.add(jsonEncode({
      //     "date":
      //         "${DateFormat("yyyy-MM-dd").parse("$day").toString().split(" ")[0]}",
      //     "status": status,
      //     "price": price
      //   }));
      // }

      List myNewDateAndStatusList = [];
      List availabilityDatesList = [];
      for (var x in selectedPriceMap) {
        List<DateTime> days = [];
        // print(x['date']);
        List aList = [];
        for (int i = 0;
            i <= x['date'].endDate.difference(x['date'].startDate).inDays;
            i++) {
          days.add(x['date'].startDate.add(Duration(days: i)));
          aList.add(jsonEncode({
            "date": DateFormat("yyyy-MM-dd")
                .parse("${x['date'].startDate.add(Duration(days: i))}")
                .toString()
                .split(" ")[0],
            "status": x['status'],
            "price": x['value']
          }));
        }
        myNewDateAndStatusList.add(aList.toString());

        for (var day in days) {
          availabilityDatesList.add(jsonEncode({
            "date":
                "${DateFormat("yyyy-MM-dd").parse("$day").toString().split(" ")[0]}",
            "status": x['status'],
            "price": x['value']
          }));
        }
      }
      // print(selectedPriceMap);
      // print(availabilityDatesList);
      print(myNewDateAndStatusList);

      Map map = {
        "property_type_id": selectedPropertyType,
        "amenities_id":
            "$selectedAmenitiesList", // Replace these values with actual amenity IDs
        "place_id": selectedCityName,
        "title": textEditingControllerTitle.text,
        "description": textEditingControllerDesc.text,
        "beds": totalBeds.toString(),
        "bathroom": totalBathroom.toString(),
        "property_sqft": textEditingControllerArea.text,
        "person_allowed": totalAllowed.toString(),
        "price": textEditingControllerPrice.text,
        "address": textEditingControllerAddress.text,
        "platitude": selectedLat,
        "plongitude": selectedLong,
        "weekly_discount": textEditingControllerWeekDiscount.text,
        "weekly_discount_type": selectedWeeklyDiscountType,
        "monthly_discount": textEditingControllerMonthDiscount.text,
        "monthly_discount_type": selectedWeeklyDiscountType,
        "booking_policies_id": '$selectedRadio',
        "front_image": frontImageBase64,
        "gallery_image": galleryImageBase64List.join("##"),
        // "availability_dates": availabilityDatesList.toString(),
        "availability_dates": myNewDateAndStatusList.toString(),
        "country": country,
        "state_region": state,
        "city": city,
        "zip_postal_code": textEditingControllerZip.text
      };
      var jsonnn = jsonEncode(map);
      print(jsonnn);
      print("=========");
      // print(jsonDecode(jsonnn));
      print(token);

      showLoading();
      var response = await httpPost(Config.insertProperty, map);
      closeLoading();
      if (response != null) {
        if (response['status'] == 200) {
          // showToastMessage(response['message']);
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) =>
                          ThankYouScreen(fText: "For Listing you property")))
              .then((value) {
            Navigator.pop(context, "pop");
          });
        } else {
          showToastMessage(response['error']);
        }
      }
    } else {
      showErrorToastMessage("Fill all details");
    }
  }

  updateMethod() async {
    if (_formKey.currentState!.validate()) {
      if (selectedPropertyType == null) {
        return showToastMessage("Select property type");
      }
      if (selectedCityName == null) {
        return showToastMessage("Select city");
      }
      if (selectedAmenitiesList.isEmpty) {
        return showToastMessage("Select Amenities");
      }
      if (selectedLat == null && selectedLong == null) {
        return showToastMessage("Select Address");
      }
      if (selectedRadio == -1) {
        return showToastMessage("Select Cancellation Policy");
      }

      if (processing == true) {
        return;
      }
      processing = true;

      // List availabilityDatesList = [];
      // List<DateTime> days = [];
      // for (int i = 0; i <= endDate!.difference(startDate!).inDays; i++) {
      //   days.add(startDate!.add(Duration(days: i)));
      // }
      // for (var x in alreadySelectedList) {
      //   if (days.contains(x)) {
      //     days.remove(x);
      //   }
      // }
      // String status;
      // if (toggle.value == 0) {
      //   status = "Not available";
      // } else {
      //   status = "Available";
      // }
      // String price;
      // if (textEditingControllerFuturePrice.text.isNotEmpty) {
      //   price = textEditingControllerFuturePrice.text;
      // } else {
      //   price = textEditingControllerPrice.text;
      // }
      // for (var day in days) {
      //   availabilityDatesList.add(jsonEncode({
      //     "date":
      //         "${DateFormat("yyyy-MM-dd").parse("$day").toString().split(" ")[0]}",
      //     "status": status,
      //     "price": price
      //   }));
      // }

      List myNewDateAndStatusList = [];
      List availabilityDatesList = [];
      for (var x in selectedPriceMap) {
        List<DateTime> days = [];
        // print(x['date']);
        List aList = [];
        for (int i = 0;
            i <= x['date'].endDate.difference(x['date'].startDate).inDays;
            i++) {
          days.add(x['date'].startDate.add(Duration(days: i)));
          aList.add(jsonEncode({
            "date": DateFormat("yyyy-MM-dd")
                .parse("${x['date'].startDate.add(Duration(days: i))}")
                .toString()
                .split(" ")[0],
            "status": x['status'],
            "price": x['value']
          }));
        }
        myNewDateAndStatusList.add(aList.toString());

        for (var day in days) {
          availabilityDatesList.add(jsonEncode({
            "date":
                "${DateFormat("yyyy-MM-dd").parse("$day").toString().split(" ")[0]}",
            "status": x['status'],
            "price": x['value']
          }));
        }
      }

      Map map = {
        "id": widget.properties!.id.toString(),
        "property_type_id": selectedPropertyType,
        "amenities_id": "$selectedAmenitiesList",
        "place_id": selectedCityName,
        "title": textEditingControllerTitle.text,
        "description": textEditingControllerDesc.text,
        "beds": totalBeds.toString(),
        "bathroom": totalBathroom.toString(),
        "property_sqft": textEditingControllerArea.text,
        "person_allowed": totalAllowed.toString(),
        "price": textEditingControllerPrice.text,
        "address": textEditingControllerAddress.text,
        "platitude": selectedLat,
        "plongitude": selectedLong,
        "weekly_discount": textEditingControllerWeekDiscount.text,
        "weekly_discount_type": selectedWeeklyDiscountType,
        "monthly_discount": textEditingControllerMonthDiscount.text,
        "monthly_discount_type": selectedWeeklyDiscountType,
        "booking_policies_id": '$selectedRadio',
        "front_image": frontImageBase64 ?? "",
        "gallery_image": galleryImageBase64List.isEmpty
            ? ""
            : galleryImageBase64List.join("##"),
        "gallery_image_delete":
            listDeleteImages.isEmpty ? "" : listDeleteImages.toString(),
        "availability_dates": myNewDateAndStatusList.toString(),
        // "availability_dates": availabilityDatesList.toString(),
        "country": country,
        "state_region": state,
        "city": city,
        "zip_postal_code": textEditingControllerZip.text
      };

      showLoading();
      var response = await httpPost(Config.editProperty, map);
      closeLoading();
      if (response != null) {
        if (response['status'] == 200) {
          showToastMessage(response['message']);
          Navigator.of(context).pop("pop");
        } else {
          showToastMessage(response['error']);
        }
      }
    } else {
      showErrorToastMessage("Fill all details");
    }
  }

  // onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
  //   startDate = args.value.startDate;
  //   endDate = args.value.endDate;
  //   setState(() {});
  // }

  onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    dateList.value = args.value;
    print(dateList);

    if (selectedPriceMap.isEmpty) {
      print("CONDTITION 1");
      for (var x in dateList) {
        selectedPriceMap.add({
          "date": x,
          "value": textEditingControllerPrice.text.isEmpty
              ? "0"
              : textEditingControllerPrice.text,
          'status': "Available"
        });
      }
      textEditingControllerFuturePrice.text = textEditingControllerPrice.text;
    } else if (selectedPriceMap.length < dateList.length) {
      print("CONDTITION 2");
      selectedPriceMap.add({
        "date": dateList.elementAt(dateList.length - 1),
        "value": textEditingControllerPrice.text.isEmpty
            ? "0"
            : textEditingControllerPrice.text,
        'status': "Available"
      });
      textEditingControllerFuturePrice.text = textEditingControllerPrice.text;
    } else if (selectedPriceMap.length > dateList.length) {
      print("CONDTITION 3");
      int index = -1;
      for (int i = 0; i < selectedPriceMap.length; i++) {
        if (!dateList.any((element) =>
            element.startDate == selectedPriceMap[i]['date'].startDate)) {
          index = i;
        }
      }
      if (index != -1) {
        print("CONDTITION xxx");
        textEditingControllerFuturePrice.text =
            selectedPriceMap.elementAt(selectedPriceMap.length - 1)['value'];
        selectedPriceMap.removeAt(index);
      }
    } else if (selectedPriceMap.length == dateList.length) {
      print("CONDTITION 4");
      for (int i = 0; i < dateList.length; i++) {
        selectedPriceMap[i] = {
          "date": dateList[i],
          "value": selectedPriceMap[i]['value'],
          "status": selectedPriceMap[i]['status']
        };
      }
      textEditingControllerFuturePrice.text =
          selectedPriceMap.elementAt(selectedPriceMap.length - 1)['value'];
    }

    print(selectedPriceMap);
    return;
  }

  calender() {
    return SfDateRangePicker(
      selectionShape: DateRangePickerSelectionShape.circle,
      endRangeSelectionColor: Colors.transparent,
      startRangeSelectionColor: Colors.transparent,
      initialSelectedRanges: initialList,
      rangeSelectionColor: Colors.transparent,
      controller: dateRangePickerController,
      onSelectionChanged: onSelectionChanged,
      selectionMode: DateRangePickerSelectionMode.multiRange,
      enablePastDates: false,
      headerStyle: DateRangePickerHeaderStyle(
        textStyle: TextStyle(
          fontFamily: FontStyles.gilroyBlack,
          color: notifire.getwhiteblackcolor,
        ),
      ),
      monthViewSettings: DateRangePickerMonthViewSettings(
        blackoutDates: alreadySelectedList,
      ),
      monthCellStyle: DateRangePickerMonthCellStyle(
          blackoutDateTextStyle: TextStyle(
            color: Colors.white,
          ),
          blackoutDatesDecoration: BoxDecoration(
              shape: BoxShape.circle, color: Colors.green.shade100)),
      cellBuilder:
          (BuildContext context, DateRangePickerCellDetails cellDetails) {
        final date = cellDetails.date;
        // String cellDate=DateFormat('yyyy-MM-dd').format(cellDetails.date);
        // final isWeekend = date.weekday == 6 || date.weekday == 7; // Check for Saturday or Sunday

        // RxList temppp=[].obs;
        // List sssssss=selectedPriceMap.map((element){
        //   if(element['date'].endDate==null){
        //     temppp.add(element['value']);
        //     return element['date'].startDate;
        //   }
        //   temppp.add(element['date'].startDate.isBefore(cellDetails.date)&&  element['date'].endDate.isAfter(cellDetails.date) || element['date'].startDate==cellDetails.date ||  element['date'].endDate==cellDetails.date? element['value'] : null);
        //   return element['date'].startDate.isBefore(cellDetails.date)&&  element['date'].endDate.isAfter(cellDetails.date) || element['date'].startDate==cellDetails.date ||  element['date'].endDate==cellDetails.date? cellDetails.date : null;
        // }).toList();

        List l22 = dateList.map((element) {
          if (element.endDate == null) {
            return element.startDate;
          }
          return element.startDate.isBefore(cellDetails.date) &&
                      element.endDate.isAfter(cellDetails.date) ||
                  element.startDate == cellDetails.date ||
                  element.endDate == cellDetails.date
              ? cellDetails.date
              : null;
        }).toList();

        List lllll = dateList.map((element) {
          if (element.endDate == null) {
            return null;
          }
          return element.startDate.isBefore(cellDetails.date) &&
                  element.endDate.isAfter(cellDetails.date)
              ? cellDetails.date
              : null;
        }).toList();

        var colorr = dateList
                    .any((element) => element.startDate == cellDetails.date) ||
                dateList.any((element) => element.endDate == cellDetails.date)
            ? Colors.white
            : cellDetails.date.isBefore(DateTime.now())
                ? Colors.grey
                : Colors.black;
        //
        // print("dateList------- $dateList");
        // print("selectedPriceMap------- $selectedPriceMap");
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                border: Border.all(
                    color: cellDetails.date.isBefore(DateTime.now())
                        ? Colors.grey.shade500
                        : Colors.blueAccent,
                    width: 1.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(5),
                color: alreadySelectedList.contains(cellDetails.date)
                    ? Colors.green
                    : selectedPriceMap.any((element) =>
                            // element['date'].endDate==null? element['date'].startDate==cellDetails.date ?true:false:

                            element['date'].endDate != null
                                ? element['date']
                                                .startDate
                                                .isBefore(cellDetails.date) &&
                                            element['date']
                                                .endDate
                                                .isAfter(cellDetails.date) ||
                                        element['date'].startDate ==
                                            cellDetails.date ||
                                        element['date'].endDate ==
                                            cellDetails.date
                                    ? element['status'] == "Not available"
                                        ? true
                                        : false
                                    : false
                                : element['date'].startDate ==
                                            cellDetails.date &&
                                        element['status'] == "Not available"
                                    ? true
                                    : false)
                        ? Colors.red.withOpacity(.8)
                        : lllll.contains(cellDetails.date)
                            ? CustomTheme.theamColor
                            : dateList.any((element) =>
                                    element.startDate == cellDetails.date)
                                ? CustomTheme.theamColor
                                : dateList.any((element) =>
                                        element.endDate == cellDetails.date)
                                    ? CustomTheme.theamColor
                                    : cellDetails.date.isBefore(DateTime.now())
                                        ? Colors.transparent
                                        : Colors.redAccent),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  cellDetails.date.day.toString(),
                  style: TextStyle(
                      color: cellDetails.date.isBefore(DateTime.now())
                          ? Colors.grey.shade500
                          : Colors.black
                      // color: selectedPriceMap.any((element) => element['date'].startDate.isBefore(cellDetails.date)&&  element['date'].endDate.isAfter(cellDetails.date) || element['date'].startDate==cellDetails.date ||  element['date'].endDate==cellDetails.date ? element['status']=="Not available"?true:false :false)?Colors.white:Colors.black
                      ),
                ),
                // Obx(() => Text(qwer.value))
                Text(
                  "${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${l22.contains(cellDetails.date) ? selectedPriceMap.map((element) {
                        if (element['date'].endDate == null) {
                          return element['value'];
                        }
                        return element['date']
                                        .startDate
                                        .isBefore(cellDetails.date) &&
                                    element['date']
                                        .endDate
                                        .isAfter(cellDetails.date) ||
                                element['date'].startDate == cellDetails.date ||
                                element['date'].endDate == cellDetails.date
                            ? element['value']
                            : null;
                      }).toList().elementAt(l22.indexOf(cellDetails.date)) : textEditingControllerPrice.text}",
                  style: TextStyle(
                      fontSize: 8,
                      color: cellDetails.date.isBefore(DateTime.now())
                          ? Colors.grey.shade500
                          : Colors.black
                      // selectedPriceMap.any((element) => element['date'].startDate.isBefore(cellDetails.date)&&  element['date'].endDate.isAfter(cellDetails.date) || element['date'].startDate==cellDetails.date ||  element['date'].endDate==cellDetails.date ? element['status']=="Not available"?true:false :false)?Colors.white:Colors.black
                      ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  futureDateListBuild() {
    return Obx(() => ListView.builder(
          itemCount: dateList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (itemBuilder, index) {
            return index != dateList.length - 1
                ? SizedBox()
                : Column(
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${DateFormat('yyyy/MM/dd').format(dateList[index].startDate)}${dateList[index].endDate != null ? ' - ' + DateFormat('yyyy/MM/dd').format(dateList[index].endDate) : ''}",
                            style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,
                                fontWeight: FontWeight.w700),
                          ),
                          ToggleSwitch(
                            minWidth: 60.0,
                            cornerRadius: 10.0,
                            activeBgColors: [
                              [Colors.red],
                              [CustomTheme.theamColor]
                            ],
                            activeFgColor: Colors.white,
                            inactiveBgColor: Colors.white,
                            inactiveFgColor: Colors.black,
                            initialLabelIndex: 1,
                            borderWidth: 1,
                            borderColor: [CustomTheme.theamColor],
                            totalSwitches: 2,
                            labels: ['Close', 'Open'],
                            radiusStyle: true,
                            onToggle: (ind) {
                              print('switched to: $ind');

                              toggle.value = ind!;
                              if (toggle.value == 1) {
                                toggle.value = 0;
                              } else {
                                toggle.value = 1;
                                dateList.removeAt(index);
                                selectedPriceMap.removeAt(index);
                                setState(() {});
                              }

                              print(toggle);
                              if (toggle.value == 1) {
                                // selectedPriceMap[index]['status']="Available";
                              } else {
                                // selectedPriceMap[index]['status']="Not available";
                              }
                              FocusScope.of(context).requestFocus(focusNode);

                              qwer.value = "";
                              Future.delayed(Duration(milliseconds: 100), () {
                                qwer.value = "0";
                              });
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price per night",
                            style: TextStyle(
                                fontFamily: FontStyles.gilroyMedium,
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            children: [
                              Text(generalDataModel!
                                  .data!.metaData!.generalDefaultCurrency!),
                              SizedBox(
                                width: 8,
                              ),
                              SizedBox(
                                width: 120,
                                child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextField(
                                      focusNode: focusNode,
                                      controller:
                                          textEditingControllerFuturePrice,
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration.collapsed(
                                          hintText: "Price",
                                          border: InputBorder.none),
                                      onChanged: (vale) {
                                        if (vale == "0") {
                                          textEditingControllerFuturePrice
                                              .text = "";

                                          return;
                                        }
                                        selectedPriceMap[index]['value'] = vale;
                                        qwer.value = "";
                                        Future.delayed(
                                            Duration(milliseconds: 100), () {
                                          qwer.value = "0";
                                        });

                                        // setState(() {});
                                        // print(selectedPriceMap);
                                      },
                                    )),
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  );
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    notifire = Provider.of<ColorNotifire>(context, listen: true);
    return Scaffold(
      backgroundColor: notifire.getbgcolor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: CustomTheme.theamColor,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: WhiteColor,
          ),
        ),
        title: Text(
            widget.properties != null ? "Edit Property".tr : "Add Property".tr,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: FontStyles.gilroyMedium,
                fontWeight: FontWeight.w700)),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headingText('Title'.tr),
                textField(textEditingControllerTitle, "Enter Title".tr, false,
                    "Enter Title".tr, TextInputType.name),
                headingText('Property Description'.tr),
                TextFormField(
                  textCapitalization: TextCapitalization.sentences,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  maxLines: 12,
                  controller: textEditingControllerDesc,
                  decoration: InputDecoration(
                      hintText: "Enter Desc".tr,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: CustomTheme.theamColor))),
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return "Enter Description".tr;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    if (value.length > 5000) {
                      textEditingControllerDesc.text = value.substring(0, 5000);
                      textEditingControllerDesc.selection =
                          TextSelection.fromPosition(
                        TextPosition(
                            offset: textEditingControllerDesc.text.length),
                      );
                    }
                    setState(() {});
                  },
                ),
                Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      "${textEditingControllerDesc.text.length}/5000",
                      style: TextStyle(fontFamily: FontStyles.gilroyMedium),
                    )),
                SizedBox(
                  height: 16,
                ),

                counterWidget('Total Beds'.tr),
                counterWidget('Total Bathroom'.tr),
                counterWidget('Total Person Allowed?'.tr),
                headingText('Property m2'.tr),
                textField(textEditingControllerArea, "Enter Area".tr, false,
                    "Enter Area".tr, TextInputType.number),
                headingText('Property Type'.tr),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    isExpanded: true,
                    items: listPropertyType.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: Text(value.name!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      print(value);
                      selectedPropertyType = value!;
                      setState(() {});
                    },
                    value: selectedPropertyType,
                    hint: Text("Select Property Type".tr),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),
                headingText('Full Address'.tr),
                GooglePlaceAutoCompleteTextField(
                  textEditingController: textEditingControllerAddress,
                  googleAPIKey: Config.googleKey,
                  countries: ["CI"],
                  inputDecoration: InputDecoration(
                      hintText: "Enter Address".tr, border: InputBorder.none),
                  isLatLngRequired: true,
                  getPlaceDetailWithLatLng: (Prediction prediction) {
                    selectedLat = prediction.lat.toString();
                    selectedLong = prediction.lng;
                    print(selectedLat);
                    print(selectedLong);
                    getPlaceDetailFromId(prediction.placeId);
                  },
                  itemClick: (Prediction prediction) {
                    textEditingControllerAddress.text = prediction.description!;
                    textEditingControllerAddress.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: prediction.description!.length));
                  },
                  seperatedBuilder: Divider(
                    color: CustomTheme.theamColor,
                    thickness: 1,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                headingText('Zip Code'.tr),
                textField(textEditingControllerZip, "Enter Zip code".tr, false,
                    "Enter Zip code".tr, TextInputType.number),

                headingText('City'.tr),
                Container(
                  padding: EdgeInsets.only(left: 12, right: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton<String>(
                    underline: SizedBox(),
                    isExpanded: true,
                    items: listLocation.map((value) {
                      return DropdownMenuItem<String>(
                        value: value.id.toString(),
                        child: Text(value.cityName!),
                      );
                    }).toList(),
                    onChanged: (value) {
                      selectedCityName = value!;
                      setState(() {});
                    },
                    value: selectedCityName,
                    hint: Text("Select City"),
                  ),
                ),

                SizedBox(
                  height: 16,
                ),

                headingText('Price per night'.tr),
                textField(textEditingControllerPrice, "Enter price".tr, false,
                    "Enter price".tr, TextInputType.number),

                headingText('Weekly discount'.tr),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Expanded(child: textField(TextEditingController(),"Enter discount",false,"Enter Discount",TextInputType.number)),
                    Expanded(
                      child: TextFormField(
                        controller: textEditingControllerWeekDiscount,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            hintText: "Enter discount".tr,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: CustomTheme.theamColor))),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Enter discount".tr;
                          } else if (value!.length > 1) {
                            print("aaaa");
                            if (value.startsWith("0")) {
                              textEditingControllerWeekDiscount.text =
                                  value.substring(1, value.length);
                              textEditingControllerWeekDiscount.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: textEditingControllerWeekDiscount
                                        .text.length),
                              );
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 12, right: 16, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          isExpanded: true,
                          items: ['percent'.tr, 'fixed'.tr].map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedWeeklyDiscountType = value!;
                            setState(() {});
                          },
                          value: selectedWeeklyDiscountType,
                          hint: Text("Select Discount".tr),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                headingText('Monthly discount'.tr),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Expanded(child: textField(TextEditingController(),"Enter discount",false,"Enter Discount",TextInputType.number)),
                    Expanded(
                      child: TextFormField(
                        controller: textEditingControllerMonthDiscount,
                        textCapitalization: TextCapitalization.sentences,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                            hintText: "Enter discount".tr,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide:
                                    BorderSide(color: CustomTheme.theamColor))),
                        validator: (value) {
                          if (value != null && value.isEmpty) {
                            return "Enter discount".tr;
                          }
                          if (value!.length > 1) {
                            if (value.startsWith("0")) {
                              textEditingControllerMonthDiscount.text =
                                  value.substring(1, value.length);
                              textEditingControllerMonthDiscount.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: textEditingControllerMonthDiscount
                                        .text.length),
                              );
                            }
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 12, right: 16, top: 4, bottom: 4),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10)),
                        child: DropdownButton<String>(
                          underline: SizedBox(),
                          isExpanded: true,
                          items: ['percent'.tr, 'fixed'.tr].map((value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (value) {
                            selectedMonthlyDiscountType = value!;
                            setState(() {});
                          },
                          value: selectedMonthlyDiscountType,
                          hint: Text("Select Discount".tr),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),

                headingText("Amenities".tr),
                listAmenities.isEmpty
                    ? Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: listAmenities.length,
                        itemBuilder: (itemBuilder, index) {
                          return Column(
                            children: [
                              Obx(() => Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(
                                            width: 20,
                                            child: Checkbox(
                                              activeColor:
                                                  CustomTheme.theamColor,
                                              value: selectedAmenitiesList
                                                  .contains(listAmenities
                                                      .elementAt(index)
                                                      .id!),
                                              onChanged: (bool? value) {
                                                if (selectedAmenitiesList
                                                    .contains(listAmenities
                                                        .elementAt(index)
                                                        .id!)) {
                                                  selectedAmenitiesList.remove(
                                                      listAmenities
                                                          .elementAt(index)
                                                          .id!);
                                                } else {
                                                  selectedAmenitiesList.add(
                                                      listAmenities
                                                          .elementAt(index)
                                                          .id!);
                                                }
                                              },
                                            ),
                                          ),
                                          SizedBox(
                                            width: 16,
                                          ),
                                          Text(listAmenities
                                              .elementAt(index)
                                              .name!)
                                        ],
                                      ),
                                      SizedBox(
                                          height: 25,
                                          width: 25,
                                          child: myNetworkImage(
                                              listAmenities[index].image!)),
                                    ],
                                  )),
                              Container(
                                width: Get.width,
                                color: CustomTheme.theamColor,
                                height: 1,
                              )
                            ],
                          );
                        },
                      ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    headingText("Front Image".tr),
                    frontImagePopup("Change".tr),
                  ],
                ),
                frontImagePopup(""),

                SizedBox(
                  height: 32,
                ),
                widget.properties == null
                    ? SizedBox()
                    : widget.properties!.gallery!.isEmpty
                        ? SizedBox()
                        : headingText("Previous Gallery Images".tr),
                // widget.properties==null?SizedBox():SizedBox(height: 150,
                //   child: ListView.builder(itemCount: widget.properties!.gallery!.length,scrollDirection: Axis.horizontal,itemBuilder: (itemBuilder,index){
                //     return Container(child: Image.network(widget.properties!.gallery![index].url!),);
                //   }),
                // ),
                widget.properties == null
                    ? SizedBox()
                    : widget.properties!.gallery!.isEmpty
                        ? SizedBox()
                        : Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: notifire.getblackwhitecolor,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: greyColor),
                            ),
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.properties!.gallery!.length,
                              itemBuilder: (itemBuilder, index) {
                                return Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 16, bottom: 16, left: 16),
                                      child: InkWell(
                                        onTap: () {
                                          Get.to(() => SeeImageFullScreen(
                                              image: widget.properties!
                                                  .gallery![index].url!));
                                        },
                                        child: SizedBox(
                                          width: Get.width / 3,
                                          height: 134,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  border: Border.all()),
                                              child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image.network(
                                                    widget.properties!
                                                        .gallery![index].url!,
                                                    fit: BoxFit.fill,
                                                  ))),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                        right: 0,
                                        top: 10,
                                        child: InkWell(
                                            onTap: () {
                                              dialogExit(BuildContext context) {
                                                return showDialog<void>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    return AlertDialog(
                                                      // title: Text('Are you sure?'.tr,style: TextStyle(color: CustomTheme.theamColor,fontSize: 16, fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.w700),),
                                                      content:
                                                          SingleChildScrollView(
                                                        child: ListBody(
                                                          children: <Widget>[
                                                            Icon(
                                                              Icons.error,
                                                              size: 75,
                                                              color: Colors.red,
                                                            ),
                                                            Text(
                                                              'Do you want to Delete Image?'
                                                                  .tr,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    FontStyles
                                                                        .gilroyMedium,
                                                              ),
                                                            ),
                                                            // Text('Would you like to approve of this message?'),
                                                          ],
                                                        ),
                                                      ),
                                                      actions: <Widget>[
                                                        Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Expanded(
                                                                    child: InkWell(
                                                                        onTap: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                        },
                                                                        child: Container(
                                                                            margin: EdgeInsets.only(left: 8, right: 8),
                                                                            padding: EdgeInsets.all(10),
                                                                            decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
                                                                            child: Center(
                                                                                child: Text(
                                                                              "Cancel".tr,
                                                                              style: TextStyle(
                                                                                fontFamily: FontStyles.gilroyMedium,
                                                                              ),
                                                                            ))))),
                                                                Expanded(
                                                                    child: InkWell(
                                                                        onTap: () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          listDeleteImages.add(widget
                                                                              .properties!
                                                                              .gallery![index]
                                                                              .url);
                                                                          widget
                                                                              .properties!
                                                                              .gallery!
                                                                              .removeAt(index);
                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        child: Container(
                                                                            margin: EdgeInsets.only(left: 8, right: 8),
                                                                            padding: EdgeInsets.all(10),
                                                                            decoration: BoxDecoration(border: Border.all(color: CustomTheme.theamColor), color: CustomTheme.theamColor, borderRadius: BorderRadius.circular(10)),
                                                                            child: Center(
                                                                                child: Text(
                                                                              "Yes".tr,
                                                                              style: TextStyle(color: Colors.white, fontFamily: FontStyles.gilroyMedium, fontWeight: FontWeight.bold),
                                                                            ))))),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 8,
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              dialogExit(context);
                                            },
                                            child: Container(
                                                padding: EdgeInsets.all(3),
                                                decoration: BoxDecoration(
                                                    color: Colors
                                                        .redAccent.shade200,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20)),
                                                child: Icon(
                                                  Icons.delete_forever_rounded,
                                                  color: Colors.white,
                                                ))))
                                  ],
                                );
                              },
                            )),
                SizedBox(
                  height: 16,
                ),
                widget.properties != null &&
                        widget.properties!.gallery!.isNotEmpty &&
                        widget.properties!.gallery!.length == 5
                    ? SizedBox()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          headingText("Gallery Images".tr),
                          galleryImagePopup("Add".tr),
                        ],
                      ),
                widget.properties != null &&
                        widget.properties!.gallery!.isNotEmpty &&
                        widget.properties!.gallery!.length == 5
                    ? SizedBox()
                    : galleryImagePopup(""),

                widget.properties != null &&
                        widget.properties!.gallery!.isNotEmpty &&
                        widget.properties!.gallery!.length == 5
                    ? SizedBox()
                    : SizedBox(
                        height: 8,
                      ),

                Text(
                  "Select Upto ${widget.properties != null ? widget.properties!.gallery!.length + galleryImageList.length : ''}${widget.properties != null ? '' : galleryImageList.length}/5 images"
                      .tr
                      .tr,
                  style: TextStyle(fontFamily: FontStyles.gilroyMedium),
                ),

                SizedBox(
                  height: 16,
                ),
                headingText("Property status".tr),

                SizedBox(
                  width: Get.size.width,
                  height: 400,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Obx(
                        () => qwer.value.isEmpty
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: CircularProgressIndicator(),
                                  ),
                                ],
                              )
                            : calender(),

                        // SfDateRangePicker(
                        //         selectionShape:
                        //             DateRangePickerSelectionShape.circle,
                        //         endRangeSelectionColor: Colors.transparent,
                        //         startRangeSelectionColor: Colors.transparent,
                        //         rangeSelectionColor: Colors.transparent,
                        //         controller: dateRangePickerController,
                        //         onSelectionChanged: onSelectionChanged,
                        //         selectionMode:
                        //             DateRangePickerSelectionMode.range,
                        //         initialSelectedRange: PickerDateRange(
                        //             DateTime.parse("2023-09-20"),
                        //             DateTime.parse("2023-09-25")),
                        //         enablePastDates: false,
                        //         headerStyle: DateRangePickerHeaderStyle(
                        //           textStyle: TextStyle(
                        //             fontFamily: FontStyles.gilroyBlack,
                        //             color: notifire.getwhiteblackcolor,
                        //           ),
                        //         ),
                        //         monthViewSettings:
                        //             DateRangePickerMonthViewSettings(
                        //           blackoutDates: alreadySelectedList,
                        //         ),
                        //         monthCellStyle: DateRangePickerMonthCellStyle(
                        //             blackoutDateTextStyle: TextStyle(
                        //               color: Colors.white,
                        //             ),
                        //             blackoutDatesDecoration: BoxDecoration(
                        //                 shape: BoxShape.circle,
                        //                 color: Colors.redAccent.shade100)),
                        //         cellBuilder: (BuildContext context,
                        //             DateRangePickerCellDetails cellDetails) {
                        //           final date = cellDetails.date;
                        //
                        //           return Padding(
                        //             padding: const EdgeInsets.all(5.0),
                        //             child: Container(
                        //               alignment: Alignment.center,
                        //               decoration: BoxDecoration(
                        //                   border: Border.all(
                        //                       color: cellDetails.date
                        //                               .isBefore(DateTime.now())
                        //                           ? Color.fromARGB(
                        //                               255, 194, 193, 193)
                        //                           : CustomTheme.theamColor,
                        //                       width: 1.0,
                        //                       style: BorderStyle.solid),
                        //                   borderRadius:
                        //                       BorderRadius.circular(5),
                        //                   color: alreadySelectedList
                        //                           .contains(cellDetails.date)
                        //                       ? Colors.green
                        //                       : toggle.value == 0 &&
                        //                               startDate ==
                        //                                   cellDetails.date
                        //                           ? Colors.red
                        //                           : endDate != null &&
                        //                                   endDate ==
                        //                                       cellDetails
                        //                                           .date &&
                        //                                   toggle.value == 0
                        //                               ? Colors.red
                        //                               : startDate != null &&
                        //                                       startDate!.isBefore(
                        //                                           cellDetails.date) &&
                        //                                       endDate != null &&
                        //                                       endDate!.isAfter(cellDetails.date) &&
                        //                                       toggle.value == 0
                        //                                   ? Colors.red
                        //                                   : startDate == cellDetails.date
                        //                                       ? CustomTheme.theamColor
                        //                                       : endDate == null
                        //                                           ? Colors.transparent
                        //                                           : endDate == cellDetails.date
                        //                                               ? CustomTheme.theamColor
                        //                                               : startDate!.isBefore(cellDetails.date) && endDate!.isAfter(cellDetails.date)
                        //                                                   ? CustomTheme.theamColor
                        //                                                   : Colors.transparent),
                        //               child: Column(
                        //                 mainAxisSize: MainAxisSize.min,
                        //                 children: [
                        //                   Text(
                        //                     cellDetails.date.day.toString(),
                        //                     style: TextStyle(
                        //                         color: cellDetails.date
                        //                                 .isBefore(
                        //                                     DateTime.now())
                        //                             ? Color.fromARGB(
                        //                                 255, 194, 193, 193)
                        //                             : BlackColor),
                        //                   ),
                        //                   Text(
                        //                     "${generalDataModel!.data!.metaData!.generalDefaultCurrency!} ${startDate == cellDetails.date ? futurePrice : endDate == null ? textEditingControllerPrice.text : endDate == cellDetails.date ? futurePrice : startDate!.isBefore(cellDetails.date) && endDate!.isAfter(cellDetails.date) ? futurePrice : textEditingControllerPrice.text}",
                        //                     style: TextStyle(
                        //                         fontSize: 8,
                        //                         color: cellDetails.date
                        //                                 .isBefore(
                        //                                     DateTime.now())
                        //                             ? Color.fromARGB(
                        //                                 255, 194, 193, 193)
                        //                             : BlackColor),
                        //                     textAlign: TextAlign.center,
                        //                   ),
                        //                 ],
                        //               ),
                        //             ),
                        //           );
                        //         },
                        //       ),
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      Wrap(
                        runSpacing: 8,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                    height: 10,
                                    width: 10,
                                    color: Colors.red,
                                  )),
                              SizedBox(width: 5),
                              Text(
                                "Not Available",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                      height: 10,
                                      width: 10,
                                      color: CustomTheme.theamColor)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Availbale",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Container(
                                      height: 10,
                                      width: 10,
                                      color: greenColor)),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Booked",
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
                futureDateListBuild(),
                // Column(
                //   children: [
                //     SizedBox(
                //       height: 8,
                //     ),
                //     startDate == null
                //         ? SizedBox()
                //         : Padding(
                //           padding: const EdgeInsets.only(top: 8.0),
                //           child: Row(
                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //               children: [
                //                 Text(
                //                   "${DateFormat("yyyy/MM/dd").format(startDate!)}${endDate != null ? " - " + DateFormat("yyyy/MM/dd").format(endDate!) : ''}",
                //                   style: TextStyle(
                //                       fontFamily: FontStyles.gilroyMedium,
                //                       fontWeight: FontWeight.w700),
                //                 ),
                //                 Text("Active",style: TextStyle(fontFamily: FontStyles.gilroyMedium,),)
                //                 // ToggleSwitch(
                //                 //   minWidth: 60.0,
                //                 //   cornerRadius: 10.0,
                //                 //   activeBgColors: [
                //                 //     [Colors.red],
                //                 //     [CustomTheme.theamColor]
                //                 //   ],
                //                 //   activeFgColor: Colors.white,
                //                 //   inactiveBgColor: Colors.white,
                //                 //   inactiveFgColor: Colors.black,
                //                 //   changeOnTap: true,
                //                 //   initialLabelIndex: toggle.value,
                //                 //   borderWidth: 1,
                //                 //   borderColor: [CustomTheme.theamColor],
                //                 //   totalSwitches: 2,
                //                 //   labels: ['Close'.tr, 'Open'.tr],
                //                 //   radiusStyle: true,
                //                 //   onToggle: (ind) {
                //                 //     print('switched to: $ind'.tr);
                //                 //
                //                 //     toggle.value = ind!;
                //                 //
                //                 //     FocusScope.of(context)
                //                 //         .requestFocus(focusNode);
                //                 //
                //                 //     qwer.value = "";
                //                 //     Future.delayed(Duration(milliseconds: 100),
                //                 //         () {
                //                 //       qwer.value = "0";
                //                 //     });
                //                 //   },
                //                 // )
                //               ],
                //             ),
                //         ),
                //     startDate == null
                //         ? SizedBox()
                //         : SizedBox(
                //             height: 16,
                //           ),
                //     startDate == null
                //         ? SizedBox()
                //         : Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Text(
                //                 "Price per night".tr,
                //                 style: TextStyle(
                //                     fontFamily: FontStyles.gilroyMedium,
                //                     fontWeight: FontWeight.w700),
                //               ),
                //               SizedBox(
                //                 width: 120,
                //                 child: Container(
                //                     padding: EdgeInsets.all(8),
                //                     decoration: BoxDecoration(
                //                         border: Border.all(color: Colors.grey),
                //                         borderRadius:
                //                             BorderRadius.circular(10)),
                //                     child: TextField(
                //                       focusNode: focusNode,
                //                       controller:
                //                           textEditingControllerFuturePrice,
                //                       keyboardType: TextInputType.number,
                //                       decoration: InputDecoration.collapsed(
                //                           hintText: "Price".tr,
                //                           border: InputBorder.none),
                //                       onChanged: (vale) {
                //                         futurePrice = vale;
                //                         qwer.value = "";
                //                         Future.delayed(
                //                             Duration(milliseconds: 100), () {
                //                           qwer.value = "0";
                //                         });
                //                       },
                //                     )),
                //               )
                //             ],
                //           ),
                //     SizedBox(
                //       height: 8,
                //     ),
                //   ],
                // ),

                SizedBox(
                  height: 16,
                ),
                headingText("Cancellation policies".tr),
                SizedBox(
                  height: 8,
                ),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: listCancellationPolicies.length,
                  itemBuilder: (itemBuilder, index) {
                    return Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(10),
                      shadowColor: CustomTheme.theamColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, bottom: 16, left: 8, right: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: Radio(
                                        activeColor: CustomTheme.theamColor,
                                        value: index,
                                        onChanged: (value) {
                                          selectedRadio = index;
                                          setState(() {});
                                        },
                                        groupValue: selectedRadio,
                                      )),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Expanded(
                                      child: Text(
                                          listCancellationPolicies[index]
                                              .name
                                              .toString())),
                                ],
                              ),
                            ),
                            InkWell(
                                onTap: () {
                                  showBottomSheetDescription(
                                      context, listCancellationPolicies[index]);
                                },
                                child: Text("View>".tr,
                                    style: TextStyle(
                                        color: CustomTheme.theamColor,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                ),

                SizedBox(
                  height: 24,
                ),

                // SizedBox(height: 32,),
                GestButton(
                  buttoncolor: blueColor,
                  buttontext:
                      widget.properties != null ? "Update".tr : "Submit".tr,
                  style: TextStyle(
                    fontFamily: FontStyles.gilroyBold,
                    color: WhiteColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  onclick: () {
                    print("submit");
                    widget.properties == null ? submitMethod() : updateMethod();
                    print(widget.properties);
                  },
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  headingText(text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontFamily: FontStyles.gilroyMedium,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  textField(controller, hint, isDesc, validateText, keyboardType) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: keyboardType,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        maxLines: isDesc == true ? 12 : 1,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: CustomTheme.theamColor))),
        validator: (value) {
          if (value != null && value.isEmpty) {
            return validateText;
          } else if (value != null &&
              value.isNotEmpty &&
              hint == "Price per night".tr) {
            if (int.parse(value) < 1) {
              return "Price should greater than 1".tr;
            }
          }
          return null;
        },
        onChanged: (value) {
          if (hint == "Enter price".tr) {
            qwer.value = "";
            Future.delayed(Duration(milliseconds: 100), () {
              qwer.value = "0";
            });
          }
        },
      ),
    );
  }

  counterWidget(text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontFamily: FontStyles.gilroyMedium,
                fontWeight: FontWeight.w700),
          ),
          Row(
            children: [
              InkWell(
                onTap: () {
                  print(text);
                  setState(() {
                    if (text == "Total Beds".tr) {
                      if (totalBeds > 1) {
                        totalBeds = totalBeds - 1;
                      }
                    } else if (text == "Total Bathroom".tr) {
                      if (totalBathroom > 1) {
                        totalBathroom = totalBathroom - 1;
                      }
                    } else if (text == "Total Person Allowed?".tr) {
                      if (totalAllowed > 1) {
                        totalAllowed = totalAllowed - 1;
                      }
                    }
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
              SizedBox(
                width: 16,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "${text == "Total Beds" ? totalBeds : text == "Total Bathroom" ? totalBathroom : totalAllowed}"
                      .tr,
                  // "${bookrealEstateController.count}",
                  style: TextStyle(
                      color: notifire.getwhiteblackcolor,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (text == "Total Beds".tr) {
                      totalBeds++;
                    } else if (text == "Total Bathroom".tr) {
                      totalBathroom++;
                    } else if (text == "Total Person Allowed?".tr) {
                      totalAllowed++;
                    }
                  });
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
              )
            ],
          )
        ],
      ),
    );
  }

  Widget frontImagePopup(text) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () async {
            selectImageWithSource(ImageSource.camera);
          },
          child: Text(
            "Select with camera".tr,
            style: TextStyle(color: BlackColor, fontWeight: FontWeight.w700),
          ),
        ),
        PopupMenuItem(
          onTap: () async {
            selectImageWithSource(ImageSource.gallery);
          },
          child: Text(
            "Select with Gallery".tr,
            style: TextStyle(color: BlackColor, fontWeight: FontWeight.w700),
          ),
        ),
      ],
      child: text == "Change".tr
          ? Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                frontImage != null ||
                        (widget.properties != null &&
                            widget.properties!.frontImage != null)
                    ? "Change".tr
                    : "",
                style: TextStyle(
                    color: CustomTheme.theamColor,
                    fontSize: 16,
                    fontFamily: FontStyles.gilroyMedium,
                    fontWeight: FontWeight.w700),
              ),
            )
          : Container(
              height: 200,
              child: Center(
                child: frontImage != null ||
                        (widget.properties != null &&
                            widget.properties!.frontImage != null)
                    ? SizedBox(
                        width: Get.width,
                        child: InkWell(
                          onTap: () {
                            Get.to(() => SeeImageFullScreen(
                                image: widget.properties!.frontImage!.url
                                        .toString() ??
                                    frontImage!.path));
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: (widget.properties != null &&
                                      widget.properties!.frontImage != null &&
                                      frontImage == null)
                                  ? Image.network(
                                      widget.properties!.frontImage!.url!,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.file(
                                      File(frontImage!.path),
                                      fit: BoxFit.fill,
                                    )),
                        ),
                      )
                    : Image.asset('assets/images/Upload.png'),
              ),
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: greyColor),
              ),
            ),
      // Container(
      //   height: 40,
      //   width: 40,
      //   child: Image.asset('assets/images/Upload.png'),
      //   padding: const EdgeInsets.all(7),
      // ),
      offset: const Offset(1, 50),
    );
  }

  Widget galleryImagePopup(text) {
    return PopupMenuButton<int>(
      itemBuilder: (context) => galleryImageList.length > 4
          ? []
          : [
              // PopupMenuItem(
              //   onTap: () async {
              //     selectMultipleImageWithSource(ImageSource.camera);
              //   },
              //   child: Text(
              //     "Select with camera",
              //     style: TextStyle(color: BlackColor, fontWeight: FontWeight.w700),
              //   ),
              // ),
              PopupMenuItem(
                onTap: () async {
                  selectMultipleImageWithSource(ImageSource.gallery);
                },
                child: Text(
                  "Select with Gallery".tr,
                  style:
                      TextStyle(color: BlackColor, fontWeight: FontWeight.w700),
                ),
              ),
            ],
      offset: const Offset(1, 50),
      child: text == "Add".tr
          ? Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: galleryImageList.length +
                              (widget.properties != null
                                  ? widget.properties!.gallery!.length
                                  : 0) ==
                          5
                      ? SizedBox()
                      : Text(
                          galleryImageList.isNotEmpty &&
                                  galleryImageList.length < 5
                              ? "Add".tr
                              : galleryImageList.length == 5
                                  ? ""
                                  : "",
                          style: TextStyle(
                              color: CustomTheme.theamColor,
                              fontSize: 16,
                              fontFamily: FontStyles.gilroyMedium,
                              fontWeight: FontWeight.w700),
                        ),
                ),
              ],
            )
          : Container(
              height: 150,
              decoration: BoxDecoration(
                color: notifire.getblackwhitecolor,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: greyColor),
              ),
              child: Center(
                child: galleryImageList.isNotEmpty
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: galleryImageList.length,
                        itemBuilder: (itemBuilder, index) {
                          return Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 16, bottom: 16, left: 16),
                                child: InkWell(
                                  onTap: () {
                                    Get.to(() => SeeImageFullScreen(
                                        image: galleryImageList[index].path));
                                  },
                                  child: SizedBox(
                                    width: Get.width / 3,
                                    height: 134,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          border: Border.all()),
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.file(
                                            File(galleryImageList[index].path),
                                            fit: BoxFit.fill,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  top: 10,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: InkWell(
                                          onTap: () {
                                            galleryImageList.removeAt(index);
                                            galleryImageBase64List
                                                .removeAt(index);
                                            setState(() {});
                                          },
                                          child: Container(
                                              padding: EdgeInsets.all(3),
                                              color: Colors.redAccent.shade200,
                                              child: Icon(
                                                Icons.delete_forever_rounded,
                                                color: Colors.white,
                                              )))))
                            ],
                          );
                        },
                      )
                    : Image.asset('assets/images/Upload.png'),
              ),
            ),
    );
  }

  selectImageWithSource(source) async {
    var image = await ImagePicker().pickImage(source: source);

    if (image == null) {
      return;
    }
    frontImage = image;
    setState(() {});
    var bytes = await File(image.path).readAsBytes();
    var base64Image = base64Encode(bytes);

    String format = '';
    if (bytes.length > 8) {
      if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
        format = 'jpeg';
      } else if (bytes[0] == 0x89 && bytes[1] == 0x50) {
        format = 'png';
      }
    }
    frontImageBase64 = "data:image/$format;base64,$base64Image";
  }

  selectMultipleImageWithSource(source) async {
    List<XFile> image = await ImagePicker().pickMultiImage();

    if (image.isEmpty) {
      return;
    }
    for (int i = 0; i < image.length; i++) {
      if (i < 5) {
        var bytes = await File(image[i].path).readAsBytes();
        var base64Image = base64Encode(bytes);
        String format = '';
        if (bytes.length > 8) {
          if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
            format = 'jpeg';
          } else if (bytes[0] == 0x89 && bytes[1] == 0x50) {
            format = 'png';
          }
        }
        int totalLength = galleryImageList.length;
        if (widget.properties != null) {
          totalLength =
              galleryImageList.length + widget.properties!.gallery!.length;
        }
        if (totalLength < 5) {
          galleryImageList.add(image[i]);
          galleryImageBase64List.add("data:image/$format;base64,$base64Image");
        }
        setState(() {});
      }
    }
  }

  showBottomSheetDescription(
      BuildContext context, CancellationPolicies cancellationPolicies) async {
    showModalBottomSheet(
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ConstrainedBox(
                // color: Colors.white,
                constraints: BoxConstraints(minHeight: 200),
                child: Column(
                  children: [
                    Text(
                      textAlign: TextAlign.justify,
                      "${cancellationPolicies.name}",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      textAlign: TextAlign.justify,
                      "${cancellationPolicies.description}",
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                )),
          ),
        );
      },
    );
  }

  getPlaceDetailFromId(placeId) async {
    // textEditingControllerZip.text="";
    // country="";
    // state="";
    // city="";
    final request =
        'https://maps.googleapis.com/maps/api/geocode/json?place_id=$placeId&key=${Config.googleKey}';
    print(request);
    final response = await http.get(Uri.parse(request));

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      // print(result['result']);
      if (result['status'] == 'OK') {
        final components =
            result['results'][0]['address_components'] as List<dynamic>;
        for (var x in components) {
          // print(x['types']);
          if (x['types'].toString().contains('postal_code')) {
            if (x['long_name'] != null) {
              textEditingControllerZip.text = x['long_name'];
            }

            print("zip ${textEditingControllerZip.text}");
          }
          if (x['types'].toString().contains('country')) {
            if (x['long_name'] != null) {
              country = x['long_name'];
            }

            print("Country  $country");
          }
          if (x['types'].toString().contains('administrative_area_level_1')) {
            if (x['long_name'] != null) {
              state = x['long_name'];
            }
            print("State $state");
          }
          if (x['types'].toString().contains('administrative_area_level_3')) {
            if (x['long_name'] != null) {
              city = x['long_name'];
            }

            print("City $city");
          }
        }
        // print(components);
        // build result
        // final place = Place();
        // components.forEach((c) {
        //   final List type = c['types'];
        //   if (type.contains('street_number')) {
        //     place.streetNumber = c['long_name'];
        //   }
        //   if (type.contains('route')) {
        //     place.street = c['long_name'];
        //   }
        //   if (type.contains('locality')) {
        //     place.city = c['long_name'];
        //   }
        //   if (type.contains('postal_code')) {
        //     place.zipCode = c['long_name'];
        //   }
        // });
        // return place;
      }
      // throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion'.tr);
    }
  }
}
