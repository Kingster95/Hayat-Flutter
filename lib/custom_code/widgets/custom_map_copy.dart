// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart' as ll;

class CustomMapCopy extends StatefulWidget {
  const CustomMapCopy({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _CustomMapCopyState createState() => _CustomMapCopyState();
}

class _CustomMapCopyState extends State<CustomMapCopy> {
  LocationData? _currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    var location = Location();
    try {
      _currentLocation = await location.getLocation();
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double centerLatitude = 44.426767;
    double centerLongitude = 26.102538;

    if (_currentLocation != null) {
      centerLatitude = _currentLocation!.latitude!;
      centerLongitude = _currentLocation!.longitude!;
    }

    var center = ll.LatLng(centerLatitude, centerLongitude);

    // Retrieve the locations from Firestore
    var markers = <Marker>[];
    FirebaseFirestore.instance
        .collection('locations')
        .get()
        .then((querySnapshot) {
      querySnapshot.docs.forEach((document) {
        // Extract the LatLng object from the document
        ll.LatLng latLng = document['latlen'];

        // Use the latitude and longitude properties of the LatLng object
        double latitude = latLng.latitude;
        double longitude = latLng.longitude;

        // Create a LatLng object and add it to the list of markers
        var markerLatLng = ll.LatLng(latitude, longitude);
        markers.add(
          Marker(
            width: 80.0,
            height: 80.0,
            point: markerLatLng,
            builder: (ctx) => Container(
              child: Icon(Icons.location_on),
            ),
          ),
        );
      });
    });

    return FlutterMap(
      options: MapOptions(
        center: center,
        zoom: 13.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayerOptions(
          markers: markers, // Use the list of markers
        ),
      ],
    );
  }
}
