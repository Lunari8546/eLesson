import 'package:eLesson/splashscreen.dart';
import 'package:eLesson/variables.dart';
import 'package:eLesson/views/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:eLesson/widgets/dashboard.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  void load() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        
      }
    } on SocketException catch (_) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Splashscreen())
      );
    }
  }

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: loggedIn ? Column(
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
                      signOut()
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            Dashboard()
          ],
        ) : Container(
          child: Center(
            child: Text(
              "ERROR: loggedIn = " + loggedIn.toString(),
              style: GoogleFonts.montserrat(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ),
      ),
    );
  }

  void signOut() async {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    try{
      await _firebaseAuth.signOut();
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Auth())
        );
      loggedIn = false;
    } catch(e) {
      print(e.message);
    }
  }
}