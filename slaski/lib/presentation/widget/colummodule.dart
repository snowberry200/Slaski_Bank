// ignore_for_file: public_member_api_docs, sort_constructors_first
class ColumnModule {
  final String date, credit;
  final dynamic amount;
  ColumnModule({
    required this.credit,
    required this.amount,
    required this.date,
  });
  ColumnModule copy({String? date, String? credit, int? amount}) =>
      ColumnModule(date: this.date, credit: this.credit, amount: this.amount);
}
