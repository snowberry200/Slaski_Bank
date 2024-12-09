import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slaski/presentation/widget/history.dart';
import '../widget/colummodule.dart';

class PersonalAccountView extends StatefulWidget {
  const PersonalAccountView({super.key});

  @override
  State<PersonalAccountView> createState() => _PersonalAccountViewState();
}

class _PersonalAccountViewState extends State<PersonalAccountView>
{
  late List<ColumnModule> histories;
  bool isPlaying = false;
  @override
  void initState() {
    super.initState();
    histories = List.of(transactionHistory);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.orange.withOpacity(0.6),
        body: Padding(
            padding: const EdgeInsets.only(top: 30.0, bottom: 0),
            child: Column(
              children: [
                Container(
                  height: 90,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 13, 74, 124)),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text(
                            'Current Account',
                            style: TextStyle(
                                color: CupertinoColors.white, fontSize: 18),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20.0, right: 20),
                        child: Column(
                          children: [
                            Text(
                              'Available Balance',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 202, 202, 202)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text("\u{2191}",
                                    style: TextStyle(color: Colors.green)),
                                SizedBox(width: 5),
                                Text(
                                  '\u20AC 804,000.00',
                                  style: TextStyle(
                                      letterSpacing: 1.5,
                                      wordSpacing: 1.5,
                                      fontSize: 14,
                                      color: Colors.orange,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    child: Card(
                        color: CupertinoColors.white,
                        child: ListView(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: buildDataTable(),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            )));
  }

  Widget buildDataTable() {
    final List<String> columns = ['Date', 'Credit', 'Amount'];
    return DataTable(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(0)),
            border: Border.all(
                color: const Color.fromARGB(255, 223, 236, 235), width: 2)),
        horizontalMargin: 10,
        columnSpacing: 0,
        headingRowColor: WidgetStateColor.resolveWith(
            (states) => const Color.fromARGB(255, 223, 236, 235)),
        dataRowMinHeight: 30,
        dataTextStyle: const TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w500,
            color: Colors.black),
        columns: getColumn(columns),
        rows: getRows(histories));
  }

  List<DataColumn> getColumn(List<String> columns) =>
      columns.map((String column) {
        return DataColumn(
            label: Text(column,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                    fontSize: 19,
                    fontStyle: FontStyle.italic)));
      }).toList();
  List<DataRow> getRows(List<ColumnModule> histories) =>
      histories.map((ColumnModule history) {
        final List<dynamic> cells = [
          history.date,
          history.credit,
          history.amount
        ];
        return DataRow(cells: getCells(cells));
      }).toList();
  List<DataCell> getCells(List<dynamic> cells) => cells.map((dynamic cell) {
        return DataCell(Text(
          cell,
          style: const TextStyle(fontSize: 14, color: Colors.black),
        ));
      }).toList();
}
