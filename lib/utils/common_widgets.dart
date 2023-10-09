// ignore_for_file: unnecessary_this

import 'package:Tukki/utils/Text.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


extension StringCasingExtension on String {
  String toCapitalized() =>
      this.isNotEmpty ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
  String toTitleCase() => this
      .replaceAll(RegExp(' +'), ' ')
      .split(" ")
      .map((str) => str.toCapitalized())
      .join(" ");
}

showSnackBar(context, message, messageType) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    elevation: CustomTheme.hexagonElevation,
    /* backgroundColor: (messageType == "Error")
        ? primaryColor
        : const SnackBarThemeData().backgroundColor, */
    content: Text(
      message,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(color: Colors.white, height: 1.5),
    ),
  ));
}

getHeader(BuildContext context, String txt) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(35.0),
      child: createAppBar(txt, () {
        Navigator.pop(context);
      }));
}

createAppBar(title, onTap) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(35.0),
    child: AppBar(
        backgroundColor: (title == "Future Income")
            ? CustomTheme.hexagonBackgroundColor
            : CustomTheme.appBarBackgroundColor,
        leading: InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back,
              color: CustomTheme.primaryColor,
              size: 24,
            )),
        title: Text(
          title.toString().toUpperCase(),
          textAlign: TextAlign.center,
          style: CustomTheme.appBarTextStyle,
        ),
        centerTitle: true,
        elevation: CustomTheme.appBarElevation,
        titleSpacing: 0),
  );
}

createAppBarWithPrimaryColor(title, onTap) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(35.0),
    child: AppBar(
        backgroundColor: CustomTheme.primaryColor,
        leading: InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 24,
            )),
        title: Text(
          title.toString().toUpperCase(),
          textAlign: TextAlign.center,
          style: CustomTheme.appBarTextStyle.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        elevation: CustomTheme.appBarElevation,
        titleSpacing: 0),
  );
}

createAppBarWithoutLeading(title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(35.0),
    child: AppBar(
      backgroundColor: CustomTheme.appBarBackgroundColor,
      automaticallyImplyLeading: false,
      leading: null,
      title: Text(
        title.toString().toUpperCase(),
        textAlign: TextAlign.center,
        style: CustomTheme.appBarTextStyle,
      ),
      centerTitle: true,
      elevation: CustomTheme.appBarElevation,
    ),
  );
}





/*
getQuestionValue() {
  QuestionaireController? questionController =
      Get.isRegistered<QuestionaireController>()
          ? Get.find<QuestionaireController>()
          : null;

  MainPageController? mainController = Get.isRegistered<MainPageController>()
      ? Get.find<MainPageController>()
      : null;

  IntroImageController? intController = Get.isRegistered<IntroImageController>()
      ? Get.find<IntroImageController>()
      : null;
  //

  if (questionController!.UnreadMsgCount != null) {
    print("==QuestionmsgMAIN==" + questionController.Msg);
    questValueCompletion.value = questionController.Msg;
    // notificationValueCompletion.value = questionController!.UnreadMsgCount;
  }

  /* } else {
    notificationValueCompletion.value;
  }*/
}*/

int getPercentageChange(orignalNumber, newNumber) {
  return (((newNumber - orignalNumber) / orignalNumber) * 100).round().toInt();
}

class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

getSliderTheme(context) {
  return SliderTheme.of(context).copyWith(
    activeTrackColor: CustomTheme.secondaryColor,
    inactiveTrackColor: Colors.black26,
    trackShape: const RoundedRectSliderTrackShape(),
    trackHeight: 4.0,
    thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12.0),
    thumbColor: const Color(0xFFF8D02B),
    overlayColor: Colors.transparent,
    overlayShape: const RoundSliderOverlayShape(overlayRadius: 8.0),
    tickMarkShape: const RoundSliderTickMarkShape(),
    activeTickMarkColor: CustomTheme.secondaryColor,
    inactiveTickMarkColor: Colors.black26,
    valueIndicatorShape: const PaddleSliderValueIndicatorShape(),
    valueIndicatorColor: CustomTheme.secondaryColor,
    valueIndicatorTextStyle: const TextStyle(
      color: Colors.white,
    ),
  );
}

getSliderInputDecoration(hintText, minValue, maxValue) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.redAccent),
    fillColor: CustomTheme.hexagonBackgroundColor,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    hintText: hintText,
    hintStyle: const TextStyle(
        color: CustomTheme.secondaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 18),
    prefixText: minValue.toString(),
    prefixStyle: CustomTheme.smallSecondaryTextStyle,
    suffixText: maxValue.toString(),
    suffixStyle: CustomTheme.smallSecondaryTextStyle,
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

buildTitleBadge(title) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    margin: const EdgeInsets.symmetric(horizontal: 30),
    constraints: const BoxConstraints(minWidth: 200),
    decoration: const BoxDecoration(
      color: CustomTheme.primaryColor,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(15),
        bottomLeft: Radius.circular(15),
      ),
      //boxShadow: CustomTheme.boxShadow,
    ),
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: CustomTheme.smallPrimaryTextStyle
          .copyWith(color: Colors.white, fontWeight: FontWeight.w600),
    ),
  );
}




buildShowDialog(BuildContext context) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return const Center(
          child: CircularProgressIndicator(
            color: CustomTheme.primaryColor,
          ),
        );
      });
}



getLocationInputDecoration(
    hintText, suffixIconPressed, showClearIcon, clearIconPressed) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.redAccent),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black45),
    suffixIcon: showClearIcon == false
        ? InkWell(
            onTap: suffixIconPressed,
            child: const Icon(
              Icons.location_on,
              color: Colors.black87,
              size: 28,
            ),
          )
        : InkWell(
            onTap: clearIconPressed,
            child: const Icon(
              Icons.close_outlined,
              color: Colors.black87,
              size: 28,
            ),
          ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

getInputDecoration(hintText) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.redAccent),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black45),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}

getBottomInputUnderlineDecoration(hintText) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.redAccent),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black45),
    suffixIcon: const Icon(Icons.edit),
    enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black12, width: 1)),
    focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.black45, width: 1)),
    errorBorder: const UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.redAccent, width: 1)),
    focusedErrorBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.redAccent, width: 1),
    ),
    disabledBorder: const UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.black12, width: 1),
    ),
  );
}

getAmountInputDecoration(hintText) {
  return InputDecoration(
    errorStyle: const TextStyle(fontSize: 14.0, color: Colors.redAccent),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.all(15),
    hintText: hintText,
    hintStyle: const TextStyle(color: Colors.black45),
    prefixText: "\$",
    prefixStyle:
        const TextStyle(color: Colors.black87, fontSize: 21, letterSpacing: 20),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black12, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.black45, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.redAccent, width: 1),
      gapPadding: 1,
      borderRadius: BorderRadius.circular(8),
    ),
  );
}
enum SnackBarMessageTypes {
  Info,
  Error,
  Success,
  Warning,
}


