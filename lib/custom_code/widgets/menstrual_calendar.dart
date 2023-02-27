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

import 'package:flutter/cupertino.dart';

class MenstrualCalendar extends StatefulWidget {
  const MenstrualCalendar({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _MenstrualCalendarState createState() => _MenstrualCalendarState();
}

class _MenstrualCalendarState extends State<MenstrualCalendar> {
  DateTime? _selectedDate;
  int? _periodDuration;
  int? _crampIntensity;
  bool? _hasMoodSwings;
  bool? _hasAcne;
  bool? _hasHeadaches;

  _MenstrualCalendarState() {
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.width ?? 0.0;
    double height = widget.height ?? 0.0;
    return Container(
      width: width,
      height: height,
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.3,
            child: CupertinoDatePicker(
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (DateTime newDate) {
                setState(() {
                  _selectedDate = newDate;
                });
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Period Duration (in days)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  _periodDuration = int.tryParse(value);
                });
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Cramp Intensity (on a scale of 1-10)',
              ),
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  _crampIntensity = int.tryParse(value);
                });
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: CheckboxListTile(
              title: Text('Mood Swings'),
              value: _hasMoodSwings,
              onChanged: (bool? value) {
                setState(() {
                  _hasMoodSwings = value;
                });
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: CheckboxListTile(
              title: Text('Acne'),
              value: _hasAcne,
              onChanged: (bool? value) {
                setState(() {
                  _hasAcne = value;
                });
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: CheckboxListTile(
              title: Text('Headaches'),
              value: _hasHeadaches,
              onChanged: (bool? value) {
                setState(() {
                  _hasHeadaches = value;
                });
              },
            ),
          ),
          Container(
            width: width,
            height: height * 0.1,
            child: ElevatedButton(
              child: Text('Submit'),
              onPressed: () {
// Submit the data entered by the user
              },
            ),
          ),
        ],
      ),
    );
  }
}
