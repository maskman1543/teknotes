import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Backend algorithm for signing up (Sending of verification email)
Future<void> register(String email, String password) async {
  final user = FirebaseAuth.instance;
  //Create user in Firebase Authentication
    await user.createUserWithEmailAndPassword(email: email, password: password);
    // Send the user an email verification link
    await user.currentUser!.sendEmailVerification();
    storeUserProfile(password, email);
  }

Future<void> verifyUser(String email, String password) async {
  // Get the current user.
  final user = FirebaseAuth.instance.currentUser;

  // If the user's email address is verified, add them to Firebase Authentication.
  if (user!.emailVerified) {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    storeUserProfile(password, email);
  }
  if (!user!.emailVerified) {
    print('Please verify your account');
    await user.sendEmailVerification();
  }
}

final firestore = FirebaseFirestore.instance;

Future<void> storeUserProfile(String name, String email) async {
  // Create a new document in the `users` collection.
  final userDoc = firestore.collection('users').doc();

  // Set the user's name and email address.
  userDoc.set({
    'name': name,
    'email': email,
  });
}

bool? _isEmailVerified(){
  return FirebaseAuth.instance.currentUser?.emailVerified;
}