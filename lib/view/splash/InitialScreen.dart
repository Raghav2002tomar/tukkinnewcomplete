import 'dart:async';
import 'package:Tukki/utils/Images.dart';
import 'package:Tukki/view/auth/loginScreen.dart';
import 'package:Tukki/view/homePage/HomePage.dart';
import 'package:Tukki/view/splash/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    super.initState();
    setScreen();
    // generalController.fetchGeneralSettings();
  }

  setScreen() async {
    final prefs = await SharedPreferences.getInstance();
    Timer(
        const Duration(seconds: 0),
        // const Duration(seconds: 4),
        () => prefs.getBool('Firstuser') != true ?
        Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()))
            : prefs.getBool('Remember') != true
                ? Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()))
                : Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  HomePage(initialIndex: 0,)
                        )));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Image.asset(
          Images.logogif,fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
     
    );
  }
}
