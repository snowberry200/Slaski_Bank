import 'package:flutter/material.dart';

import 'main_column.dart';

class TabletScreen extends StatefulWidget {
  const TabletScreen({super.key});

  @override
  State<TabletScreen> createState() => _TabletScreenState();
}

class _TabletScreenState extends State<TabletScreen> {
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
        final width = MediaQuery.of(context).size.width;

    return  Padding(
       padding: const EdgeInsets.only(top:30.0,left:50,right: 50),
       child: Center(
         child: SizedBox(
          child: MainColumn(context, width, formKey, loginController, urk, url,key, lock)),
       ),
     );
  }
}