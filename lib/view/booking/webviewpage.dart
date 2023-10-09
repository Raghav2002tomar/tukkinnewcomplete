import 'package:Tukki/view/booking/BookingSuccessPage.dart';
import 'package:flutter/material.dart';
import 'package:webviewx/webviewx.dart';

class WebViewPage extends StatefulWidget {
  String url;
  String bookingId;
  WebViewPage({super.key,required this.url,required this.bookingId});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewXController? webViewXController;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: WebViewX(onWebViewCreated: (controller)=>webViewXController=controller,
        initialContent: widget.url,
        userAgent: "random",
        initialSourceType: SourceType.url,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        onPageStarted: (value){
        print('Page stated $value');
        },
        onPageFinished: (value){
        print('Page finished $value');
        if(value.contains("payment_success") || value.contains("payment_fail")){
          Navigator.of(context).push(MaterialPageRoute(builder: (builder)=>BookingSuccessPage(bookingId: widget.bookingId,))).then((value){
            Navigator.pop(context,value);
          });}else if(value.contains("payment_fail")){
          // Navigator.pop(context);
        }
        },
      ),),
    );
  }
}
