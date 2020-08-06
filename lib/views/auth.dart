import 'package:eLesson/variables.dart';
import 'package:eLesson/views/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          return "Input email";
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
                          return "Input Password";
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
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = (await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password)).user;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Homepage())
        );
      } catch(e) {
        print(e.message);
      }
    }
  }
}