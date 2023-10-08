import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:teknotes_final/display/home.dart';
import 'register.dart';

class SignInPanel extends StatelessWidget {
  const SignInPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:SignIn());
  }
}

//Login UI file
class SignIn extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Login Example'),
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

              // Sign In button
              ElevatedButton(
                
                onPressed: () async {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  try {
                    //Passing of inputs to the function login()
                    
                    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
                    if(FirebaseAuth.instance.currentUser?.emailVerified == true){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MyApp()),);
                    }
                    else{
                      print('secret');
                    }
                  } 
                  
                  catch (e) {
                    print(e);
                  }
                },
                child: const Text('Login'),
              ),

              ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpAuthentication()),);
                    },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

