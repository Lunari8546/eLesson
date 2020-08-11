import 'package:eLesson/variables.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    checkVerify();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Stack(
          overflow: Overflow.visible,
          children: <Widget>[
            Container(
              color: secondaryColor,
              height: 300,
              child: Padding(
                padding: EdgeInsets.only(left: 30, right: 30, top: 50),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: GestureDetector(
                            onTap: () => {
                              
                            },
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage("assets/images/userdefault.png"),
                                  fit: BoxFit.cover
                                )
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                userEmail,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 14
                                )
                              ),
                              SizedBox(height: 10),
                              Text(
                                isVerifiedString,
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20
                                )
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Text(
                                "0",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                              Text(
                                "Completed Assignments",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 14
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "0",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 20
                                ),
                              ),
                              Text(
                                "Missing Assignments",
                                style: GoogleFonts.montserrat(
                                  color: Colors.white,
                                  fontSize: 14
                                ),
                              )
                            ],
                          ),
                        ]
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}