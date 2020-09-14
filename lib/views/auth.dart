import 'package:eLesson/services/uploadimage.dart';
import 'package:eLesson/splashscreen.dart';
import 'package:eLesson/variables.dart';
import 'package:eLesson/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
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

  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: backgroundColor,
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/curve.png")
                          )
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to eLesson!",
                      style: GoogleFonts.anticSlab(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 34,
                          fontWeight: FontWeight.bold
                        )
                      )
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40
              ),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent
                ),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white
                          )
                        )
                      ),
                      child: TextFormField(
                        validator: (input) {
                          if (input.isEmpty) {
                            return "Invalid email";
                          }
                        },
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          )
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Gmail",
                          hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                            )
                          )
                        ),
                        onSaved: (input) => _email = input
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.white
                          )
                        )
                      ),
                      child: TextFormField(
                        validator: (input) {
                          if(input.isEmpty){
                            return "Invalid Password";
                          }
                        },
                        obscureText: true,
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                          )
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Password",
                          hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w300
                            )
                          )
                        ),
                        onSaved: (input) => _password = input
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => {
                        forgotPassword(_email)
                      },
                      child: Center(
                        child: Text(
                          "Forgot Password?",
                          style: GoogleFonts.montserrat(
                            color: Colors.pink[200],
                            fontWeight: FontWeight.w300,
                            fontSize: 16
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () => {
                        signIn()
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                          ),
                          child: Center(
                            child: Text(
                              "Login",
                              style: GoogleFonts.montserrat(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () => {
                        signUp()
                      },
                      child: Center(
                        child: Container(
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white
                          ),
                          child: Center(
                            child: Text(
                              "Create Account",
                              style: GoogleFonts.montserrat(
                                fontSize: 20
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Homepage())
        );
        loggedIn = true;
      } catch(e) {
        print(e.message);
      }
    }
  }

  void signUp() async {
    final prefs = await SharedPreferences.getInstance();

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => UploadImage())
        );
        prefs.setInt("userCourses", 0);
        if (user != null) {
          user.sendEmailVerification();
        }
        loggedIn = true;
      } catch(e) {
        print(e.message);
      }
    }
  }

  Future<void> forgotPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
  }
}