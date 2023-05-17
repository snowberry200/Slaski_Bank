import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widget/transaction.dart';

class PersonalAccountView extends StatefulWidget {
  const PersonalAccountView({super.key});

  @override
  State<PersonalAccountView> createState() => _PersonalAccountViewState();
}

class _PersonalAccountViewState extends State<PersonalAccountView>
// with TickerProviderStateMixin
{
  bool isPlaying = false;
  final String myString =
      //'A suspicious money transfer attempt was made on your account on September 10 2021. For security reasons we have placed  your account on temporaral hold for every transaction  until you return to the Unithed States of America . You may visit any of our branches and speak with our security team to reactivate your account. We deeply regret every inconvinience caused.';
      "Funds of Account to be released to Benefactor: Ms. Amie Riley Eisenberg upon proof of ownership. Ms. Eisenberg must be a legal resident of the United States of America to have the rights to claim ownership of funds in account as per the agreement between Mrs Doris Eisenberg and ING Bank.";

  @override
  @override
  Widget build(BuildContext context) {
    List items = [
      Transaction(
          date: '10 / 10 / 07', credit: 'ING Bank', amount: '\u20AC 50,000.00'),
      Transaction(
        date: '05 / 09 / 08',
        credit: 'ING Bank',
        amount: '\u20AC 15,000.00',
      ),
      Transaction(
          date: '05 / 09 / 09', credit: 'ING Bank', amount: '\u20AC 90,000.00'),
      Transaction(
          date: '07 / 06 / 11', credit: 'ING Bank', amount: '\u20AC 10,000.00'),
      Transaction(
          date: '02 / 14 / 12', credit: 'ING Bank', amount: '\u20AC 70,000.00'),
      Transaction(
          date: '10 / 10 / 12', credit: 'ING Bank', amount: '\u20AC 80,000.00'),
      Transaction(
          date: '05 / 09 / 13', credit: 'ING Bank', amount: '\u20AC 50,000.00'),
      Transaction(
          date: '05 / 09 / 14', credit: 'ING Bank', amount: '\u20AC 90,000.00'),
      Transaction(
          date: '07 / 06 / 15', credit: 'ING Bank', amount: '\u20AC 20,000.00'),
      Transaction(
          date: '02 / 14 / 17', credit: 'ING Bank', amount: '\u20AC 90,000.00'),
    ];
    return Scaffold(
      backgroundColor: Colors.orange.withOpacity(0.6),
      body: Padding(
        padding: const EdgeInsets.only(top: 30.0, bottom: 0),
        child: SizedBox(
          child: CustomerWidget(
            items: items,
          ),
        ),
      ),
    );
  }
}

class CustomerWidget extends StatelessWidget {
  final List items;
  const CustomerWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90,
          width: double.infinity,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 13, 74, 124)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Current Account',
                    style:
                        TextStyle(color: CupertinoColors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, right: 20),
                child: Column(
                  children: const [
                    Text(
                      'Available Balance',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color.fromARGB(255, 202, 202, 202)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\u20AC 604,000.00',
                      style: TextStyle(
                          letterSpacing: 1.5,
                          wordSpacing: 1.5,
                          fontSize: 14,
                          color: Colors.orange,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Flexible(
          child: Card(
            color: Colors.orange,
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: ListTile(
                        tileColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(2))),
                        leading: Wrap(children: [
                          // const Icon(
                          //   Icons.calendar_month,
                          //   color: Colors.blueGrey,
                          // ),
                          // const SizedBox(width: 20),
                          Text(items[index].date,
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 13, 74, 124),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold))
                        ]),
                        title: Center(
                          child: Wrap(children: [
                            RichText(
                                text: const TextSpan(
                                    text: 'credit: ',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 13, 74, 124),
                                      fontWeight: FontWeight.bold,
                                    ))),
                            Text(
                              '${items[index].credit}',
                              style: const TextStyle(
                                color: Colors.orange,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ]),
                        ),
                        trailing: Text(items[index].amount,
                            style: const TextStyle(
                                color: Color.fromARGB(255, 13, 74, 124),
                                letterSpacing: 1.2,
                                wordSpacing: 1.2,
                                fontSize: 13,
                                fontWeight: FontWeight.bold))),
                  );
                }),
          ),
        )
      ],
    );
  }
}
