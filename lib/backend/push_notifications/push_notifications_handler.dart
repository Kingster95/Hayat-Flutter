import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Center(
          child: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircularProgressIndicator(
              color: FlutterFlowTheme.of(context).secondaryColor,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'Welcome': (data) async => WelcomeWidget(),
  'LoginAccount': (data) async => LoginAccountWidget(),
  'CreateAccount': (data) async => CreateAccountWidget(),
  'CreateProfile': (data) async => CreateProfileWidget(
        password: getParameter(data, 'password'),
        email: getParameter(data, 'email'),
        existing: getParameter(data, 'existing'),
      ),
  'DoneAccount': (data) async => DoneAccountWidget(),
  'ChatPage': (data) async => ChatPageWidget(
        chatUser: await getDocumentParameter(
            data, 'chatUser', UsersRecord.serializer),
        chatRef: getParameter(data, 'chatRef'),
      ),
  'CreatePin': (data) async => CreatePinWidget(),
  'EnterPin': (data) async => EnterPinWidget(),
  'AllChats': (data) async => NavBarPage(initialPage: 'AllChats'),
  'SocialMap': (data) async => hasMatchingParameters(data, {'locationsDoc'})
      ? SocialMapWidget(
          locationsDoc: [],
        )
      : NavBarPage(initialPage: 'SocialMap'),
  'MyCourses': (data) async => NavBarPage(initialPage: 'MyCourses'),
  'CreateProfileCopy': (data) async =>
      hasMatchingParameters(data, {'password', 'email'})
          ? CreateProfileCopyWidget(
              password: getParameter(data, 'password'),
              email: getParameter(data, 'email'),
            )
          : NavBarPage(initialPage: 'CreateProfileCopy'),
  'categoryList': (data) async => CategoryListWidget(
        categoryId: getParameter(data, 'categoryId'),
      ),
  'categoryCourses': (data) async => CategoryCoursesWidget(
        categoryId: getParameter(data, 'categoryId'),
      ),
  'CoursePage': (data) async => CoursePageWidget(
        body: getParameter(data, 'body'),
        unlocked: getParameter(data, 'unlocked'),
        med: getParameter(data, 'med'),
      ),
  'vimeoVideo': (data) async => VimeoVideoWidget(
        videoID: getParameter(data, 'videoID'),
      ),
  'MenstrualCalendar': (data) async => MenstrualCalendarWidget(),
  'webView': (data) async => WebViewWidget(
        id: getParameter(data, 'id'),
      ),
  'astralCalendar': (data) async => AstralCalendarWidget(),
  'medPage': (data) async => MedPageWidget(
        meditation: await getDocumentParameter(
            data, 'meditation', MeditationsRecord.serializer),
      ),
  'meditations': (data) async => MeditationsWidget(),
  'demos': (data) async => DemosWidget(),
  'video': (data) async => VideoWidget(
        path: getParameter(data, 'path'),
      ),
  'afirmatieSiprovocare': (data) async => AfirmatieSiprovocareWidget(
        text: getParameter(data, 'text'),
      ),
  'lunarDay': (data) async => LunarDayWidget(
        lunarDate: getParameter(data, 'lunarDate'),
        location: getParameter(data, 'location'),
      ),
  'lectiiDemo': (data) async => LectiiDemoWidget(
        categorie: await getDocumentParameter(
            data, 'categorie', CategoriiDemoRecord.serializer),
      ),
  'mp3Page': (data) async => Mp3PageWidget(
        meditation: await getDocumentParameter(
            data, 'meditation', MeditationsRecord.serializer),
        pack: await getDocumentParameter(data, 'pack', PacksRecord.serializer),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
