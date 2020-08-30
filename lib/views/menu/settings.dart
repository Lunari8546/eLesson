import 'package:flutter/material.dart';
import 'package:eLesson/variables.dart';
import 'package:google_fonts/google_fonts.dart';
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView.builder(
            itemCount: options.length + 2,
            itemBuilder: (BuildContext context, int index) {
              if (index == 0) {
                return SizedBox(height: 40);
              } else if (index == options.length + 1) {
                return SizedBox(height: 100);
              }
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(15),
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.white)
                ),
                child: GestureDetector(
                  onTap: options[index - 1].function,
                  child: ListTile(
                    leading: options[index - 1].icon,
                    title: Text(
                      options[index - 1].title,
                      style: GoogleFonts.montserrat(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}