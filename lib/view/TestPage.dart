import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:help_me/help_me.dart';
import 'package:flutter/rendering.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  GlobalKey keyHello = GlobalKey();
  GlobalKey keyArrow = GlobalKey();
  GlobalKey keyHeadphone = GlobalKey();
  GlobalKey keyList = GlobalKey();
  GlobalKey keyButton = GlobalKey();
  final helpActions = StreamController<HelpAction>();

  @override
  Widget build(BuildContext context) {
    var appbar = AppBar(
      title: Text("Flutter HelpMe".tr),
    );
    return Scaffold(
      appBar: appbar,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 32),
                        alignment: Alignment.topRight,
                        key: keyHello,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        child: const Icon(Icons.document_scanner),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  key: keyButton,
                  height: 50,
                  width: 300,
                  child: Text(
                    'A custom painter from svg'.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Icon(Icons.arrow_downward_rounded, key: keyArrow),
                SizedBox(
                  height: 32,
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    width: 100,
                    height: 100,
                    child: CustomPaint(
                      key: keyHeadphone,

                      size: Size(50,
                          70), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                      // painter: RPSCustomPainter(),
                    )),
                SizedBox(
                  height: 24,
                ),
                Text(
                  "Test with a list!".tr,
                  style: TextStyle(fontSize: 22),
                )
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
                return Card(
                  key: index == 5 ? keyList : null,
                  elevation: 10,
                  color: Color.fromARGB(255, 58, 116, (index * 100) + 40),
                  margin:
                  const EdgeInsets.only(right: 16, left: 16, bottom: 8, top: 8),
                  child: Container(
                    margin: const EdgeInsets.all(24),
                    child: Text("Item : $index".tr),
                  ),
                );
              }, childCount: 10)),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {

          var currentBox =
          keyHeadphone.currentContext!.findRenderObject() as RenderBox;
          HelpMe.showHelp(
            actions: helpActions.stream,
            gradient: LinearGradient(colors: [
              Colors.blue.withOpacity(0.2),
              Colors.purple.withOpacity(0.2),
            ]),
            items: [
              HelpMeItem(
                  key: keyButton,
                  arrow: Arrow(color: Colors.amber, width: 4),
                  shape: const HelpMeRectShape(
                      borderRadius: BorderRadius.all(Radius.circular(24))),
                  // shape:
                  //     HelperCustomShape(path: getPath(currentBox.size)),
                  guideWidget: Container(
                    key: GlobalKey(),
                    color: Colors.black,
                    margin: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              helpActions.sink.add(HelpAction.NEXT);
                            },
                            child: Text("TEST NEXT".tr)),
                        ElevatedButton(
                            onPressed: () {
                              helpActions.sink.add(HelpAction.BACK);
                            },
                            child: Text("TEST BACK".tr)),
                        Text(
                          "Contrary to popular belief.".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )),
              HelpMeItem(
                  shape: HelpMeRectShape(width: 1, color: Colors.transparent),
                  key: keyHello,
                  guideWidget: _itemHelp(
                    GlobalKey(),
                    'Documents',
                    'Your Title Deed is stored in Documents. Here you can upload more documents like tenancy agreements, bills, and view your beautiful realtime inventory report.',
                    2,
                  ),
                  arrow: Arrow(color: Colors.amber, width: 2)),
              HelpMeItem(
                  key: keyArrow,
                  shape: HelpMeOvalShape(color: Colors.red, width: 8),
                  guideWidget: Container(
                    key: GlobalKey(),
                    color: Colors.black,
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/arrow.gif',
                          height: 60,
                        ),
                        Text(
                          "This is an arrow".tr,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  )),
              HelpMeItem(
                  key: keyHeadphone,
                  // shape: HelpMeCustomShape(
                      // path: getPath2(currentBox.size)
                  // ),
                  guideWidget: Container(
                    key: GlobalKey(),
                    color: Colors.black,
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s".tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              HelpMeItem(
                  key: keyList,
                  shape: HelpMeRectShape(),
                  guideWidget: Container(
                    key: GlobalKey(),
                    color: Colors.white,
                    margin: const EdgeInsets.all(16.0),
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      "Where can I get some?".tr,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
            pageContext: context,
          );
        },
        tooltip: 'Increment',
        label: Text("Help!".tr),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  _itemHelp(GlobalKey key, String title, String message, int index) {
    return Container(
      key: key,
      margin: const EdgeInsets.symmetric(horizontal: 27),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 19),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.amber,
                    ),
                  )),
              SizedBox(
                width: 12,
              ),
              SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator(
                  color: Colors.amber,
                  backgroundColor: Colors.white,
                  value: 0.111 * index,
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "$index/9",
                style:
                TextStyle(fontWeight: FontWeight.w700, color: Colors.white),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.white),
          ),
          SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (index > 1)
                TextButton(
                    onPressed: () {
                      helpActions.sink.add(HelpAction.BACK);
                    },
                    child: Text(
                      "Back".tr,
                      style: TextStyle(
                        color: Colors.amber,
                      ),
                    )),
              SizedBox(
                width: 8,
              ),
              TextButton(
                  onPressed: () {
                    helpActions.sink.add(HelpAction.NEXT);
                  },
                  child: Text(
                    "Next".tr,
                    style: TextStyle(
                      color: Colors.amber,
                    ),
                  )),
            ],
          )
        ],
      ),
    );
  }
}