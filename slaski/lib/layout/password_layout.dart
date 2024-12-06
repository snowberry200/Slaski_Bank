import 'package:flutter/cupertino.dart';

import '../presentation/password/password_desktop.dart';
import '../presentation/password/password_mobile.dart';
import '../presentation/password/password_tablet.dart';

const desktopScreenSize = 1200;
const tabletScreenSize = 800;
const mobileScreenSize = 300;



class PasswordLayout extends StatefulWidget {
  final String email;

  const PasswordLayout({
    super.key,
    required this.email,
  });

    static bool isMobile(context) =>
      MediaQuery.of(context).size.width < tabletScreenSize;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width > mobileScreenSize &&
      MediaQuery.of(context).size.width <= tabletScreenSize;
  static bool isDesktop(context) =>
      MediaQuery.of(context).size.width >= desktopScreenSize;
 
  @override
  State<PasswordLayout> createState() => _PasswordLayoutState();
}

class _PasswordLayoutState extends State<PasswordLayout> {
  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth > 1200) {
        return PasswordDesktop(callback: widget.email);
      } else if (constraints.maxWidth > 670 && constraints.maxWidth < 1200) {
        return PasswordTablet(callback: widget.email);
      } else {
        return  PasswordMobile(callback: widget.email);

        //sending this callbackFunction to passwordMobile()

      }
    });

  }
}
