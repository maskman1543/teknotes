import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//Backend algorithm for signing up (Sending of verification email)
Future<void> register(String email, String password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

      // Send the user an email verification link
      await FirebaseAuth.instance.currentUser!.sendEmailVerification();
    } 
    catch (e) {
      // If the user fails to sign up, show an error message
      print(e.toString());
    }
}
