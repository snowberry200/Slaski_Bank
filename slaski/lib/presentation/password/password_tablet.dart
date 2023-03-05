import 'package:flutter/material.dart';
import 'package:slaski/presentation/password/password_main_column.dart';

class PasswordTablet extends StatefulWidget {
  final String callback;
  const PasswordTablet({super.key, required this.callback});
  @override
  State<PasswordTablet> createState() => _PasswordTabletState();
}

class _PasswordTabletState extends State<PasswordTablet> {
  @override
  Widget build(BuildContext context) {
     return PasswordColumn(
      sameCallback: widget.callback,
    );
  }
}