import 'package:eLesson/variables.dart';
import 'package:flutter/material.dart';

class Legalese extends StatefulWidget {
  @override
  _LegaleseState createState() => _LegaleseState();
}

class _LegaleseState extends State<Legalese> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: AboutDialog()
      ),
    );
  }
}