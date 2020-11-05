// Flutter Setup
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Packages Import
import 'package:eLesson/variables.dart';
import 'package:google_fonts/google_fonts.dart';

// Views Import
import './views/auth.dart';

void main() {
  runApp(ELesson());
}

class ELesson extends StatelessWidget {
  @override
  Widget build(BuildContext context) {  
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'eLesson',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: Auth()
    );
  }
}