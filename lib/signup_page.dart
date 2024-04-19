import 'package:flutter/material.dart';
import 'about.dart';
import 'registration_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  final String title;
  final Function(String) showError;

  SignupPage({Key? key, required this.title, required this.showError})
      : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    signupEmailController.dispose();
    signupPasswordController.dispose();
    signinEmailController.dispose();
    signinPasswordController.dispose();
    super.dispose();
  }

  // Future<void> _signUp(BuildContext context) async {
  Future<void> _signIn(BuildContext context) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinEmailController.text,
        password: signinPasswordController.text,
      );
      final user = userCredential.user;
      if (user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AboutPage(title: 'About page')),
        );
      }
    } catch (e) {
      print('Error during signin: $e');
      widget.showError('Email or password is incorrect');
    }
  }

  // Signup
  final signupEmailController = TextEditingController();

  final signupPasswordController = TextEditingController();

// Signin
  final signinEmailController = TextEditingController();

  final signinPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Circular Logo
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(
                      'assets/bin3.png'), // Replace with your logo image
                ),
                SizedBox(height: 16),
                // Email field for signup
                // Email field for signin
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  controller: signinEmailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                SizedBox(height: 16),
// Password field for signin
                TextFormField(
                  obscureText: true,
                  controller: signinPasswordController,
                  decoration: InputDecoration(labelText: 'Password'),
                ),
                SizedBox(height: 16),
                // Signin button
                ElevatedButton(
                  onPressed: () {
                    _signIn(
                      context,
                    );
                  },
                  child: Text('Signin'),
                ),
                Builder(builder: (context) {
                  return TextButton(
                    onPressed: () {
                      // Navigate to registration page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                RegistrationPage(title: 'Registration')),
                      );
                    },
                    child: Text('Create account? Register'),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
