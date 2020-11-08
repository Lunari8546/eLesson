// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:google_fonts/google_fonts.dart';

class FieldWithIcon extends StatelessWidget {
  final String buttonText;
  final IconData buttonIcon;
  final FocusNode node;
  final VoidCallback onEditingComplete;
  final TextEditingController controller;
  final bool obscureText;

  FieldWithIcon({
    this.buttonText,
    this.buttonIcon,
    this.controller,
    this.obscureText,
    this.node,
    this.onEditingComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xFFBC7C7C7), width: 2),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        children: <Widget>[
          Container(
            width: 60,
            child: Icon(
              buttonIcon,
              size: 20,
              color: Color(0xFFBB9B9B9),
            ),
          ),
          Expanded(
            child: TextFormField(
              onEditingComplete: onEditingComplete,  //the func/callback
              focusNode: node,  //the node to request focus
              controller: controller,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: buttonText,
                hintStyle: GoogleFonts.titilliumWeb(),
              ),
              maxLines: 1,
              obscureText: obscureText,
              validator: (input) {
                if (input.isEmpty) {
                  return "Invalid";
                } else {
                  return null;
                }
              },
            ),
          )
        ],
      ),
    );
  }
}