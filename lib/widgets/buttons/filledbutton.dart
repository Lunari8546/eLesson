// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:eLesson/variables.dart';
import 'package:google_fonts/google_fonts.dart';

class FilledBtn extends StatefulWidget {
  final String buttonText;
  FilledBtn({this.buttonText});

  @override
  _FilledBtnState createState() => _FilledBtnState();
}

class _FilledBtnState extends State<FilledBtn> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: mainTheme_purple,
        borderRadius: BorderRadius.circular(50)
      ),
      padding: EdgeInsets.all(20),
      child: Center(
        child: Text(
          widget.buttonText,
          style: GoogleFonts.titilliumWeb(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600
          )
        ),
      )
    );
  }
}