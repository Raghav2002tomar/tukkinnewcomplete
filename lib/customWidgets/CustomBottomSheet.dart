import 'package:Tukki/controller/Controller.dart';
import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/model/CancellationReasonModel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:Tukki/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomSheet extends StatefulWidget {
  CancellationReasonModel model;
  CustomBottomSheet({super.key,required this.model});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Select Cancel Reason",
            style: TextStyle(
                fontSize: 20,
                fontFamily: FontStyles.gilroyBold,
                color: CustomTheme.theamColor),
          ),
          const SizedBox(
            height: 8,
          ),

          Expanded(
            child: ListView.builder(itemCount: widget.model.data!.reasons!.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
              return Row(children: [
                Radio(
                    value: index, groupValue: Controller.selectedRadio, onChanged: (value){
                  Controller.selectedRadio=index;
                  setState(() {});
                }),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '${widget.model.data!.reasons![index].reason}',
                  style: TextStyle(
                      fontSize: 18,
                      color: BlackColor,
                      fontFamily: FontStyles.gilroyMedium),
                )
              ],);
            }),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  padding: EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text("Cancel",
                      style: TextStyle(

                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context,widget.model.data!.reasons![Controller.selectedRadio].orderCancellationId);
                  Controller.selectedRadio=-1;
                },
                child: Container(
                  padding:
                  EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
                  decoration: BoxDecoration(
                      border: Border.all(color: CustomTheme.theamColor),
                      borderRadius: BorderRadius.circular(15),
                      color: CustomTheme.theamColor),
                  child: Text("Confirm",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ),
            ],
          ),
          SizedBox(height: 16,)
        ],
      )

      // SingleChildScrollView(
      //   child: ConstrainedBox(
      //
      //       constraints: BoxConstraints(minHeight: 600),
      //       child: Column(
      //         children: [
      //
      //           const Text(
      //             "Select Cancel Reason",
      //             style: TextStyle(
      //                 fontSize: 20,
      //                 fontFamily: FontStyles.gilroyBold,
      //                 color: CustomTheme.theamColor),
      //           ),
      //           const SizedBox(
      //             height: 16,
      //           ),
      //           ListView.builder(physics: NeverScrollableScrollPhysics(),itemCount: widget.model.data!.reasons!.length,shrinkWrap: true,itemBuilder: (itemBuilder,index){
      //             return Row(children: [
      //               Radio(
      //                   value: index, groupValue: Controller.selectedRadio, onChanged: (value){
      //                 Controller.selectedRadio=index;
      //                 setState(() {});
      //               }),
      //               const SizedBox(
      //                 width: 8,
      //               ),
      //               Text(
      //                 '${widget.model.data!.reasons![index].reason}',
      //                 style: TextStyle(
      //                     fontSize: 18,
      //                     color: BlackColor,
      //                     fontFamily: FontStyles.gilroyMedium),
      //               )
      //             ],);
      //           }),
      //
      //
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceAround,
      //             children: [
      //               InkWell(
      //                 onTap: () {
      //                   Get.back();
      //                 },
      //                 child: Container(
      //                   padding: EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
      //                   decoration: BoxDecoration(
      //                     border: Border.all(),
      //                     borderRadius: BorderRadius.circular(15),
      //                   ),
      //                   child: Text("Cancel",
      //                       style: TextStyle(
      //
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 16)),
      //                 ),
      //               ),
      //               InkWell(
      //                 onTap: () {
      //                   Navigator.pop(context,widget.model.data!.reasons![Controller.selectedRadio].orderCancellationId);
      //                   Controller.selectedRadio=-1;
      //                 },
      //                 child: Container(
      //                   padding:
      //                   EdgeInsets.only(left: 32, right: 32, top: 14, bottom: 14),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: CustomTheme.theamColor),
      //                       borderRadius: BorderRadius.circular(15),
      //                       color: CustomTheme.theamColor),
      //                   child: Text("Confirm",
      //                       style: TextStyle(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.bold,
      //                           fontSize: 16)),
      //                 ),
      //               ),
      //             ],
      //           )
      //         ],
      //       )),
      // ),
    );
  }
}
