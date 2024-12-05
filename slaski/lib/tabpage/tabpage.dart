// import 'package:cali_bank/presentation/TabPage/tap_bars/personal.dart';
// import 'package:cali_bank/presentation/TabPage/tap_bars/treasury.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slaski/presentation/homepage/bodySizedBox.dart';
import 'package:slaski/presentation/homepage/bottomSheet.dart';
import 'package:slaski/presentation/homepage/sliverAppbar.dart';

// import 'backgroundimage.dart';
// import '../../LayOut/LayOut.dart';
import '../presentation/widget/backgroundimage.dart';
import '../layout/layout.dart';


class TabPage extends StatefulWidget {
  const TabPage({super.key});
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  
  final BorderRadiusGeometry borderradius = BorderRadius.circular(8);
  late TabController tabBarController;
  late AnimationController _animationController;
  bool isPlaying = false;
  File? _image;
  Uint8List webImage = Uint8List(8);

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
    return BackgroundImageWidget(
      image: Layout.isMobile(context)
          ? const AssetImage('images/violet.jpeg')
          : const AssetImage('images/cole.jpeg'),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: Layout.isMobile(context)
              ? AppBar(
                  toolbarHeight: 100,
                  backgroundColor: CupertinoColors.white,
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: IconButton(
                      hoverColor: CupertinoColors.systemGrey.withOpacity(0.5),
                      //splashColor: Colors.greenAccent,

                      icon: AnimatedIcon(
                        size: 25,
                        icon: AnimatedIcons.menu_close,
                        color:
                            isPlaying ? CupertinoColors.systemRed : Colors.grey,
                        progress: _animationController,
                      ),
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                          isPlaying
                              ? _animationController.forward()
                              : _animationController.reverse();
                        });
                      },
                    ),
                  ),
                  title: const Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 0.0),
                      child: Image(
                          width: 110,
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.contain,
                          height: 50,
                          image: AssetImage('images/ing.png')),
                    ),
                  ),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0, top: 0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Container(
                                  margin: const EdgeInsets.all(5.0),
                                  child: Card(
                                    child: Stack(children: [
                                      SizedBox(
                                        child: _image == null
                                            ? const Image(
                                                width: 60,
                                                filterQuality:
                                                    FilterQuality.high,
                                                fit: BoxFit.contain,
                                                height: 60,
                                                image: AssetImage(
                                                    'images/des.jpeg'))
                                            : SizedBox(
                                                child: Image(
                                                    width: 60,
                                                    filterQuality:
                                                        FilterQuality.high,
                                                    fit: BoxFit.contain,
                                                    height: 60,
                                                    image: FileImage(_image!)),
                                              ),
                                      ),
                                      Positioned(
                                          bottom: 0,
                                          right: 1,
                                          child: InkWell(
                                            onTap: () {
                                              showModalBottomSheet(
                                                  context: context,
                                                  builder: (builder) =>
                                                      BottomSheett());
                                            },
                                            child: const Icon(Icons.camera_alt,
                                                color: Colors.teal),
                                          )),
                                    ]),
                                  ),
                                )),
                            const Text('Hi Desmond Phillmann',
                                style: TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey,
                                )),
                          ],
                        ),
                      ),
                    )
                  ],
                  elevation: 0,
                )
              : null,
          body: Padding(
              padding: Layout.isMobile(context)
                  ? const EdgeInsets.only(top: 20, bottom: 5, left: 0, right: 0)
                  : const EdgeInsets.only(
                      top: 0, bottom: 0, left: 0, right: 0),
              child: Center(
                child: Layout.isDesktop(context)
                    ?
                    SliverAppBarForDesktop()
                    : BodySizedBox(),

                // )
              ))),
    );
  }

  
}
