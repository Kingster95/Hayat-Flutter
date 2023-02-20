// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

bool checkIdInJson(Map<String, dynamic> json, String lessonId) {
  // Check if the json object contains a list of items
  if (json.containsKey('data')) {
    // Iterate through the list of items
    for (var item in json['data']) {
      // Check if the item has an 'id' field and if its value is equal to 'lessonId'
      if (item.containsKey('id') && item['id'] == lessonId) {
        return true;
      }
    }
  }
  return false;
}

bool newCustomAction(
  dynamic body,
  String id,
) {
  bool ok = false;
  if (checkIdInJson(body, id)) {
    ok = true;
  }

  return ok;
}
