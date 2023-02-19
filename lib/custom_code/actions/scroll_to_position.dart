// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

bool scrollToPosition(BuildContext context, double position) {
  final ScrollController? controller = PrimaryScrollController.of(context);
  if (controller != null && position >= 0 && position <= 1) {
    controller.animateTo(controller.position.maxScrollExtent * position,
        duration: Duration(seconds: 1), curve: Curves.ease);
    return true;
  }
  return false;
}
