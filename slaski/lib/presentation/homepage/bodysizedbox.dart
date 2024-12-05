import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:slaski/layout/layout.dart';
import 'package:slaski/tabpage/tap_bars/personal.dart';
import 'package:slaski/tabpage/tap_bars/treasury.dart';

class BodySizedBox extends StatefulWidget {
  const BodySizedBox({super.key});

  @override
  State<BodySizedBox> createState() => _BodySizedBoxState();
}

class _BodySizedBoxState extends State<BodySizedBox>
    with TickerProviderStateMixin {
  final BorderRadiusGeometry borderradius = BorderRadius.circular(8);
  late TabController tabBarController;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _animationController.dispose();
    tabBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: Layout.isMobile(context) ? width : width / 1.6,
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: DefaultTabController(
            initialIndex: 0,
            length: 2, // length of tabs
            child: Column(children: [
              SizedBox(
                child: Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      color: CupertinoColors.white),
                  child: TabBar(
                    controller: tabBarController,
                    physics: const NeverScrollableScrollPhysics(),
                    labelColor: CupertinoColors.white,
                    labelStyle: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white),
                    padding: const EdgeInsets.only(left: 1, top: 1, right: 1),
                    isScrollable: false,
                    indicator: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5)),
                        color: Color.fromARGB(255, 10, 58, 97)),
                    unselectedLabelColor: CupertinoColors.systemRed,
                    tabs: const [
                      Padding(
                        padding: EdgeInsets.only(left:5.0,right:5),
                        child: Tab(
                          text: 'PERSONAL',
                        ),
                      ),
                      // Tab(text: 'BUSINESS'),
                      Padding(
                        padding: EdgeInsets.only(left:5.0,right:5),
                        child: Tab(text: 'TREASURY'),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                    // height: 400,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20)),
                    ),
                    child: TabBarView(
                        controller: tabBarController,
                        dragStartBehavior: DragStartBehavior.down,
                        physics: const NeverScrollableScrollPhysics(),
                        children: const <Widget>[
                          Center(
                            child: PersonalForm(),
                          ),
                          // Center(child: Business()),
                          Center(
                            child: Treasury(),
                          ),
                        ])),
              )
            ])),
      ),
    );
  }
}
