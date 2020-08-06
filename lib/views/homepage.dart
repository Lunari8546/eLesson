import 'package:eLesson/variables.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Column(
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
                  child: TextField(
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
                  child: TextField(
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
                SizedBox(height: 40),
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
    );
  }

  void signIn() {
    final formState = _formKey.currentState;
    if (formState.validate()) {

    }
  }
}