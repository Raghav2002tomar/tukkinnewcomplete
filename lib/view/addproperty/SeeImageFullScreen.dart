import 'dart:io';

import 'package:Tukki/workspace.dart';
import 'package:flutter/material.dart';

class SeeImageFullScreen extends StatefulWidget {
  String image;
  SeeImageFullScreen({super.key,required this.image});

  @override
  State<SeeImageFullScreen> createState() => _SeeImageFullScreenState();
}

class _SeeImageFullScreenState extends State<SeeImageFullScreen> {
  @override
  Widget build(BuildContext context) {
    print(widget.image);
    return Scaffold(appBar: AppBar(backgroundColor: Colors.white,elevation: 0,leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: notifire.getwhiteblackcolor,
        )),),body: Center(child: widget.image.contains("http")?Image.network(widget.image) :Image.file(File(widget.image)),),);
  }
}
