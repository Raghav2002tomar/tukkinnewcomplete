import 'package:Tukki/config/Api.dart';
import 'package:Tukki/config/http_service.dart';
import 'package:Tukki/model/StaticModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webviewx/webviewx.dart';

import '../../../helper/FontstyleModel.dart';
import '../../../helper/RoutesHelper.dart';
import '../../../utils/custom_theme.dart';
import '../../../workspace.dart';

class StaticPage extends StatefulWidget {
  String data;
  StaticPage({super.key, required this.data});

  @override
  State<StaticPage> createState() => _StaticPageState();
}

class _StaticPageState extends State<StaticPage> {
  String string = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var response;
    if (widget.data == "About us") {
      response = await httpPost(Config.staticPage, {"id":"2"});
    }
     if (widget.data == "Privacy policy") {
       response = await httpPost(Config.staticPage, {"id":"1"});
    }
    //  if (widget.data == "Get help") {
    //    response = await httpPost(Config.staticPage, {"id":"4"});
    // }
    // if (widget.data == "Give us feedback") {
    //   response = await httpPost(Config.staticPage, {"id":"5"});
    // }
    StaticModel staticModel=StaticModel.fromJson(response);
    string = staticModel.data!.staticPage!.content!;

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return string.isEmpty
          ? const Scaffold(body: Center(child: CircularProgressIndicator(),),)
          : Scaffold(
     appBar: AppBar(
        backgroundColor: CustomTheme.theamColor,
        elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              // color: notifire.getwhiteblackcolor,
            ),
          ),
        title: Text(
          widget.data,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: FontStyles.gilroyBold,
            // color: notifire.getwhiteblackcolor,
          ),
        ),
      ),
      body:  WebViewX(
              initialContent: string,
              initialSourceType: SourceType.html,
              width: Get.width,
              height: Get.height,
            ),
    );
  }
}
