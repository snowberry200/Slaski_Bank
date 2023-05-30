import 'package:flutter/material.dart';

class CircularProgressIndicater extends StatefulWidget {
  final Widget child;
  const CircularProgressIndicater({super.key, required this.child});

  @override
  State<CircularProgressIndicater> createState() =>
      _CircularProgressIndicaterState();
}

class _CircularProgressIndicaterState extends State<CircularProgressIndicater> {
  final double size = 200;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: widget.child,
    );
  }
}
