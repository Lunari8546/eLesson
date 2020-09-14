import 'package:eLesson/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:eLesson/variables.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: noCourses ? Container(
          child: Center(
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Button(
                    "Create Course",
                    "",
                    Icon(Icons.add_circle),
                    () => {
                      
                    }
                  ),
                  SizedBox(height: 40),
                  Button(
                    "Join Course",
                    "",
                    Icon(Icons.person_add),
                    () => {
                      
                    }
                  )
                ],
              ),
            ),
          ),
        ) : Column(

        ),
      ),
    );
  }
}