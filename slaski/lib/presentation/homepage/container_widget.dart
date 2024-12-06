import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class IsmibilecontainerWidget extends StatelessWidget {
  const IsmibilecontainerWidget({
    super.key,
    required this.keyi,
    required this.lock,
  });

  final Uri keyi;
  final Uri lock;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Color.fromARGB(255, 220, 218, 218)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.key,
                    color: Color(0xFFff6200),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        launchUrl(keyi);
                      },
                      child: const Text(
                        'Aktywuj dostęp',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      ))
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
              indent: 2,
              endIndent: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.lock,
                    color: Color(0xFFff6200),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {
                        launchUrl(lock);
                      },
                      child: const Text(
                        'O bezpieczeństwieotwiera',
                        style: TextStyle(color: Colors.black, fontSize: 13),
                      )),
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
              indent: 2,
              endIndent: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15),
              child: Row(
                children: [
                  const Icon(
                    Icons.language_outlined,
                    color: Color(0xFFff6200),
                    size: 20,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Polish',
                          style: TextStyle(color: Colors.black, fontSize: 13)))
                ],
              ),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
              indent: 2,
              endIndent: 2,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 15),
              child: Row(children: [
                const Icon(
                  Icons.sunny_snowing,
                  color: Color(0xFFff6200),
                  size: 20,
                ),
                const SizedBox(
                  width: 20,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(' Wersja kontrastowa',
                      style: TextStyle(color: Colors.black, fontSize: 13)),
                )
              ]),
            ),
            const Divider(
              thickness: 0.5,
              color: Colors.grey,
              indent: 2,
              endIndent: 2,
            ),
          ],
        ));
  }
}
