import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:slaski/presentation/homepage/homepage.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const SlaskiBank());
}
class SlaskiBank extends StatefulWidget {
  const SlaskiBank({super.key});

  @override
  State<SlaskiBank> createState() => _SlaskiBankState();
}

class _SlaskiBankState extends State<SlaskiBank> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:'Slaski ING Bank',
      debugShowCheckedModeBanner: false,
      home:HomePage(email: '',));
  }
}

