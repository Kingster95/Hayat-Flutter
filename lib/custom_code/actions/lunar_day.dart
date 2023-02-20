// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math';

double julianDay(int year, int month, int day, double hours) {
  int a = (14 - month) ~/ 12;
  int y = year + 4800 - a;
  int m = month + 12 * a - 3;
  int jdn =
      day + (153 * m + 2) ~/ 5 + 365 * y + y ~/ 4 - y ~/ 100 + y ~/ 400 - 32045;

  return jdn + (hours - 12) / 24;
}

int daysFromLastFullMoon(DateTime date) {
  double jd = julianDay(
      date.year, date.month, date.day, date.hour + date.minute / 60.0);

  return (jd % 29.755).floor();
}

Future<Map<String, dynamic>> fetchAstronomyData(
    String apiKey, double lat, double long, DateTime date) async {
  String formattedDate =
      "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  final response = await http.get(Uri.parse(
      'https://api.ipgeolocation.io/astronomy?apiKey=$apiKey&lat=$lat&long=$long&date=$formattedDate'));

  if (response.statusCode == 200) {
    final Map<String, dynamic> data = json.decode(response.body);
    return {'moonset': data['moonset'], 'moonrise': data['moonrise']};
  } else {
    throw Exception('Failed to fetch data');
  }
}

Future<List<String>> lunarDay(DateTime date, LatLng location) async {
  String apiKey = "d47fa81a84e84063aeded7c5a517965f";
  var moonRiseSet = await fetchAstronomyData(
      apiKey, location.latitude, location.longitude, date);
  String moonRise = moonRiseSet['moonrise'];
  String moonSet = moonRiseSet['moonset'];
  int days = daysFromLastFullMoon(date);
  return [
    'Rasaritul Lunii va \n incepe la ora: ${moonRise.toString()}',
    'Apusul Lunii va \n incepe la ora: ${moonSet.toString()}',
    'Ziua Lunii: ${days.toString()}',
  ];
}
