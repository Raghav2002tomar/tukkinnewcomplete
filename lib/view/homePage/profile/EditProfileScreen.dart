import 'dart:convert';
import 'dart:io';
import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/DataStore.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/CustomToast.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/LoginModel.dart';
import 'package:Tukki/model/UpdateProfile.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/addproperty/SeeImageFullScreen.dart';
import 'package:Tukki/view/auth/PhoneUpdateScreen.dart';
import 'package:Tukki/view/homePage/profile/ChangeEmailScreen.dart';
import 'package:Tukki/workspace.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:Tukki/model/LoginModel.dart' as logmod;

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerFirstName =
      TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerMobile = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerphoneCountry =
      TextEditingController();
  TextEditingController textEditingControllerDOB = TextEditingController();
  TextEditingController textEditingControllerLanguage = TextEditingController();
  TextEditingController textEditingControllerDescription = TextEditingController();
  var cameraImage;
  var galleryImage;
  String selectedCountry = "+225";
  bool loading = false;
  List listCountry=[];
  String? selectedCountryDrop;

  String? selectedIdentityImage;

  String? identityBase64;

  @override
  void initState() {
    super.initState();

    print(generalController.myImage.value);
    DefaultAssetBundle.of(context).loadString("assets/json/countries.json").then((value){
      listCountry = jsonDecode(value);
      print(listCountry);
      setState(() {
      });
    });



    textEditingControllerFirstName.text = loginModel!.data!.firstName!;
    textEditingControllerLastName.text = loginModel!.data!.lastName!;
    textEditingControllerEmail.text = loginModel!.data!.email!;
    textEditingControllerMobile.text = loginModel!.data!.phone!;
    textEditingControllerphoneCountry.text = loginModel!.data!.phoneCountry!;

    textEditingControllerPassword.text = loginModel!.data!.firstName!;
    if (loginModel!.data!.birthdate != null) {
      textEditingControllerDOB.text = loginModel!.data!.birthdate!;
    }
    selectedCountry = loginModel!.data!.phoneCountry!;
    if(loginModel!.data!.intro!=null){
      textEditingControllerDescription.text=loginModel!.data!.intro;
    }
    if(loginModel!.data!.langauge!=null){
      textEditingControllerLanguage.text=loginModel!.data!.langauge;
    }
    if(loginModel!.data!.country!=null && loginModel!.data!.country.toString().isNotEmpty){
      selectedCountryDrop=loginModel!.data!.country;
      print(loginModel!.data!.country);
      print("xxxxxx");
    }
    print(loginModel!.data!.identityImage);
    setState(() {});
    print("========== ====== ");
    print(loginModel!.data!.identityImage);
  }

  updateProfileData() async {
    // if(!key.currentState!.validate()){
    //   return;
    // }
    if (textEditingControllerFirstName.text.isEmpty) {
      showErrorToastMessage("Invalid First Name".tr);
      return;
    }
    if (textEditingControllerFirstName.text.isEmpty) {
      showErrorToastMessage("Invalid Last Name".tr);
      return;
    }
    loading = true;
    setState(() {});

    Map<String, String> postData = {
      "email": textEditingControllerEmail.text,
      "first_name": textEditingControllerFirstName.text,
      "last_name": textEditingControllerLastName.text,
      "phone_country": selectedCountry,
      "phone": textEditingControllerphoneCountry.text,
      "birthdate": textEditingControllerDOB.text,
      "intro":textEditingControllerDescription.text,
      "langauge":textEditingControllerLanguage.text,
      "country":selectedCountryDrop??"",
      "identity_image":identityBase64??""
    };

    var response = await httpPost(Config.editProfile, postData);
    loading = false;
    setState(() {});
    if (response != null) {
      if (response['status'] == 200) {
        // loginModel!.data!.firstNameSetter = textEditingControllerFirstName.text;
        // loginModel!.data!.lastNameSetter = textEditingControllerLastName.text;
        // loginModel!.data!.birthdateSetter = textEditingControllerDOB.text;
        // loginModel!.data!.languageSetter = textEditingControllerLanguage.text;
        // loginModel!.data!.introSetter = textEditingControllerDescription.text;
        // loginModel!.data!.countrySetter = selectedCountryDrop??"";
        // loginModel!.data!.identitySetter = selectedCountryDrop??"";

        UpdateProfile updateProfile=UpdateProfile.fromJson(response);
        logmod.Data.fromJson(updateProfile.data!.user!.toJson());
        loginModel=LoginModel(data: logmod.Data.fromJson(updateProfile.data!.user!.toJson())) ;
        UserData userObj = UserData();
        userObj.saveLoginData("UserData", jsonEncode(loginModel!.toJson()));
        generalController.myName.value = textEditingControllerFirstName.text;

        showToastMessage(response['message']);
      } else {
        showToastMessage(response['error']);
      }
    }
  }

  uploadProfileMethod(image) async {
    controller.isUploadingImage.value = true;
    var response =
        await httpPost(Config.uploadProfileImage, {"profile_image": image});
    // var result = await http.post(Uri.parse(Config.baseurl+Config.uploadProfileImage), body: {"profile_image":image,'token':token});
    // var response=jsonDecode(result.body);
    controller.isUploadingImage.value = false;

    if (response != null) {
      if (response['status'] == 200) {
        loginModel!.data!.profileImageSetter =
            response['data']['profile_image_url'];
        generalController.myImage.value = response['data']['profile_image_url'];
        UserData userObj = UserData();
        userObj.saveLoginData("UserData", jsonEncode(loginModel!.toJson()));
      } else {
        showToastMessage(response['error']);
      }
    }
  }

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
          title: Text(
            'Edit Personal Info'.tr,
            style: TextStyle(
                fontSize: 17,
                fontFamily: FontStyles.gilroyBold,
                color: notifire.getwhiteblackcolor),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        width: 120,
                        child: Stack(
                          children: [
                            cameraImage == null &&
                                    galleryImage == null &&
                                    loginModel!.data!.profileImage != null
                                ?
                                // CircleAvatar(foregroundImage: NetworkImage(loginModel!.data!.profileImage['url']),radius: 120,):
                                SizedBox(
                                    height: 120,
                                    width: 120,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(60),
                                      child: CachedNetworkImage(
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            '${generalController.myImage.value}',
                                        errorWidget:
                                            (context, exception, stackTrace) {
                                          return const Icon(
                                            Icons.account_circle_rounded,
                                            size: 120,
                                          );
                                        },
                                      ),
                                    ))
                                : cameraImage == null && galleryImage == null
                                    ? CircleAvatar(
                                        backgroundColor: Colors.grey,
                                        radius: 120,
                                        child: Image.asset(
                                            "assets/images/user.png"),
                                      )
                                    : Stack(
                                        children: [
                                          CircleAvatar(
                                            radius: 120,
                                            foregroundImage: FileImage(File(
                                                cameraImage != null
                                                    ? cameraImage!.path!
                                                    : galleryImage!.path!)),
                                          ),
                                          Obx(() => controller
                                                  .isUploadingImage.value
                                              ? const Center(
                                                  child:
                                                      CircularProgressIndicator())
                                              : const SizedBox())
                                        ],
                                      ),
                            Positioned(
                              bottom: 5,
                              right: 0,
                              child: InkWell(
                                  onTap: () {
                                    print("image");
                                    selectImagePopup();
                                  },
                                  child: selectImagePopup()),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                   Text(
                    "First Name".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myWidget("First Name".tr, "Please enter your first name".tr,
                      textEditingControllerFirstName, false),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    "Last Name".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myWidget("Last Name".tr, "Please enter your last name".tr,
                      textEditingControllerLastName, false),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Mobile Phone".tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: CustomTheme.theamColor,
                            fontWeight: FontWeight.w700),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(() => PhoneUpdateScreen(fromProfile: true,));
                        },
                        child: Text("Change".tr,
                            style: TextStyle(
                                fontSize: 16,
                                color: CustomTheme.theamColor,
                                fontWeight: FontWeight.w700)),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  IntlPhoneField(
                    enabled: false,
                    showDropdownIcon: true,
                    readOnly: true,
                    cursorWidth: 0,
                    initialValue: selectedCountry,
                    controller: textEditingControllerMobile,
                    keyboardType: TextInputType.number,
                    cursorColor: notifire.getwhiteblackcolor,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    initialCountryCode:
                    loginModel!.data!.defaultCountry != null
                        ? loginModel!.data!.defaultCountry
                        : "",
                    // autovalidateMode: AutovalidateMode.onUserInteraction,
                    // dropdownIcon: Icon(
                    //   Icons.arrow_drop_down,
                    //   color: notifire.getgreycolor,
                    // ),
                    dropdownTextStyle: TextStyle(color: notifire.getgreycolor),
                    style: const TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    // onCountryChanged: (value) {
                    //   print(value.dialCode);
                    //   selectedCountry = value.dialCode;
                    //   // userloginController.number.text = '';
                    //   // userloginController.password.text = '';
                    // },
                    // onChanged: (value) {},
                    // decoration: const InputDecoration(border: InputBorder.none),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: notifire.getgreycolor,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide(
                          color: notifire.getgreycolor,
                        ),
                      ),
                      hintText: "Mobile Number".tr,
                      hintStyle: TextStyle(
                          color: notifire.getgreycolor,
                          fontWeight: FontWeight.w700),
                    ),
                    invalidNumberMessage: "please enter your mobile number".tr,
                    validator: (value) {
                      return "Hello";
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "Email".tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: CustomTheme.theamColor,
                            fontWeight: FontWeight.w700),
                      ),
                      
                      InkWell(onTap: (){
                        Get.to(()=>ChangeEmailScreen());
                      },
                        child:  Text(
                          "Change".tr,
                          style: TextStyle(
                              fontSize: 16,
                              color: CustomTheme.theamColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myWidget("Email".tr, "Please enter your Email".tr,
                      textEditingControllerEmail, true),
                  const SizedBox(
                    height: 16,
                  ),
                   Text(
                    "Birthday".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: textEditingControllerDOB,
                    cursorColor: notifire.getwhiteblackcolor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: CustomTheme.theamColor),
                      ),
                      hintText: "YYYY-MM-DD".tr,
                      hintStyle: TextStyle(
                          color: notifire.getgreycolor,
                          fontWeight: FontWeight.w700),
                    ),
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return 'Please enter Date of Birth'.tr;
                      }
                      return null;
                    },
                    onTap: () async {
                      DatePicker.showSimpleDatePicker(
                        context,
                        initialDate:
                            DateTime.now().subtract(const Duration(days: 6570)),
                        firstDate: DateTime(1960),
                        lastDate: DateTime.now(),
                        dateFormat: "dd-MMMM-yyyy",
                        looping: true,
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          textEditingControllerDOB.text =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      });
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Divider(thickness: 1,color: CustomTheme.theamColor,),
                  const SizedBox(
                    height: 8,
                  ),
                   Text(
                    "Additional Information".tr,
                    style: TextStyle(
                        fontSize: 20,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                Text(
                    "Language".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    // readOnly: true,
                    controller: textEditingControllerLanguage,
                    cursorColor: notifire.getwhiteblackcolor,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: TextStyle(
                      fontFamily: 'Gilroy',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: notifire.getwhiteblackcolor,
                    ),
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 1),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            const BorderSide(color: CustomTheme.theamColor),
                      ),
                      hintText: "Language".tr,
                      hintStyle: TextStyle(
                        fontFamily: FontStyles.gilroyMedium,
                          color: Colors.grey
                          // color: notifire.getgreycolor,
                          // fontWeight: FontWeight.w700
                      ),
                    ),
                    validator: (value) {
                      print(value);
                      if (value == null || value.isEmpty) {
                        return 'Please enter Date of Birth'.tr;
                      }
                      return null;
                    },
                    onTap: () async {},
                  ),
                  SizedBox(
                    height: 16,
                  ),
                   Text(
                    "Description".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                   
                    child: TextFormField(
                      minLines: 5,
                      controller: textEditingControllerDescription,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      cursorColor: notifire.getwhiteblackcolor,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none,
                        hintText: "Description".tr,
                        hintStyle: TextStyle(
                          fontFamily: FontStyles.gilroyMedium,
                          fontSize: 15,color: Colors.grey
                        ),
                      ),
                      style: TextStyle(
                        fontFamily: FontStyles.gilroyMedium,
                        fontSize: 16,
                        color: notifire.getwhiteblackcolor,
                      ),
                    ),
                    decoration: BoxDecoration(
                      // color: notifire.getblackwhitecolor,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                          color: const Color.fromARGB(255, 125, 123, 123)),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                   Text(
                    "Country".tr,
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  Container(
                    padding: EdgeInsets.only(left: 12, right: 16),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                        
                    child: DropdownButton<String>(
                      underline: SizedBox(),
                      isExpanded: true,
                      items: listCountry.map((value) {
                        return DropdownMenuItem<String>(
                          value: value['name'].toString(),
                          child: Text(value['name']),
                        );
                      }).toList(),
                      onChanged: (value) {
                        print(value);
                        selectedCountryDrop = value;
                        setState(() {});
                      },
                      value: selectedCountryDrop,
                      hint: Text("Select Country".tr),
                    ),
                  ),

                  SizedBox(
                    height: 16,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                       Text(
                        "Identity Verification".tr,
                        style: TextStyle(
                            fontSize: 16,
                            color: CustomTheme.theamColor,
                            fontWeight: FontWeight.w700),
                      ),
                      selectedIdentityImage==null || loginModel!.data!.identityImage!=null && loginModel!.data!.identityImage.isNotEmpty?SizedBox():InkWell(onTap: (){
                        identityMethod();
                      },
                        child:  Text(
                          "Change".tr,
                          style: TextStyle(
                              fontSize: 16,
                              color: CustomTheme.theamColor,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  

                  Container(height: 200,width: MediaQuery.of(context).size.width,decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(10)),child:
                  selectedIdentityImage!=null?InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder)=>SeeImageFullScreen(image: selectedIdentityImage!)));
                  },child: 
                  ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.file(File(selectedIdentityImage!),fit: BoxFit.cover,))): loginModel!.data!.identityImage!=null && loginModel!.data!.identityImage.isNotEmpty ?myNetworkImage(loginModel!.data!.identityImage): Center(child: InkWell(onTap: (){
                    identityMethod();
                  },child: SizedBox(height: 100,width: 100,child: Image.asset("assets/images/Plus.png"))),),),

                  SizedBox(
                    height: 48,
                  ),
                  loading
                      ? Center(
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: CustomTheme.theamColor),
                              child: const CircularProgressIndicator(
                                color: Colors.white,
                              )))
                      : GestButton(
                          height: 50,
                          buttoncolor: blueColor,
                          buttontext: "Update".tr,
                          style: TextStyle(
                            fontFamily: "Gilroy Bold",
                            color: WhiteColor,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          onclick: () async {
                            updateProfileData();
                          },
                        ),
                ],
              ),
            ),
          ),
        ));
  }

  myWidget(hint, validationText, controller, readOnly) {
    return TextFormField(
      readOnly: readOnly,
      controller: controller,
      keyboardType: TextInputType.name,
      cursorColor: notifire.getwhiteblackcolor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: readOnly ? Colors.grey : notifire.getwhiteblackcolor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
              color: readOnly ? Colors.grey : CustomTheme.theamColor, width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: CustomTheme.theamColor),
        ),
        hintText: hint,
        hintStyle: TextStyle(
            color: notifire.getgreycolor, fontWeight: FontWeight.w700),
      ),
      validator: (value) {
        print(value);
        if (value == null || value.isEmpty) {
          return validationText;
        }
        return null;
      },
    );
  }

  Widget selectImagePopup() {
    return PopupMenuButton<int>(
      itemBuilder: (context) => [
        PopupMenuItem(
          onTap: () async {
            cameraImage =
                await ImagePicker().pickImage(source: ImageSource.camera);

            setState(() {});
            var bytes = await File(cameraImage.path).readAsBytes();
            var base64Image = base64Encode(bytes);

            String format = '';
            if (bytes.length > 8) {
              if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
                format = 'jpeg';
              } else if (bytes[0] == 0x89 && bytes[1] == 0x50) {
                format = 'png';
              }
            }

            uploadProfileMethod("data:image/$format;base64,$base64Image");
          },
          child: Text(
            "Select with camera".tr,
            style: TextStyle(color: BlackColor, fontWeight: FontWeight.w700),
          ),
        ),
        PopupMenuItem(
          onTap: () async {
            galleryImage =
                await ImagePicker().pickImage(source: ImageSource.gallery);
            setState(() {});
            var bytes = await File(galleryImage.path).readAsBytes();
            var base64Image = base64Encode(bytes);

            String format = '';
            if (bytes.length > 8) {
              if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
                format = 'jpeg';
              } else if (bytes[0] == 0x89 && bytes[1] == 0x50) {
                format = 'png';
              }
            }

            uploadProfileMethod("data:image/$format;base64,$base64Image");
          },
          child: Text(
            "Select with Gallery".tr,
            style: TextStyle(color: BlackColor, fontWeight: FontWeight.w700),
          ),
        ),
      ],
      offset: const Offset(50, 50),
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
            color: CustomTheme.theamColor,
            border: Border.all(color: Colors.transparent),
            borderRadius: BorderRadius.circular(50)),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
    );
  }
  identityMethod(){
    ImagePicker().pickImage(source: ImageSource.gallery).then((value) async {
      if(value!=null){
        selectedIdentityImage=value.path;
        setState(() {});

        var bytes = await File(value.path).readAsBytes();
        var base64Image = base64Encode(bytes);

        String format = '';
        if (bytes.length > 8) {
          if (bytes[0] == 0xFF && bytes[1] == 0xD8) {
            format = 'jpeg';
          } else if (bytes[0] == 0x89 && bytes[1] == 0x50) {
            format = 'png';
          }
        }

        identityBase64="data:image/$format;base64,$base64Image";

      }
    });
  }
}
