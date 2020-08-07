import 'package:eLesson/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eLesson/widgets/dashboard.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Dashboard",
                        style: GoogleFonts.anticSlab(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold
                       ),
                      )
                    ],
                  ),
                  IconButton(
                    alignment: Alignment.topCenter,
                    icon: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () => {
                      
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Dashboard()
          ],
        ),
      ),
    );
  }
}