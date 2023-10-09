import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:flutter/material.dart';

class CustomTheme {
  static const primaryColor = Color(0xFF000000);
  static const theamColor = const Color(0xffF29931);
  static const loginTopText = const Color(0xff925610);
  static const BottomBarColor = const Color(0xffF29931);

  static const secondaryColor = Color(0xFF595959);
  static const pageBackgroundColor = Color(0xFFFFFFFF);
  static const logoColorYellow = Color(0xFFF8D02B);
  static const appBarBackgroundColor = Color(0xFFFFFFFF);
  static const double hexagonGridMaxWidth = 600;

  static var imageBorderRadius = BorderRadius.circular(15);
  static var imageOpacity = primaryColor.withOpacity(0.15);
  static double appBarElevation = 0;

  static const homepagePopularLoaction = TextStyle(
      fontSize: 20, color: CustomTheme.theamColor, fontWeight: FontWeight.w800);

  static const homepageRecommended = TextStyle(
      fontSize: 20, color: CustomTheme.theamColor, fontWeight: FontWeight.w800);
  static const homepageMostView = TextStyle(
      fontSize: 20, color: CustomTheme.theamColor, fontWeight: FontWeight.w800);
  static const homepageimagefirstline = TextStyle(
      color: CustomTheme.theamColor,
      fontFamily: FontStyles.gilroyBold,
      fontSize: 30,
      fontWeight: FontWeight.w600);

  static const homepageimagesecondhalf = TextStyle(
      fontFamily: FontStyles.gilroyBold,
      color: CustomTheme.theamColor,
      fontSize: 30,
      fontWeight: FontWeight.w600);

  static const homepageimagesecondlast = TextStyle(
      color: Colors.white,
      fontFamily: FontStyles.gilroyMedium,
      fontSize: 25,
      fontWeight: FontWeight.w400);
  static const homepageimagethirdline = TextStyle(
      color: Colors.white,
      fontFamily: FontStyles.gilroyMedium,
      fontSize: 25,
      fontWeight: FontWeight.w400);
  static const mostviewtitle = TextStyle(
      fontSize: 20, fontWeight: FontWeight.w700, color: CustomTheme.theamColor);
  static const mostviewnight = TextStyle(
      fontSize: 16, fontWeight: FontWeight.w500, color: CustomTheme.theamColor);
  static const mostviewrating = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w700, color: CustomTheme.theamColor);
  static const mostviewdescription = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyMedium);
  static const mostviewhome = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyMedium);
  static const mostviewbeds = TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyMedium);
  static const featuredslidertitle = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w700, color: CustomTheme.theamColor);
  static const featuredslidernight = TextStyle(
      fontSize: 13, fontWeight: FontWeight.w500, color: CustomTheme.theamColor);
  static const featuredsliderrating = TextStyle(
      fontSize: 15, fontWeight: FontWeight.w700, color: CustomTheme.theamColor);
  static const featuredsliderdescription = TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyMedium);
  static const featuredsliderhome = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyMedium);
  static const featuredsliderbeds = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyMedium);

  static const smallPrimaryTextStyle = TextStyle(
      color: primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16);

  static const smallCrousalTextStyle = TextStyle(
      color: primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 12);

  static const smallSecondaryTextStyle = TextStyle(
      color: secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16);

  static const afforableSecondaryTextStyle = TextStyle(
      color: secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 12);

  static const normalPrimaryTextStyle = TextStyle(
      color: primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 20);
  static const normalSecondaryTextStyle = TextStyle(
      color: secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 20);

  static const regularPrimaryTextStyle = TextStyle(
      color: primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 24);
  static const regularSecondaryColorTextStyle = TextStyle(
      color: secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 24);

  static const bigPrimaryTextStyle = TextStyle(
      color: primaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 30);
  static const bigSecondaryTextStyle = TextStyle(
      color: secondaryColor,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 30);

  static const extraBigPrimaryTextStyle =
      TextStyle(color: primaryColor, fontSize: 36);
  static const extraBigSecondaryTextStyle =
      TextStyle(color: secondaryColor, fontSize: 36);

  static const amountTextStyle = TextStyle(
    color: primaryColor,
    fontWeight: FontWeight.w500,
    fontSize: 21,
  );

  static const affamountTextStyle = TextStyle(
    color: Colors.green,
    fontWeight: FontWeight.w500,
    fontSize: 21,
  );

  static const nonaffamountTextStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.w500,
    fontSize: 21,
  );

  static const amountTextStyleWithUnderline = TextStyle(
      color: primaryColor,
      fontWeight: FontWeight.w400,
      fontSize: 21,
      decoration: TextDecoration.underline);

  static const MainProfileScreenHeading = TextStyle(
      fontFamily: FontStyles.gilroyMedium,
      color: CustomTheme.theamColor,
      fontSize: 18,
      fontWeight: FontWeight.w700,
      letterSpacing: 1);
  static const MainProfileScreenLogout = TextStyle(
    fontFamily: FontStyles.gilroyMedium,
    color: CustomTheme.theamColor,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    letterSpacing: 1,
  );
  static const InboxScreenDescription = TextStyle(
    fontFamily: FontStyles.gilroyMedium,
  );
  static const InboxScreenchatname = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w700,
      fontFamily: FontStyles.gilroyMedium,
      color: CustomTheme.theamColor);

  static var secondaryElevatedButtonTextStyle = ElevatedButton.styleFrom(
    elevation: 1,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
    primary: const Color(0xFF969696),
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
  );

  static var elevatedButtonTextStyle = ElevatedButton.styleFrom(
    elevation: 0,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    primary: primaryColor,
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    textStyle: const TextStyle(
        color: Colors.white, fontSize: 16, fontWeight: FontWeight.w400),
  );

  static var primaryElevatedButtonTextStyle = ElevatedButton.styleFrom(
    elevation: 1,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    primary: primaryColor,
    onPrimary: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: const TextStyle(color: Colors.white, fontSize: 20),
  );

  static var scheduleTourButtonTextStyle = ElevatedButton.styleFrom(
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      primary: primaryColor,
      onPrimary: const Color(0xFFFFFFFF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      textStyle: const TextStyle(
          color: Color(0xFFFFFFFF), fontSize: 18, fontWeight: FontWeight.w500));

  static var outlinedButtonStyle = OutlinedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      backgroundColor: Colors.white,
      primary: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      textStyle: const TextStyle(
          color: Colors.black87, fontSize: 18, fontWeight: FontWeight.w400));

  static const appBarTextStyle = TextStyle(
    color: CustomTheme.primaryColor,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static var containerBoxDecorationWithBorder = BoxDecoration(
    borderRadius: BorderRadius.circular(15),
    color: pageBackgroundColor,
    border: Border.all(color: hexagonBackgroundColor),
  );

  static const pagePadding = EdgeInsets.all(16);
  static const cuousalMargin = EdgeInsets.all(25);
  static const rowPadding = EdgeInsets.all(5);
  static const cardPadding = EdgeInsets.symmetric(horizontal: 15, vertical: 0);
  static const hexaheadingPadding =
      EdgeInsets.symmetric(horizontal: 15, vertical: 2);
  static const mapPadding = EdgeInsets.all(50);
  static const mapCustomPadding = EdgeInsets.all(10);
  static const horizontalPagePadding = EdgeInsets.symmetric(horizontal: 0);
  static const verticalPagePadding = EdgeInsets.symmetric(vertical: 15);
  static const hexaPageMargin = EdgeInsets.symmetric(vertical: 0);
  static const hexaPagePadding = EdgeInsets.symmetric(vertical: 0);
  static const hexaPagePaddingg = EdgeInsets.symmetric(vertical: 0);
  static const verticalPagePaddingMortgage = EdgeInsets.symmetric(vertical: 10);

  static const topLeftRightBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      color: CustomTheme.pageBackgroundColor,
      boxShadow: boxShadow);

  static var containerBoxDecoration = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: CustomTheme.pageBackgroundColor,
      boxShadow: boxShadow);

  static var containerBoxDecorationWithColorBorderRed = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: CustomTheme.pageBackgroundColor,
      border: Border.all(
        color: Colors.red,
        style: BorderStyle.solid,
      ),
      boxShadow: boxShadow);

  static var containerBoxDecorationWithColorBorderGreen = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: CustomTheme.pageBackgroundColor,
      border: Border.all(
        color: Colors.green,
        style: BorderStyle.solid,
      ),
      boxShadow: boxShadow);

  static var containerBoxDecorationWithBlackColor = BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: secondaryColor,
      boxShadow: boxShadow);

  static const bottomSheetDecoration = BoxDecoration(
      color: CustomTheme.pageBackgroundColor,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15), topRight: Radius.circular(15)));

  static const boxShadow = [
    BoxShadow(
        color: Colors.black26,
        offset: Offset(0, 1),
        blurRadius: 5,
        spreadRadius: 0)
  ];

  static final selectedBoxDecoration = BoxDecoration(
    color: primaryColor,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    border: Border.all(
      color: secondaryColor,
      style: BorderStyle.solid,
    ),
  );
  static final unSelectedBoxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    border: Border.all(
      color: secondaryColor,
      style: BorderStyle.solid,
    ),
  );
  static const selectedTextStyle = TextStyle(
      color: Colors.white,
      height: 1.2,
      fontWeight: FontWeight.w400,
      fontSize: 18);
  static const unSelectedTextStyle = TextStyle(
      color: primaryColor,
      height: 1.2,
      fontWeight: FontWeight.w400,
      fontSize: 18);
  static const checkBoxTextStype = TextStyle(
      color: primaryColor,
      height: 1.2,
      fontWeight: FontWeight.w400,
      fontSize: 16);

  static double hexagonElevation = 2;
  static const hexagonBackgroundColor = Color(0xFFE3E3E3);
  static const hexagonSelectedBackgroundColor = primaryColor;
  static const hexagonDarkGreyColor = Color(0xFFC4C4C4);
  static const hexagonSkipColor = Colors.transparent;
  static TextStyle hexagonTitleTextStyle =
      smallPrimaryTextStyle.copyWith(fontSize: 14, fontWeight: FontWeight.w600);
  static TextStyle hexagonSelectedTitleTextStyle = smallPrimaryTextStyle
      .copyWith(fontSize: 14, color: Colors.white, fontWeight: FontWeight.w600);
  static TextStyle hexagonTextStyle =
      smallPrimaryTextStyle.copyWith(fontSize: 14);
  static TextStyle hexagonSelectedTextStyle =
      smallPrimaryTextStyle.copyWith(color: logoColorYellow, fontSize: 14);
  static double hexagonCornerRadius = 8;

  static const bottomNavBarActiveColor = Color(0xFFF8D02B);
  static const bottomNavBarInactiveColor = Colors.white;
  static const loginscreentext = TextStyle(color: theamColor, fontSize: 25);

  static const welcomeScreenHeaderText = TextStyle(
      color: theamColor,
      fontSize: 25,
      fontFamily: "Gilroy",
      fontWeight: FontWeight.bold);
  static const welcomeScreenDescText =
      TextStyle(color: theamColor, fontSize: 16, fontFamily: "Gilroy");
  static const ExploreScreenText = TextStyle(
      color: Color(0xFFF29931),
      fontSize: 25,
      fontWeight: FontWeight.w600,
      fontFamily: FontStyles.gilroyBold);
}
