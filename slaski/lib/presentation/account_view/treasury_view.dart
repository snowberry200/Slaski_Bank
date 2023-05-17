import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slaski/layout/layout.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TreasuryView extends StatefulWidget {
  const TreasuryView({super.key});

  @override
  State<TreasuryView> createState() => _TreasuryViewState();
}

class _TreasuryViewState extends State<TreasuryView> {
  final String notice =
      'Hi Desmond, Your Treasury-Bill is ready for collection since 03-10-2014. You are therefore requested to come to the bank premisses to make claim of funds';

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('Account overview',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 13, 74, 124),
                )),
          ),
          Container(
            width: width,
            height: 60,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                color: CupertinoColors.white),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: const [
                          Text(
                            'Account balance',
                            style: TextStyle(
                                color: Color.fromARGB(255, 13, 74, 124),
                                fontSize: 12),
                          ),
                          Text(
                            '\u20AC 4,928,658',
                            style: TextStyle(
                                letterSpacing: 1.2,
                                wordSpacing: 1.2,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14),
                          )
                        ]),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  SizedBox(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Center(
                            child: Text(
                              'Current portfolio yield',
                              style: TextStyle(
                                  letterSpacing: 1.2,
                                  wordSpacing: 1.2,
                                  color: Color.fromARGB(255, 13, 74, 124),
                                  fontSize: 10),
                            ),
                          ),
                          Text(
                            '\u20AC 228,658',
                            style: TextStyle(
                                letterSpacing: 1.2,
                                wordSpacing: 1.2,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 10),
                          )
                        ]),
                  ),
                  VerticalDivider(
                    color: Layout.isMobile(context) ? null : Colors.grey,
                    thickness: Layout.isMobile(context) ? 0 : 0.5,
                  ),
                  SizedBox(
                    child: Layout.isMobile(context)
                        ? null
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                                Text(
                                  'Lifetime returns',
                                  style: TextStyle(
                                      letterSpacing: 1.2,
                                      wordSpacing: 1.2,
                                      color: Color.fromARGB(255, 13, 74, 124),
                                      fontSize: 10),
                                ),
                                Text(
                                  '4/3/2008 - 10/17/2016',
                                  style: TextStyle(
                                      color: CupertinoColors.systemRed,
                                      letterSpacing: 1.2,
                                      wordSpacing: 1.2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 8),
                                ),
                                Text(
                                  '\u20AC 93,903',
                                  style: TextStyle(
                                      letterSpacing: 1.2,
                                      wordSpacing: 1.2,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10),
                                )
                              ]),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 0, right: 5),
                    child: Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          color: CupertinoColors.white),
                      // height: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text(
                                'Portfolio allocation',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 13, 74, 124),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text('1-3 Year ING Treasuries',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 13, 74, 124),
                                      fontSize: 12)),
                              Text(
                                '54.4%',
                                style: TextStyle(
                                    letterSpacing: 1.2,
                                    wordSpacing: 1.2,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              Text('0-1 Year ING Treasuries ',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 13, 74, 124),
                                      fontSize: 12)),
                              Text(
                                '31.4%',
                                style: TextStyle(
                                    letterSpacing: 1.2,
                                    wordSpacing: 1.2,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12),
                              ),
                              Divider(
                                thickness: 0.5,
                              ),
                              Text('1-9 Year Investment Grade Corporate Bond',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 13, 74, 124),
                                      fontSize: 12)),
                              Text('17.2%',
                                  style: TextStyle(
                                      letterSpacing: 1.2,
                                      wordSpacing: 1.2,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12)),
                              Divider(
                                thickness: 0.5,
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 10, right: 0, top: 0),
                    child: Container(
                      height: Layout.isMobile(context) ? 120 : null,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          color: CupertinoColors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text(
                              'Recent transfers',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 13, 74, 124),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12),
                            ),
                            Layout.isMobile(context)
                                ? const Text('+\u20AC 2,000,000',
                                    style: TextStyle(
                                        letterSpacing: 1.2,
                                        wordSpacing: 1.2,
                                        color: Colors.orange,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10))
                                : ListTile(
                                    tileColor: CupertinoColors.white,
                                    leading: const Icon(
                                      Icons.house,
                                      color: Color.fromARGB(255, 13, 74, 124),
                                      size: 20,
                                    ),
                                    title: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: const [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(bottom: 10.0),
                                          child: AutoSizeText(
                                            'From ING Account',
                                            style: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 13, 74, 124),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 10),
                                            maxLines: 2,
                                          ),
                                        ),
                                        Text(
                                          '3 October 2016',
                                          style: TextStyle(
                                              color: CupertinoColors.systemRed,
                                              letterSpacing: 1.2,
                                              wordSpacing: 1.2,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 8),
                                        )
                                      ],
                                    ),
                                    trailing: const Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Text('+\u20AC 2,000,000',
                                          style: TextStyle(
                                              letterSpacing: 1.2,
                                              wordSpacing: 1.2,
                                              color: Colors.orange,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 10)),
                                    ),
                                  ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                                child: Layout.isMobile(context)
                                    ? Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: const [
                                            Text(
                                              'Lifetime return',
                                              style: TextStyle(
                                                  letterSpacing: 1.2,
                                                  wordSpacing: 1.2,
                                                  color: Color.fromARGB(
                                                      255, 13, 74, 124),
                                                  fontSize: 10),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                '4/3/2008 - 10/17/2016',
                                                style: TextStyle(
                                                    color: CupertinoColors
                                                        .systemRed,
                                                    letterSpacing: 1.2,
                                                    wordSpacing: 1.2,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8),
                                              ),
                                            ),
                                            Text(
                                              '\u20AC 93,903',
                                              style: TextStyle(
                                                  letterSpacing: 1.2,
                                                  wordSpacing: 1.2,
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10),
                                            )
                                          ])
                                    : null)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: width,
            height: 70,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
                color: CupertinoColors.white),
            child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.warning_sharp,
                        size: 30,
                        color: CupertinoColors.destructiveRed,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: AutoSizeText(notice,
                            style: const TextStyle(
                              wordSpacing: 1.1,
                              //height: 2.5,
                              decorationThickness: 2.5,
                              letterSpacing: 1.1,
                              fontSize: 9,
                              color: Color.fromARGB(255, 13, 74, 124),
                            ),
                            maxLines: 3),
                      )
                    ],
                  ),
                )),
          ),
        ]);
  }
}
