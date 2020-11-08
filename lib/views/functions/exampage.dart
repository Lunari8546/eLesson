// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:eLesson/misc/variables.dart';

class ExamPage extends StatefulWidget {
  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        alignment: Alignment.topRight,
        decoration: BoxDecoration(
          color: mainTheme_red,
          image: DecorationImage(
            alignment: Alignment.topRight,
            image: AssetImage("assets/images/exam.jpeg"),
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken)
          )
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 50, right: 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}