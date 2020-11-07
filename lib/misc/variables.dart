// Flutter Setup
import 'package:flutter/material.dart';

// Colors
const Color mainTheme_red = Color(0xFFBD34C59);
const Color mainTheme_purple = Color(0xFFB40284A);

// Time
String welcomeText;

Future<void> getCurrentTime() async {
  DateTime currentDateTime = new DateTime.now();
  var currentTime = currentDateTime.hour;

  switch (currentTime) {
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
    case 24:
      welcomeText = "Good Evening!";
    break;
  }
}