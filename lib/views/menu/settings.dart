import 'package:eLesson/views/misc/legalese.dart';
import 'package:flutter/material.dart';
import 'package:eLesson/variables.dart';
import 'package:eLesson/widgets/options.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>{
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Options(
          Option(
            title: "Show Legalese",
            icon: Icon(
              Icons.info_outline,
              color: Colors.black,
              size: 45,
            ),
            function: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Legalese())
              )
            }
          )
        )
      ),
    );
  }
}