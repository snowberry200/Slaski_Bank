
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slaski/presentation/account_view/personal_view.dart';


class PersonalForm extends StatefulWidget {
  const PersonalForm({super.key});

  @override
  State<PersonalForm> createState() => _PersonalFormState();
}

class _PersonalFormState extends State<PersonalForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController businessPasswordController = TextEditingController();
  TextEditingController companyController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return const PersonalAccountView();
  }
}

