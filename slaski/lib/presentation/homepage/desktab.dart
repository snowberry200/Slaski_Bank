import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../homepage/homepage.dart';

class IsDeskTabContainerWidget extends StatelessWidget {
  
  const IsDeskTabContainerWidget({
    super.key,
    required this.keyi,
    required this.lock,
  });

  final Uri keyi;
  final Uri lock;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 55,
        decoration:  const BoxDecoration(
            color: Color(0xFFd9d9d9),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Row(
              children: [
                TextButton(
                    onPressed: () {
                      launchUrl(keyi);
                    },
                    child: const Icon(
                      Icons.key,
                      color: Color(0xFFff6200),
                    )),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {
                      launchUrl(keyi);
                    },
                    child: const Text('Aktywuj dostęp',
                        style: TextStyle(color: Colors.black))),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.lock,
                  color: Color(0xFFff6200),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {
                      launchUrl(lock);
                    },
                    child: const Text('O bezpieczeństwieotwiera',
                        style: TextStyle(color: Colors.black))),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.language,
                  color: Color(0xFFff6200),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Polish',
                        style: TextStyle(color: Colors.black))),
              ],
            ),
            Row(
              children: [
                const Icon(
                  Icons.sunny_snowing,
                  color: Color(0xFFff6200),
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const HomePage()));
                    },
                    child: const Text(' Wersja kontrastowa',
                        style: TextStyle(color: Colors.black)))
              ],
            ),
          ],
        ));
  }
}

