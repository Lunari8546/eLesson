// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:eLesson/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class OutlineBtn extends StatefulWidget {
  final String buttonText;
  final Function buttonFunction;
  OutlineBtn({this.buttonText, this.buttonFunction});

  @override
  _OutlineBtnState createState() => _OutlineBtnState();
}

class _OutlineBtnState extends State<OutlineBtn> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.buttonFunction,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: mainTheme_purple,
            width: 2
          ),
          borderRadius: BorderRadius.circular(50)
        ),
        padding: EdgeInsets.all(20),
        child: Center(
          child: Text(
            widget.buttonText,
            style: GoogleFonts.titilliumWeb(
              color: mainTheme_purple,
              fontSize: 20,
              fontWeight: FontWeight.w600
            )
          ),
        )
      ),
    );
  }
}