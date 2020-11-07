// Flutter Setup
import 'package:flutter/material.dart';

// Packages Setup
import 'package:eLesson/misc/variables.dart';

class IconBtn extends StatefulWidget {
  final IconData buttonIcon;
  final Function buttonFunction;
  IconBtn({this.buttonIcon, this.buttonFunction});

  @override
  _IconBtnState createState() => _IconBtnState();
}

class _IconBtnState extends State<IconBtn> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.buttonFunction,
      child: Container(
        child: Icon(
          widget.buttonIcon,
          color: mainTheme_purple,
          size: 35,
        ),
      )
    );
  }
}