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

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:date_utils/date_utils.dart';

EventList<Event> listEvents = EventList<Event>(events: {});
EventList<Event> ovulationEvents = EventList<Event>(events: {});
EventList<Event> fertilityEvents = EventList<Event>(events: {});

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({
    Key? key,
    this.width,
    this.height,
    required this.timedate,
    required this.cycleDuration,
  }) : super(key: key);

  final double? width;
  final double? height;
  final DateTime timedate;
  final int cycleDuration;

  @override
  _CustomCalendarState createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  int _currentMonth = DateTime.now().month;
  int _currentYear = DateTime.now().year;

  void _nextMonth() {
    setState(() {
      _currentMonth++;
      if (_currentMonth > 12) {
        _currentMonth = 1;
        _currentYear++;
      }
    });
  }

  void _previousMonth() {
    setState(() {
      _currentMonth--;
      if (_currentMonth < 1) {
        _currentMonth = 12;
        _currentYear--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the start and end of the range of red days
    listEvents.clear();
    ovulationEvents.clear();
    fertilityEvents.clear();
    //var currentDate = DateTime.now();
    var date = widget.timedate;
    int duration = widget.cycleDuration;

    if (duration <= 0) duration = 5;
    if (widget.timedate.isBefore(DateTime(_currentMonth)))
      date = DateTime.now();
    final redDaysStart =
        DateTime(date.year, date.month, date.day + 27 + duration - 1);
    final ovulationDaysStart =
        DateTime(date.year, date.month, date.day + 8 + duration - 1);
    final fertilityDay = DateTime(ovulationDaysStart.year,
        ovulationDaysStart.month, ovulationDaysStart.day + 2);
    var redDay =
        DateTime(redDaysStart.year, redDaysStart.month, redDaysStart.day);
    var ovulationDay = DateTime(ovulationDaysStart.year,
        ovulationDaysStart.month, ovulationDaysStart.day);
    // Create a list of red days
    for (var i = 1; i <= duration; i++) {
      redDay = DateTime(redDay.year, redDay.month, redDay.day + 1);
      int day = redDay.day;
      int month = redDay.month;
      int year = redDay.year;
      listEvents.add(
        DateTime(year, month, day),
        Event(
          date: DateTime(year, month, day),
        ),
      );
    }
    for (var i = 1; i <= duration; i++) {
      if (i == 2) {
        ovulationDay = DateTime(
            ovulationDay.year, ovulationDay.month, ovulationDay.day + 1);
        int day = fertilityDay.day;
        int month = fertilityDay.month;
        int year = fertilityDay.year;
        fertilityEvents.add(
          DateTime(year, month, day),
          Event(
            date: DateTime(year, month, day),
          ),
        );
      } else {
        ovulationDay = DateTime(
            ovulationDay.year, ovulationDay.month, ovulationDay.day + 1);
        ovulationEvents.add(
          DateTime(ovulationDay.year, ovulationDay.month, ovulationDay.day),
          Event(
            date: DateTime(
                ovulationDay.year, ovulationDay.month, ovulationDay.day),
          ),
        );
      }
    }
    return CalendarCarousel(
      todayBorderColor: Colors.red,
      todayButtonColor: Colors.transparent,
      height: widget.height!,
      width: widget.width!,
      thisMonthDayBorderColor: Colors.transparent,
      dayPadding: 0,
      weekFormat: false,
      //selectedDateTime: DateTime(_currentYear, _currentMonth, date.day),
      onLeftArrowPressed: _nextMonth,
      onRightArrowPressed: _previousMonth,
      daysHaveCircularBorder: false,
      markedDateShowIcon: false,
      markedDateIconMaxShown: 2,
      markedDateMoreShowTotal: false,
      showHeader: true,
      locale: 'ro',
      weekDayPadding: EdgeInsets.all(5),
      headerTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      weekdayTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      leftButtonIcon: Icon(Icons.arrow_left, color: Colors.black),
      rightButtonIcon: Icon(Icons.arrow_right, color: Colors.black),
      customDayBuilder: (
        bool isSelectable,
        int index,
        bool isSelectedDay,
        bool isToday,
        bool isPrevMonthDay,
        TextStyle textStyle,
        bool isNextMonthDay,
        bool isThisMonthDay,
        DateTime day,
      ) {
        dayContainerDecoration:
        BoxDecoration(
          border: Border.all(color: Colors.white),
        );
        if (isSelectedDay) {
          return Container(
            color: Colors.white,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            child: Center(
              child: Text(
                day.day.toString(),
                style: TextStyle(color: Colors.black),
              ),
            ),
          );
        }
        if (isToday) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
            ),
            color: Colors.white,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "🌟 " + day.day.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          );
        }
        if (fertilityEvents.events.containsKey(day)) {
          if (!isThisMonthDay) {
            return Opacity(
              // Make the widget more transparent
              opacity: 0.5,
              child: Container(
                decoration: null,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "🟣 " + day.day.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          } else
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "🟣 " + day.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
        }
        if (listEvents.events.containsKey(day)) {
          if (!isThisMonthDay) {
            return Opacity(
              // Make the widget more transparent
              opacity: 0.5,
              child: Container(
                decoration: null,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "🩸 " + day.day.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          } else
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              color: Colors.white,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "🩸 " + day.day.toString(),
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            );
        }
        if (ovulationEvents.events.containsKey(day)) {
          if (!isThisMonthDay) {
            return Opacity(
              // Make the widget more transparent
              opacity: 0.5,
              child: Container(
                decoration: null,
                color: Colors.white,
                child: Center(
                  child: Text(
                    "🟢 " + day.day.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          } else
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
              ),
              color: Colors.white,
              child: Center(
                child: Text(
                  "🟢 " + day.day.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            );
        }
        if (!isThisMonthDay) {
          return Opacity(
            // Make the widget more transparent
            opacity: 0.5,
            child: Container(
              decoration: null,
              color: Colors.white,
              child: Center(
                child: Text(
                  day.day.toString(),
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          );
        }
        return Container(
          // color: Colors.yellow,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
          ),
          color: Colors.white,
          child: Center(
            child: Text(
              day.day.toString(),
              style: TextStyle(color: Colors.black),
            ),
          ),
        );
      },
    );
  }
}
