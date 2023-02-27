// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'dart:math' as math;
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../flutter_flow/lat_lng.dart';
import '../../flutter_flow/place.dart';
import '../../flutter_flow/custom_functions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<String> getUsersData() async {
  String dataString = "";
  try {
    var querySnapshot =
        await FirebaseFirestore.instance.collection('users').get();
    if (querySnapshot.docs.isEmpty) {
      dataString = "No documents found in the 'users' collection.";
    } else {
      querySnapshot.docs.forEach((doc) {
        dataString += doc.data.toString();
      });
    }
  } catch (e) {
    print("Error: $e");
    dataString = "Error occurred while trying to retrieve user data: $e";
  }
  return dataString;
}
