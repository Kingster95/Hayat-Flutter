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

class TestDecode extends StatefulWidget {
  const TestDecode({
    Key? key,
    this.width,
    this.height,
    required this.documentsList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final List<UsersRecord> documentsList;

  @override
  _TestDecodeState createState() => _TestDecodeState();
}

class _TestDecodeState extends State<TestDecode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.purple,
      child: ListView.builder(
        itemCount: widget.documentsList.length,
        itemBuilder: (context, index) {
          UsersRecord record = widget.documentsList[index];
          if (record.location != null) {
            return Container(
              child: Text(record.displayName.toString()),
            );
          } else {
            return Container(
              child: Text("record.displayName.toString()"),
            );
          }
        },
      ),
    );
  }
}
