import 'package:flutter/material.dart';
import 'package:eLesson/variables.dart';

class Option {
  Icon icon;
  String title;
  Function function;

  Option({this.icon, this.title, this.function});
}

final options = [
  Option(
    icon: Icon(Icons.dashboard, size: 40.0, color: Colors.black),
    title: 'Show Legalese',
    function: () => {
      
    }
  )
];