// ignore_for_file: public_member_api_docs, sort_constructors_first
class Transaction {
  final dynamic date;
  final String bank;
  final String credit;
  final String amount;
  Transaction({
    required this.bank,
    required this.date,
    required this.credit,
    required this.amount,
  });
}
