import 'package:flutter/material.dart';
import 'package:sample4/about.dart';
import 'package:sample4/home.dart';
import 'package:sample4/map.dart';
import 'package:sample4/singlebin.dart';
import 'signup_page.dart';
import 'registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: firebaseOptions);
  //init firebaser RTDB

  runApp(MyApp());
}

final FirebaseOptions firebaseOptions = FirebaseOptions(
  apiKey: "AIzaSyDP9I5EY9qRSW54GhuQj1SFJvdnXencfSc",
  appId: "1:38114452446:android:2790012f0dd6790e9fb34f",
  messagingSenderId: '38114452446',
  projectId: "ecobin-ace0a",
);

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Hello World',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/sign',
      routes: {
        '/': (context) => StreamBuilder<User?>(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  if (snapshot.hasData) {
                    return MyHomePage(title: 'Home page');
                  } else {
                    return SignupPage(
                        title: 'Sign Up', showError: (message) {});
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
        '/about': (context) => AboutPage(title: 'About page'),
        '/single': (context) => SingleBin(title: 'Single Bin page'),
        '/mapp': (context) => MyMap(title: 'Map page'),
        '/sign': (context) => SignupPage(
              title: 'Sign Up',
              showError: (message) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(message)),
                );
              },
            ),
        '/reg': (context) => RegistrationPage(title: 'Register'),
      },
    );
  }
}
