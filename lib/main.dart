// Flutter Setup
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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