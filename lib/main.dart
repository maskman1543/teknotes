import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'authentication/register_verify.dart';

void main() async{
  
  final FirebaseOptions options = FirebaseOptions(
    apiKey: 'AIzaSyBM0PGDqRALDSKneV1thDNbwA2GjtZni30',
    appId: '1:329205810284:web:8c11d58d93519dbf9c4449 ',
    projectId: 'teknotes-79764',
    storageBucket: 'teknotes-79764.appspot.com',
    messagingSenderId: '329205810284');

  await Firebase.initializeApp(options:options);
  runApp(SignUpAuthentication());
}