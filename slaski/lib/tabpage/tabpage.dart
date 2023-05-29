// import 'package:cali_bank/presentation/TabPage/tap_bars/personal.dart';
// import 'package:cali_bank/presentation/TabPage/tap_bars/treasury.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

// import 'backgroundimage.dart';
// import '../../LayOut/LayOut.dart';
import '../presentation/widget/backgroundimage.dart';
import '../layout/layout.dart';
import 'tap_bars/personal.dart';
import 'tap_bars/treasury.dart';

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
    final width = MediaQuery.of(context).size.width;

    return BackgroundImageWidget(
      image: Layout.isMobile(context)
          ? const AssetImage('images/violet.jpeg')
          : const AssetImage('images/cole.jpeg'),
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          appBar: AppBar(
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
                  color: isPlaying ? CupertinoColors.systemRed : Colors.grey,
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
                                          filterQuality: FilterQuality.high,
                                          fit: BoxFit.contain,
                                          height: 60,
                                          image: AssetImage('images/des.jpeg'))
                                      : SizedBox(
                                          child: Image(
                                              width: 60,
                                              filterQuality: FilterQuality.high,
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
                                                bottomsheet());
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
          ),
          body: Padding(
              padding: Layout.isMobile(context)
                  ? const EdgeInsets.only(top: 20, bottom: 5, left: 0, right: 0)
                  : const EdgeInsets.only(
                      top: 30, bottom: 30, left: 0, right: 0),
              child: Center(
                  child: SizedBox(
                width: Layout.isMobile(context) ? width : width / 1.6,
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: DefaultTabController(
                      initialIndex: 0,
                      length: 2, // length of tabs
                      child: Column(children: [
                        SizedBox(
                          // decoration: BoxDecoration(
                          //   color: Colors.white.withOpacity(0.4),
                          //   borderRadius: const BorderRadius.only(
                          //     topLeft: Radius.circular(20),
                          //     topRight: Radius.circular(20),
                          //   ),
                          // ),
                          //  height: 40,
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
                              padding: const EdgeInsets.only(
                                  left: 1, top: 1, right: 1),
                              isScrollable: false,
                              indicator: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20)),
                                  color: Color.fromARGB(255, 10, 58, 97)),
                              unselectedLabelColor: CupertinoColors.systemRed,
                              tabs: const [
                                Tab(
                                  text: 'PERSONAL',
                                ),
                                // Tab(text: 'BUSINESS'),
                                Tab(text: 'TREASURY'),
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
              )))),
    );
  }

  bottomsheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(children: [
        const Text(
          'Choose Profile Photo',
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {
                  _pickimage(ImageSource.camera);
                },
                icon: const Icon(Icons.camera),
                tooltip: 'Camera'),
            IconButton(
                onPressed: () {
                  _pickimage(ImageSource.gallery);
                },
                icon: const Icon(Icons.image),
                tooltip: 'Gallery'),
          ],
        )
      ]),
    );
  }

  Future<void> _pickimage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      Navigator.of(context).pop();
    }
  }
}
