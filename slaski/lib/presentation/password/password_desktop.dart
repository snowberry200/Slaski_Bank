// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:slaski/presentation/password/password_main_column.dart';

class PasswordDesktop extends StatefulWidget {
  final String callback;
   const PasswordDesktop({
    super.key,
    required this.callback,
  });

  @override
  State<PasswordDesktop> createState() => _PasswordDesktopState();
}

class _PasswordDesktopState extends State<PasswordDesktop> {
  @override
  Widget build(BuildContext context) {
    return PasswordColumn(
      sameCallback: widget.callback,
    );
  }
}
