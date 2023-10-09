import 'dart:async';
import 'package:Tukki/helper/RoutesHelper.dart';
import 'package:Tukki/utils/Images.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:Tukki/view/auth/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    setScreen();
  }

  setScreen() async {
    Timer(
       const Duration(seconds: 0),
       // const Duration(seconds: 6),
       // const Duration(seconds: 8),
        () =>
        Get.off(()=>LoginScreen())
        // Navigator.pushReplacement(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const LoginScreen(),
        //     ))

            );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: CustomTheme.pagePadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Images.welc_logo,
                  fit: BoxFit.cover,
                  width: 49.53,
                  height: 70.5,
                ),
                const SizedBox( 
                  height: 5,
                ),
                 Text("Tukki".tr, style: CustomTheme.welcomeScreenHeaderText),
                 Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                      "Manage your property with ease and get instant alert about responses".tr, 
                      style: CustomTheme.welcomeScreenDescText),
                ),
                const SizedBox(
                  height: 100,
                ),
                Image.asset(
                  Images.welcome_info,
                  fit: BoxFit.fill,
                  height: 300,
                  width: 410,
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
