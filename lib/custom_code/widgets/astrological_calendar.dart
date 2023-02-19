// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '../actions/index.dart'; // Imports custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:aplicatie/lunar_day/lunar_day_widget.dart';

import 'dart:convert';

import 'dart:math';

import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:intl/intl.dart';
import 'package:sunrise_sunset_calc/sunrise_sunset_calc.dart';
import 'package:http/http.dart' as http;

int moonAgeForToday(DateTime date) {
  double jd = julianDay(
      date.year, date.month, date.day, date.hour + date.minute / 60.0);

  return (jd % 29.755).floor();
}

class AstrologicalCalendar extends StatefulWidget {
  const AstrologicalCalendar({
    Key? key,
    this.width,
    this.height,
    required this.deviceLocation,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng deviceLocation;
  final String apiKey = "d47fa81a84e84063aeded7c5a517965f";
  @override
  _AstrologicalCalendarState createState() => _AstrologicalCalendarState();
}

class _AstrologicalCalendarState extends State<AstrologicalCalendar> {
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
    double lati = 44.4267674;
    double longi = 26.1025384;
    Intl.defaultLocale = 'ro_RO';
    if (widget.deviceLocation != null) {
      lati = widget.deviceLocation.latitude;
      longi = widget.deviceLocation.longitude;
    }

    return CalendarCarousel(
      todayBorderColor: Color(0xff3D1766),
      todayButtonColor: Colors.transparent,
      height: widget.height!,
      width: widget.width!,
      thisMonthDayBorderColor: Colors.transparent,
      dayPadding: 0,
      weekFormat: false,
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
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      weekdayTextStyle: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      weekDayFormat: WeekdayFormat.standaloneShort,
      onDayPressed: (DateTime date, List events) async {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => LunarDayWidget(
              lunarDate: date,
              location: widget.deviceLocation,
            ),
          ),
        );
      },
      leftButtonIcon: Icon(Icons.arrow_left, color: Colors.white),
      rightButtonIcon: Icon(Icons.arrow_right, color: Colors.white),
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
        // Calculate the phase of the moon for the current day
        double phase = moonPhase(day);

        // Determine the moon phase icon to display based on the phase
        String phaseIcon;
        if (phase < 0.0625) {
          phaseIcon = '🌑';
        } else if (phase < 0.1875) {
          phaseIcon = '🌒'; // Waxing crescent
        } else if (phase < 0.3125) {
          phaseIcon = '🌓'; // First quarter
        } else if (phase < 0.525) {
          phaseIcon = '🌔'; // Waxing gibbous
        } else if (phase < 0.5625) {
          phaseIcon = '🌕'; // Full moon
        } else if (phase < 0.6875) {
          phaseIcon = '🌖'; // Waning gibbous
        } else if (phase < 0.8125) {
          phaseIcon = '🌗'; // Last quarter
        } else {
          phaseIcon = '🌘'; // Waning crescent
        }
        int lunarDayint = moonAgeForToday(day);
        if (isToday) {
          return Container(
            decoration: null,
            color: Colors.transparent,
            child: MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(left: 6.0),
                          child: Text(
                            day.day.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.only(right: 6.0),
                          child: Text(
                            lunarDayint.toString(),
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.normal,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    phaseIcon,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        }
        if (!isThisMonthDay) {
          return Opacity(
            opacity: 0.5,
            child: Container(
              decoration: null,
              color: Colors.transparent,
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(left: 6.0),
                            child: Text(
                              day.day.toString(),
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.only(right: 6.0),
                            child: Text(
                              lunarDayint.toString(),
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      phaseIcon,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return Container(
          decoration: null,
          color: Colors.transparent,
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(left: 6.0),
                        child: Text(
                          day.day.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.only(right: 6.0),
                        child: Text(
                          lunarDayint.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  phaseIcon,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

// Calculates the phase of the moon for a given date
double moonPhase(DateTime day) {
  // Choose a reference day as a starting point
  DateTime referenceDay = DateTime(1970, 1, 7, 12);

  // Calculate the number of days between the reference day and the given day
  int daysSinceReference = day.difference(referenceDay).inDays;

  // Calculate the phase of the moon as a fraction of the lunar month (29.53 days)
  double phase = daysSinceReference / 29.53;

  // Return the phase, normalized to a value between 0 and 1
  return phase - phase.floor();
}

// Converts degrees to radians
double degToRad(double deg) {
  return deg * pi / 180;
}

// Calculates the Julian Day for a given date
double julianDay(int year, int month, int day, double hours) {
  int a = (14 - month) ~/ 12;
  int y = year + 4800 - a;
  int m = month + 12 * a - 3;
  int jdn =
      day + (153 * m + 2) ~/ 5 + 365 * y + y ~/ 4 - y ~/ 100 + y ~/ 400 - 32045;

  return jdn + (hours - 12) / 24;
}

// Calculates the number of Julian centuries since J2000.0
double julianCenturies(double jd) {
  return (jd - 2451545) / 36525;
}

// Calculates the geocentric mean longitude of the Moon
double geomMeanLongMoon(double t) {
  double l0 = 280.46646 + t * (36000.76983 + t * (0.0003032));
  while (l0 > 360) {
    l0 -= 360;
  }
  while (l0 < 0) {
    l0 += 360;
  }
  return l0;
}

double geomMeanLatMoon(double t) {
  double b0 = 87.5116 + t * (16029.08089 + t * (0.01394));
  while (b0 > 360) {
    b0 -= 360;
  }
  while (b0 < 0) {
    b0 += 360;
  }
  return b0;
}

// Calculates the ecliptic longitude of the Moon
double eclipLongitude(double mlon, double t) {
  double omega = 125.04452 - 1934.136261 * t;
  double elon = mlon + eclipCorrection(mlon, omega, t);
  return elon;
}

// Calculates the correction to the ecliptic longitude of the Moon
double eclipCorrection(double mlon, double omega, double t) {
  double elon = -0.0529539 * sin(degToRad(mlon)) +
      0.0020866 * sin(degToRad(2 * mlon)) +
      0.0002714 * sin(degToRad(2 * omega)) -
      0.0000292 * sin(degToRad(2 * mlon - 2 * omega)) +
      0.0000292 * sin(degToRad(2 * mlon + 2 * omega)) -
      0.0000246 * sin(degToRad(2 * mlon - omega)) -
      0.0000124 * sin(degToRad(2 * mlon + omega)) -
      0.0000078 * sin(degToRad(mlon - 2 * omega)) +
      0.0000047 * sin(degToRad(mlon + 2 * omega)) +
      0.0000044 * sin(degToRad(omega)) -
      0.0000042 * t * sin(degToRad(mlon)) +
      0.0000042 * t * sin(degToRad(omega)) -
      0.0000040 * t * sin(degToRad(2 * mlon)) -
      0.0000024 * t * sin(degToRad(2 * mlon - omega)) +
      0.0000019 * t * sin(degToRad(2 * mlon + omega)) +
      0.0000018 * t * sin(degToRad(2 * mlon - 2 * omega)) +
      0.0000017 * t * sin(degToRad(2 * mlon + 2 * omega));
  return elon;
}

// Calculates the ecliptic obliquity of the Earth
double eclipObliquity(double t) {
  double e0 = 23.0 +
      (26.0 + (21.448 - t * (46.8150 + t * (0.00059 - t * (0.001813)))) / 60) /
          60;
  return e0;
}

double eclipLatitude(double mlon, double mlat, double elon) {
  double sinb = sin(degToRad(mlat)) * cos(degToRad(elon)) -
      tan(degToRad(mlat)) * sin(degToRad(elon));
  double b = radToDeg(asin(sinb));
  return b;
}

// Calculates the solar longitude
double sunLongitude(double t) {
  double sunLon = 280.46646 + t * (36000.76983 + t * (0.0003032));
  sunLon = sunLon % 360;
  if (sunLon < 0) {
    sunLon += 360;
  }
  return sunLon;
}

// Converts radians to degrees
double radToDeg(double rad) {
  return rad * 180 / pi;
}
