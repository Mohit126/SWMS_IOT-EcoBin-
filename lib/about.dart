import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sample4/signup_page.dart';
import 'package:sample4/home.dart';
import 'package:sample4/map.dart';

class AboutPage extends StatelessWidget {
  final String title;
  AboutPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/bin3.png'), // Replace with your logo image
            ),
            SizedBox(height: 16),
            // User ID field
            TextFormField(
              initialValue: user?.uid,
              decoration: InputDecoration(labelText: 'User ID'),
              enabled: false,
            ),
            SizedBox(height: 16),
            // Email field
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              initialValue: user?.displayName ?? user?.email,
              decoration: InputDecoration(labelText: 'Name'),
              enabled: false,
            ),
            SizedBox(height: 16),
            // Logout button
            ElevatedButton(
              onPressed: () async {
                try {
                  // Logout logic
                  await FirebaseAuth.instance.signOut();

                  // Navigate to signup page after successful logout
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupPage(
                        title: 'Sign Up',
                        showError: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(message)),
                          );
                        },
                      ),
                    ),
                  );
                } catch (e) {
                  print('Error during logout: $e');
                }
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: 2, // Set the initially selected index
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(title: 'Home page'),
                ),
              );
              break;
            case 1:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyMap(title: 'Map page'),
                ),
              );
              break;
            case 2:
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => AboutPage(title: 'About page'),
                ),
              );
              break;
          }
        },
      ),
    );
  }
}
