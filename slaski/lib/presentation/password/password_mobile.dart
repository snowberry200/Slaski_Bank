import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'password_main_column.dart';



//typedef StringValue = String Function(String);

class PasswordMobile extends StatefulWidget {
    final String callback;

  const PasswordMobile({
    super.key, required this.callback,
  });

  @override
  State<PasswordMobile> createState() => _PasswordMobileState();
}

class _PasswordMobileState extends State<PasswordMobile> {
  

  @override
  Widget build(BuildContext context) {
  

    return PasswordColumn(sameCallback:widget.callback,);
  }
}
