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

import 'package:hayat/index.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;
import 'package:location/location.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    this.loc,
    required this.documentsList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng? loc;
  final List<UsersRecord> documentsList;
  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  //LocationData? _currentLocation;

  @override
  Widget build(BuildContext context) {
    double centerLatitude = 44.426767;
    double centerLongitude = 26.102538;
    ll.LatLng defaultLoc = ll.LatLng(centerLatitude, centerLongitude);

    ll.LatLng centerPoint = widget.loc != null
        ? ll.LatLng(widget.loc!.latitude, widget.loc!.longitude)
        : defaultLoc;

    var markers = <Marker>[];
    int n = widget.documentsList.length;
    for (int i = 0; i < n; i++) {
      UsersRecord record = widget.documentsList[i];
      // Extract the LatLng object from the document
      if (record.location != null && record.photoUrl != null) {
        // Use the latitude and longitude properties of the LatLng object
        double latitude = record.location!.latitude;
        double longitude = record.location!.longitude;

        ll.LatLng userPosition = ll.LatLng(latitude, longitude);
        if (record.photoUrl != null && record.photoUrl!.length >= 10) {
          Uri? url = Uri.tryParse(record.photoUrl!);
          if (url != null) {
            markers.add(Marker(
                width: 40.0,
                height: 40.0,
                point: userPosition,
                builder: (ctx) => GestureDetector(
                      onTap: () {
                        // Create the chat reference based on the current user's ID and the selected user's ID

                        // Navigate to the chat page with the current user document, chat reference, and selected user
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ChatPageWidget(
                              chatUser: record,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                              Border.all(color: Color(0xff7433A7), width: 2),
                        ),
                        child: ClipOval(
                          child: Image.network(record.photoUrl!),
                        ),
                      ),
                    )));
          }
        }
      }
    }
    if (widget.loc != null) {
      ll.LatLng userPosition =
          ll.LatLng(widget.loc!.latitude, widget.loc!.longitude);
      markers.add(Marker(
        width: 40.0,
        height: 40.0,
        point: userPosition,
        builder: (ctx) => Column(
          children: [
            Container(
              child: Icon(Icons.location_on,
                  color: Color.fromARGB(255, 110, 20, 120), size: 40),
            )
          ],
        ),
      ));
    }
    return FlutterMap(
      options: MapOptions(
        center: centerPoint,
        zoom: 16.0,
        maxZoom: 18.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate:
              "https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}@2x?access_token={accessToken}",
          additionalOptions: {
            'accessToken':
                'sk.eyJ1Ijoib3J0YW4tbWloYWkiLCJhIjoiY2xjb3I2aGpkMWl1MzNwcnk3c2MwZDJseiJ9.GXUkASDoIEQvULnc7CXUaA',
          },
          backgroundColor: Color(0xff9D52C9), // Set the background color here
        ),
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }
}
