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
import 'package:http/http.dart' as http;
import 'dart:math';

int daysFromLastFullMoon(DateTime date) {
  double Y = date.year.toDouble();
  double M = date.month.toDouble();
  double D = date.day.toDouble();
  if (M == 1 || M == 2) {
    Y--;
    M = M + 12;
  }
  double A = Y / 100;
  double B = A / 4;
  double C = 2 - A + B;
  double E = 365.25 * (Y + 4716);
  double F = 30.6001 * (M + 1);
  double JD = C + D + E + F - 1524.5;
  double daysSinceNew = JD - 2451549.5;
  double newMoons = daysSinceNew / 29.53;
  double fractional = newMoons - newMoons.floor();
  double moonDay = fractional * 29.53;
  return moonDay.round();
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
