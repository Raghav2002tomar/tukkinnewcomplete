import 'package:Tukki/model/LoginModel.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'utils/DarkMode.dart';

var closeLoading;
String token="";
String latitudeGlobal='';
String longitudeGlobal='';
late ColorNotifire notifire;
LoginModel? loginModel;

showLoading(){
 
   closeLoading=BotToast.showLoading();
  // BotToast.showCustomLoading(
  //     toastBuilder: (_) => CustomDotLoader(),
  //     // Customize the duration if you need
  //     duration: Duration(seconds: 3),
  //   );
}

class CustomDotLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3.0,
            ),
            SizedBox(width: 20),
            Text(
              "Loading",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
