import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

const Color backgroundColor = Color(0xFF21254a);
const Color secondaryColor = Color(0xFF0931d);

var isVerified = false;
var noCourses = false;

String isVerifiedString;
String userEmail;
String profileURL;

void getUserData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  userEmail = user.email;
}

void getUserIcon() async {
  final prefs = await SharedPreferences.getInstance();

  var profileRef = FirebaseStorage.instance.ref().child("images/$userEmail/profile.png");
  var iconRef = FirebaseStorage.instance.ref().child("images/userdefault.png");

  if (prefs.getBool("profileURLExist") == false) {
    profileURL = await iconRef.getDownloadURL();
  } else if (prefs.getBool("profileURLExist") == true) {
    profileURL = await profileRef.getDownloadURL();
  }
}

void getUserCourses() async {
  final prefs = await SharedPreferences.getInstance();

  if (prefs.getInt("userCourses") == 0) {
    noCourses = true;
  }
}

void checkVerify() async {
  FirebaseUser user = await FirebaseAuth.instance.currentUser();

  if (user.isEmailVerified) {
    isVerified = true;
    isVerifiedString = "Verified Account";
  } else if (!user.isEmailVerified) {
    isVerified = false;
    isVerifiedString = "Unverified Account";
  }
}

var loggedIn = false;