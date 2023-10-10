import 'package:flutter/material.dart';
import '../authentication/registerverification.dart';

//Registration UI file
class SignUpAuthentication extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpAuthentication({super.key});

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
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  try{
                  //Passing of inputs to the function register()
                  register(email, password);
                  }
                  catch (e){}
                },
                child: Text('Sign Up'),
              ),

              ElevatedButton(
                  child: const Text('Go back'),
                  onPressed: () {
                    Navigator.pop(context);
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}