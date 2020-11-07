// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:google_fonts/google_fonts.dart';

class FieldWithIcon extends StatefulWidget {
  final String buttonText;
  final IconData buttonIcon;
  TextEditingController controller;
  final bool obscureText;
  FieldWithIcon({this.buttonText, this.buttonIcon, this.controller, this.obscureText});

  @override
  _FieldWithIconState createState() => _FieldWithIconState();
}

class _FieldWithIconState extends State<FieldWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Color(0xFFBC7C7C7),
          width: 2
        ),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              widget.buttonIcon,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
            child: TextFormField(
              autocorrect: false,
              controller: widget.controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.buttonText,
                hintStyle: GoogleFonts.titilliumWeb(),
              ),
              maxLines: 1,
              obscureText: widget.obscureText,
              validator: (input) {
                if (input.isEmpty) {
                  return "Invalid";
                }
              },
              onSaved: (input) => widget.controller,
            ),
          )
        ],
      )
    );
  }
}