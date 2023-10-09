import 'package:Tukki/helper/FontstyleModel.dart';
import 'package:Tukki/utils/ProjectColors.dart';
import 'package:flutter/material.dart';
import '../../utils/custom_theme.dart';

Widget buildNoDataWidget(BuildContext context, String? name,
    {String? dynamicText}) {
  return TweenAnimationBuilder<double>(
    tween: Tween<double>(begin: 0, end: 1),
    duration: Duration(seconds: 1),
    builder: (BuildContext context, double opacity, Widget? child) {
      return Opacity(
        opacity: opacity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.warning,
                color: Colors.red,
                size: 50.0,
              ),
              SizedBox(height: 20),
              Text(
                name ?? "",
                     style: TextStyle(
                    fontSize: 20,
                    color: CustomTheme.theamColor,
                    fontFamily: FontStyles.gilroyBold),
              ),
            ],
          ),
        ),
      );
    },
  );
}
