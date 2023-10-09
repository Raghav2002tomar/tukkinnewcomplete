import 'package:flutter/material.dart';
import 'package:multi_language_json/multi_language_json.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  final language = MultiLanguageBloc(
  initialLanguage: 'ar_SA',
  defaultLanguage: 'ar_SA',
  commonRoute: 'common',
  supportedLanguages: ['en_US', 'ar_SA']
);

  @override
  Widget build(BuildContext context) {
    return MultiLanguageStart(
        future: language.init(),
        builder: (c) => MultiStreamLanguage(
            screenRoute: ['home'],
            builder: (c, d) => Scaffold(
                  appBar: AppBar(title: Text(d.getValue(route: ['title']))),
                  body: Center(
                    child: ElevatedButton(
                      child: Text(d.getValue(route: ['btn'])),
                      onPressed: () => language.showAlertChangeLanguage(
                          context: context,
                          title: d.getValue(
                              route: ['dialog', 'title'], inRoute: false),
                          btnNegative: d.getValue(
                              route: ['dialog', 'btn_negative'],
                              inRoute: false)),
                    ),
                  ),
                ))
                );
   
  }
}
