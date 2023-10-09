import 'dart:convert';
import 'dart:io';
import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/DataStore.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/controller/GeneralController.dart';
import 'package:Tukki/customWidgets/CustomToast.dart';
import 'package:Tukki/customWidgets/customWidget.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/utils/DarkMode.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/workspace.dart';
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

class GoogleUpdateProfile extends StatefulWidget {
  const GoogleUpdateProfile({super.key});

  @override
  State<GoogleUpdateProfile> createState() => _GoogleUpdateProfileState();
}


class _GoogleUpdateProfileState extends State<GoogleUpdateProfile> {

  TextEditingController textEditingController = TextEditingController();
  TextEditingController textEditingControllerFirstName = TextEditingController();
  TextEditingController textEditingControllerLastName = TextEditingController();
  TextEditingController textEditingControllerEmail = TextEditingController();
  TextEditingController textEditingControllerMobile = TextEditingController();
  TextEditingController textEditingControllerPassword = TextEditingController();
  TextEditingController textEditingControllerphoneCountry = TextEditingController();
  TextEditingController textEditingControllerDOB = TextEditingController();
  GlobalKey<FormState> key =GlobalKey();
  var cameraImage;
  var galleryImage;
  String selectedCountry = "+91";
  bool loading=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    print(generalController.myImage.value);

    if(loginModel!=null){
      textEditingControllerFirstName.text = loginModel!.data!.firstName!;
      textEditingControllerLastName.text = loginModel!.data!.lastName!;
      textEditingControllerEmail.text = loginModel!.data!.email!;
      if(loginModel!.data!.phone!=null){
        textEditingControllerMobile.text = loginModel!.data!.phone!;
      }
      if(loginModel!.data!.phoneCountry!=null){
        textEditingControllerphoneCountry.text = loginModel!.data!.phoneCountry!;
        selectedCountry=loginModel!.data!.phoneCountry!;
      }

      if(loginModel!.data!.birthdate!=null){
        textEditingControllerDOB.text = loginModel!.data!.birthdate!;
      }
      textEditingControllerPassword.text = loginModel!.data!.firstName!;



      setState(() {});
    }
  }

  updateProfileData() async {
    if(!key.currentState!.validate()){
      return;
    }
    loading=true;
    setState(() {});

    Map<String, String> postData = {
      "email": textEditingControllerEmail.text,
      "first_name": textEditingControllerFirstName.text,
      "last_name": textEditingControllerLastName.text,
      "phone_country": selectedCountry,
      "phone": textEditingControllerphoneCountry.text,
      "birthdate": textEditingControllerDOB.text,
    };
    var response = await httpPost(Config.editProfile, postData);
    loading=false;
    setState(() {});
    if(response!=null){
      if(response['status']==200){
        loginModel!.data!.firstNameSetter=textEditingControllerFirstName.text;
        loginModel!.data!.lastNameSetter=textEditingControllerLastName.text;
        loginModel!.data!.birthdateSetter=textEditingControllerDOB.text;

        UserData userObj = UserData();
        userObj.saveLoginData("UserData", jsonEncode(loginModel!.toJson()));
        generalController.myName.value=textEditingControllerFirstName.text;

        showToastMessage(response['message']);
      }else{
        showToastMessage(response['error']);
      }
    }


  }

  uploadProfileMethod(image) async {
    controller.isUploadingImage.value=true;
    var response = await httpPost(Config.uploadProfileImage, {"profile_image":image});
    // var result = await http.post(Uri.parse(Config.baseurl+Config.uploadProfileImage), body: {"profile_image":image,'token':token});
    // var response=jsonDecode(result.body);
    controller.isUploadingImage.value=false;

    if(response!=null){
      if(response['status']==200){
        loginModel!.data!.profileImageSetter =response['data']['profile_image_url'];
        generalController.myImage.value=response['data']['profile_image_url'];
        UserData userObj = UserData();
        userObj.saveLoginData("UserData", jsonEncode(loginModel!.toJson()));
      }else{
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
          title: Text(
            'Update Personal Info',
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

                            cameraImage == null && galleryImage == null&& loginModel!.data!.profileImage!=null?
                            CircleAvatar(foregroundImage: NetworkImage(loginModel!.data!.profileImage['url']),radius: 120,):
                            // SizedBox(height: 120,width: 120,child: ClipRRect(borderRadius: BorderRadius.circular(60),child: myNetworkImage(loginModel!.data!.profileImage['url']),),):

                            cameraImage == null && galleryImage == null
                                ? CircleAvatar(backgroundColor: Colors.grey, radius: 120, child: Image.asset("assets/images/user.png"),)
                                : Stack(
                              children: [
                                CircleAvatar(radius: 120, foregroundImage: FileImage(File(cameraImage != null ? cameraImage!.path! : galleryImage!.path!)),),
                                Obx(() => controller.isUploadingImage.value?const Center(child: CircularProgressIndicator()):const SizedBox())
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
                  const Text(
                    "First Name",
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myWidget("First Name", "Please enter your first name",
                      textEditingControllerFirstName,false),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Last Name",
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myWidget("Last Name", "Please enter your last name",
                      textEditingControllerLastName,false),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Mobile Phone",
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),


                  const SizedBox(
                    height: 8,
                  ),
                  IntlPhoneField(
                    disableLengthCheck: true,
                    showDropdownIcon: true,
                    cursorWidth: 0,
                    initialValue: selectedCountry,
                    controller: textEditingControllerMobile,
                    keyboardType: TextInputType.number,
                    cursorColor: notifire.getwhiteblackcolor,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    initialCountryCode: "CI",
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    // dropdownIcon: Icon(
                    //   Icons.arrow_drop_down,
                    //   color: notifire.getgreycolor,
                    // ),
                    dropdownTextStyle:
                    TextStyle(color: notifire.getgreycolor),
                    style: const TextStyle(
                      fontFamily: "Gilroy",
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                    onCountryChanged: (value) {
                      print(value.dialCode);
                      selectedCountry = value.dialCode;
                      // userloginController.number.text = '';
                      // userloginController.password.text = '';
                    },
                    onChanged: (value) {},
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
                    validator: (value){
                      if(!value!.isValidNumber()){
                        return "Enter Valid Number";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16,),
                  const Text(
                    "Email",
                    style: TextStyle(
                        fontSize: 16,
                        color: CustomTheme.theamColor,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  myWidget("Email", "Please enter your Email", textEditingControllerEmail,true),

                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Birthday",
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
                        borderSide: const BorderSide(
                            color: Colors.grey, width: 1),
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
                        initialDate: DateTime.now().subtract(const Duration(days: 6570)),
                        firstDate: DateTime(1960),
                        lastDate: DateTime.now(),
                        dateFormat: "dd-MMMM-yyyy",
                        looping: true,
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          textEditingControllerDOB.text = DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      });

                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  loading?
                  Center(child: Container(padding: const EdgeInsets.all(8),decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: CustomTheme.theamColor),child: const CircularProgressIndicator(color: Colors.white,)))
                      :GestButton(
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

  myWidget(hint, validationText, controller,readOnly) {
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
        color: readOnly?Colors.grey:notifire.getwhiteblackcolor,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: readOnly?Colors.grey:CustomTheme.theamColor, width: 1),
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
            cameraImage = await ImagePicker().pickImage(source: ImageSource.camera);

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
            "Select with camera",
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
            "Select with Gallery",
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
}
