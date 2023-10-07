import 'package:flutter/material.dart';
import 'registerverification.dart';

//Registration UI file
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
                  try{
                  //Passing of inputs to the function register()
                  register(_emailController.text, _passwordController.text);
                  // Show the user a message that they need to verify their email address
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please verify your email address before continuing.'),
                    ),
                  );
                  }
                  catch (e){}
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