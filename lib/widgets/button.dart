import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  Button(this.title, this.event, this.icon, this.function);
  String title;
  String event;
  Icon icon;
  Function function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              icon,
              SizedBox(height: 14),
              Text(
                title,
                style: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}