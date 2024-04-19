import 'package:flutter/material.dart';
import 'package:sample4/map.dart';
import 'package:sample4/home.dart';
import 'package:sample4/about.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';

class SingleBin extends StatefulWidget {
  final String title;

  SingleBin({required this.title});

  @override
  _SingleBinState createState() => _SingleBinState();
}

class _SingleBinState extends State<SingleBin> {

  int _batteryStatus = 0;
  double _distance = 0;

  @override
  void initState() {
    super.initState();
    final _databaseReference = FirebaseDatabase.instanceFor(
      app: Firebase.app(),
      databaseURL:
      'https://ecobin-ace0a-default-rtdb.asia-southeast1.firebasedatabase.app',
    );


    _databaseReference
        .reference()
        .child('data')
        .onValue
        .listen((DatabaseEvent event) {
      if (event.snapshot.value != null) {
        setState(() {
          Map<String, dynamic> data = Map<String, dynamic>.from(event.snapshot.value as Map<dynamic, dynamic>);
          _batteryStatus = data['battery_status'] ?? 0;
          _distance = data['distance'].toDouble() ?? 0;
        });
      }
    });
  }

  String getFillLevelMessage() {
    if (_distance >= 23) {
      return '0%';
    } else if (_distance > 18) {
      return '25%';
    } else if (_distance > 13) {
      return '50%';
    } else if (_distance > 3) {
      return '75%';
    } else {
      return '100%';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/bin3.png'), // Replace with your image asset
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Battery Status: $_batteryStatus%',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Fill level: ${getFillLevelMessage()}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle button press, navigate to the map or perform some action
                // For example, you can navigate to another screen:
                // Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen()));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyMap(title: 'Map page')),
                );
              },
              child: Text('Map'),
            ),
          ),
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}
