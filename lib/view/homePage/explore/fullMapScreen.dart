import 'dart:io';

import 'package:Tukki/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class FullMapScreen extends StatefulWidget {
  String latitude,longitude;
  FullMapScreen({super.key,required this.latitude,required this.longitude});

  @override
  State<FullMapScreen> createState() => _FullMapScreenState();
}

class _FullMapScreenState extends State<FullMapScreen> {
  late GoogleMapController mapController;
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _zoomIn() {
    mapController.animateCamera(
      CameraUpdate.zoomIn(),
    );
  }

  void _zoomOut() {
    mapController.animateCamera(
      CameraUpdate.zoomOut(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: CustomTheme.theamColor,elevation: 0,title: Text("Map"),),
      body: Stack(
        children: [
          SizedBox(
            // height: 300,
            child: GoogleMap(scrollGesturesEnabled: true,rotateGesturesEnabled: true,zoomControlsEnabled: true,zoomGesturesEnabled: true,compassEnabled: true,
                onMapCreated: _onMapCreated,markers: {Marker(markerId: MarkerId("1"), position: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)))},
                initialCameraPosition: CameraPosition(target: LatLng(double.parse(widget.latitude), double.parse(widget.longitude)), zoom: 14)),
          ),
          Platform.isAndroid?SizedBox(): Positioned(top: 58,right: 16,child: Material(elevation: 2,borderRadius: BorderRadius.circular(8),child: InkWell(onTap: (){
            _zoomOut();
          },child: Container(padding: EdgeInsets.only(left: 12,right: 12),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child: Text("-",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),))))),
          Platform.isAndroid?SizedBox(): Positioned(top: 16,right: 16,child: Material(elevation: 2,borderRadius: BorderRadius.circular(8),child: InkWell(onTap: (){
            _zoomIn();
          },child: Container(padding: EdgeInsets.only(left: 6,right: 6,top: 1,bottom: 1),decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(8)),child: Icon(Icons.add))))),
        ],
      ));
  }
}
