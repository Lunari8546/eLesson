// Flutter Setup
import 'package:flutter/material.dart';

// Packages Import
import 'package:eLesson/misc/variables.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:provider/provider.dart';

// Services Import
import 'package:eLesson/services/authservice.dart';

// Widgets Import
import '../widgets/buttons/filledbutton.dart';
import '../widgets/buttons/outlinebutton.dart';
import '../widgets/inputs/fieldwithicon.dart';

// Views Import
import './homepage.dart';

class Auth extends StatefulWidget {
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  // State Variables
  final formKey = GlobalKey<FormState>();

  int _pageState = 0;

  var _backgroundColor = Colors.white;
  var _headingColor = mainTheme_purple;

  double _headingTop = 100;

  double _loginWidth = 0;
  double _loginHeight = 0;
  double _loginOpacity = 1;

  double _loginYOffset = 0;
  double _loginXOffset = 0;

  double _registerYOffset = 0;

  double _windowWidth = 0;
  double _windowHeight = 0;

  @override
  Widget build(BuildContext context) {
    _windowWidth = MediaQuery.of(context).size.width;
    _windowHeight = MediaQuery.of(context).size.height;

    _loginHeight = _windowHeight - 260;

    switch(_pageState) {
      case 0:
        _backgroundColor = Colors.white;

        _headingTop = 100;
        _headingColor = mainTheme_purple;

        _loginWidth = _windowWidth;
        _loginOpacity = 1;

        _loginYOffset = _windowHeight;
        _loginXOffset = 0;

        _registerYOffset = _windowHeight;
      break;

      case 1:
        _backgroundColor = mainTheme_red;

        _headingTop = 90;
        _headingColor = Colors.white;

        _loginWidth = _windowWidth;
        _loginOpacity = 1;

        _loginYOffset = 260;
        _loginXOffset = 0;

        _registerYOffset = _windowHeight;
      break;

      case 2:
        _backgroundColor = mainTheme_red;

        _headingTop = 80;
        _headingColor = Colors.white;

        _loginWidth = _windowWidth - 40;
        _loginOpacity = 0.7;

        _loginYOffset = 240;
        _loginXOffset = 20;

        _registerYOffset = 270;
      break;
    }

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          AnimatedContainer(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000
            ),
            color: _backgroundColor,
            child: GestureDetector(
              onTap: () => {
                setState(() {
                  _pageState = 0;
                })
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        AnimatedContainer(
                          curve: Curves.fastLinearToSlowEaseIn,
                          duration: Duration(
                            milliseconds: 1000
                          ),
                          margin: EdgeInsets.only(top: _headingTop),
                          child: Text(
                            "eLesson",
                            style: GoogleFonts.lora(
                              color: _headingColor,
                              fontSize: 38,
                              fontWeight: FontWeight.w400
                            )
                          )
                        ),
                        SizedBox(height: 24),
                        Text(
                          "Study efficiently with your friends.",
                          style: GoogleFonts.titilliumWeb(
                            color: _headingColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w300
                          )
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 42),
                    child: Center(
                      child: Image.asset("assets/images/splash_bg.png")
                    ),
                  ),
                  Container(
                    child: GestureDetector(
                      onTap: () => {
                        setState(() {
                          if (_pageState != 0) {
                            _pageState = 0;
                          } else {
                            _pageState = 1;
                          }
                        })
                      },
                      child: Container(
                        margin: EdgeInsets.all(42),
                        padding: EdgeInsets.all(20),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: mainTheme_purple,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        child: Center(
                          child: Text(
                            "Start Studying",
                            style: GoogleFonts.titilliumWeb(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            width: _loginWidth,
            height: _loginHeight,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000
            ),
            transform: Matrix4.translationValues(_loginXOffset, _loginYOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(_loginOpacity),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
              )
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Text(
                          "Login to Continue",
                          style: GoogleFonts.titilliumWeb(
                            color: mainTheme_purple,
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                          )
                        ),
                      ),
                      FieldWithIcon(
                        buttonText: "Input your Email",
                        buttonIcon: Icons.email,
                        controller: emailController,
                        obscureText: false
                      ),
                      SizedBox(height: 20),
                      FieldWithIcon(
                        buttonText: "Input your Password",
                        buttonIcon: Icons.vpn_key,
                        controller: passwordController,
                        obscureText: true
                      )
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    FilledBtn(
                      buttonText: "Login", 
                      buttonFunction: () => {
                        context.read<AuthService>().signIn(
                          email: emailController.text.trim(),
                          password: passwordController.text.trim()
                        ),
                        //Navigator.pushReplacement(
                          //context,
                          //AwesomePageRoute(
                            //transitionDuration: Duration(milliseconds: 700),
                            //exitPage: widget,
                            //enterPage: Homepage(),
                            //transition: StackTransition(curve: Curves.easeInOutCubic)
                          //),
                        //)
                      }
                    ),
                    SizedBox(height: 20),
                    OutlineBtn(
                      buttonText: "Create new Account",
                      buttonFunction: () => {
                        setState(() {
                          _pageState = 2;
                        })
                      },
                    )
                  ],
                )
              ],
            ),
          ),
          AnimatedContainer(
            padding: EdgeInsets.all(32),
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(
              milliseconds: 1000
            ),
            transform: Matrix4.translationValues(0, _registerYOffset, 1),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25)
              )
            ),
            child: Column(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "Create new Account",
                        style: GoogleFonts.titilliumWeb(
                          color: mainTheme_purple,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                        )
                      ),
                    ),
                    FieldWithIcon(
                      buttonText: "Input your Email",
                      buttonIcon: Icons.email,
                      obscureText: false
                    ),
                    SizedBox(height: 20),
                    FieldWithIcon(
                      buttonText: "Input your Password",
                      buttonIcon: Icons.vpn_key,
                      obscureText: true
                    )
                  ],
                ),
                SizedBox(height: 130),
                Column(
                  children: <Widget>[
                    FilledBtn(buttonText: "Register"),
                    SizedBox(height: 20),
                    OutlineBtn(
                      buttonText: "Return to Login",
                      buttonFunction: () => {
                        setState(() {
                          _pageState = 1;
                        })
                      },
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}