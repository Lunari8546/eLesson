import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

const Color backgroundColor = Color(0xFF21254a);
const Color secondaryColor = Color(0xFF0931d);

var isVerified = false;
String isVerifiedString;
String userEmail;

void getUserData() async {
  final FirebaseUser user = await FirebaseAuth.instance.currentUser();
  userEmail = user.email;
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