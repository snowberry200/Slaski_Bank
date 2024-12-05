import 'package:flutter/material.dart';
import 'package:slaski/presentation/account_view/treasury_view.dart';

class Treasury extends StatefulWidget {
  const Treasury({super.key});

  @override
  State<Treasury> createState() => _TreasuryState();
}

class _TreasuryState extends State<Treasury> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:20,right: 10, left: 10),
      child: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'ING Treasury Gateway®',
              style: TextStyle(
                  letterSpacing: 1.2,
                  color: Colors.orange,
                  fontSize: 12,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TreasuryView()
          ],
        ),
      ),
    );
  }
}
