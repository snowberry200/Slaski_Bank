import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class BottomSheett extends StatefulWidget {
  const BottomSheett({super.key});

  @override
  State<BottomSheett> createState() => _BottomSheettState();
}

class _BottomSheettState extends State<BottomSheett>
    with TickerProviderStateMixin {
  final BorderRadiusGeometry borderradius = BorderRadius.circular(8);
  File? _image;
  bool isPlaying = false;
  Uint8List webImage = Uint8List(8);

  @override
  Widget build(BuildContext context) {
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
    }
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
