import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpAuthentication extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Authentication Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email input field
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              // Password input field
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
              ),
              // Sign up button
              ElevatedButton(
                onPressed: () async {
                  // Get the user's email and password
                  String email = _emailController.text;
                  String password = _passwordController.text;

                  // Try to sign up the user
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);

                    // Send the user an email verification link
                    await FirebaseAuth.instance.currentUser!.sendEmailVerification();

                    // Show the user a message that they need to verify their email address
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Please verify your email address before continuing.'),
                      ),
                    );
                  } catch (e) {
                    // If the user fails to sign up, show an error message
                    print(e.toString());
                  }
                },
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}