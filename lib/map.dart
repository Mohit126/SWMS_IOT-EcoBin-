import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:sample4/home.dart';
import 'package:sample4/about.dart';

import 'package:android_intent/android_intent.dart';

class MyMap extends StatelessWidget {
  final String title;

  const MyMap({Key? key, required this.title}) : super(key: key);

  // Replace with the actual bin's latitude and longitude
  final double binLatitude = 19.78240499512927;
  final double binLongitude = 72.78757109283907;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(title),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              center: LatLng(
                19.78240499512927,
                72.78757109283907,
              ),
              zoom: 15.0,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                    'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(
                    point: LatLng(
                      19.78240499512927,
                      72.78757109283907,
                    ),
                    builder: (context) => Container(
                      child: Image.asset(
                        'assets/bin3.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            bottom: 16.0,
            right: 16.0,
            child: FloatingActionButton(
              onPressed: () {
                startNavigation(); // Call the function to start navigation
              },
              child: Icon(Icons.navigation),
            ),
          ),
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
        currentIndex: 1, // Set the initially selected index
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

  // Function to start navigation using OpenRouteService
  void startNavigation() async {
    final lat = 19.78240499512927;
    final lng = 72.78757109283907;
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await launchUrl(Uri.parse(url))) {
      // URL launched successfully.
    } else {
      throw 'Could not open Google Maps';
    }
  }
}
