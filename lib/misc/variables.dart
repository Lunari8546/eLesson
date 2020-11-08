// Flutter Setup
import 'package:flutter/material.dart';
import 'dart:math';

// Packages Import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:awesome_page_transitions/awesome_page_transitions.dart';

// Views Import
import '../views/homepage.dart';

// Colors
const Color mainTheme_red = Color(0xFFBD34C59);
const Color mainTheme_purple = Color(0xFFB40284A);

bool darkMode = false;

// Auth
Future<void> checkUser(context, widget) async {
  final firebaseUser = context.watch<User>();

  if (firebaseUser != null) {
    Navigator.pushReplacement(
      context,
      AwesomePageRoute(
      transitionDuration: Duration(milliseconds: 700),
      exitPage: widget,
      enterPage: Homepage(),
      transition: StackTransition(curve: Curves.easeInOutCubic)
      ),
    );
  }
}

// Time
String welcomeText;

Future<void> getCurrentTime() async {
  DateTime currentDateTime = new DateTime.now();
  var currentTime = currentDateTime.hour;

  switch (currentTime) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
      welcomeText = "Good Morning!";
    break;

    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
      welcomeText = "Good Afternoon!";
    break;

    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
      welcomeText = "Good Evening!";
    break;
  }
}

// Quotes
var quotesList = [
  "Constant dripping wears away the stone.",
  "As you sow, so shall you reap.",
  "Spare the rod and spoil the child.",
  "How's your day been?",
  "Ready to learn something new?",
  "Practice makes Perfect!",
  "Good fortune favors the daring.",
  "It always seems impossible until it’s done.",
  "You can always be better.",
  "Without studying the soul sick.",
  "Quality is not an act, but a habit.",
  "Calm your mind, silence your ego.",
  "Believe you can and you’re halfway there.",
  "Strive for progress, not perfection.",
  "The expert in everything was once a beginner.",
  "There are no shortcuts to any place worth going.",
  "It’s not going to be easy, but it’s going to be worth it.",
  "If you’re going through hell, keep going.",
  "Only you can hear me summoner.",
  "One day these 5am's will make you a legend.",
  "Be addicted to passions, not your distraction.",
  "Work hard in silence, let success make the noise.",
];

final _random = new Random();

var quote = quotesList[_random.nextInt(quotesList.length)];