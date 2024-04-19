import 'package:flutter/material.dart';
import 'package:sample4/singlebin.dart';

import 'package:sample4/about.dart';
import 'package:sample4/map.dart';

class MyHomePage extends StatelessWidget {
  final String title;



  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('ID : 101'),
            subtitle: Text('Fill status: '),

            onTap: () {
              // Handle item tap for item 1
              // You can navigate to another screen or perform some action
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => SingleBin(title: 'Signle Bin page')),
              );
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 2'),
            subtitle: Text('Hai Status 2'),
            onTap: () {
              // Handle item tap for item 2
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 3'),
            subtitle: Text('Hai Status 3'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 4'),
            subtitle: Text('Hai Status 4'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 5'),
            subtitle: Text('Hai Status 5'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 6'),
            subtitle: Text('Hai Status 6'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 7'),
            subtitle: Text('Hai Status 7'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 8'),
            subtitle: Text('Hai Status 8'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 9'),
            subtitle: Text('Hai Status 9'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          ListTile(
            leading:
                Image.asset('assets/bin3.png'), // Replace with your image asset
            title: Text('Item 10'),
            subtitle: Text('Hai Status 10'),
            onTap: () {
              // Handle item tap for item 3
            },
          ),
          // Add m
          // ore ListTiles as needed
        ],
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
        currentIndex: 0, // Set the initially selected index
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
