import '/afirmatie_siprovocare/afirmatie_siprovocare_widget.dart';
import '/astral_calendar/astral_calendar_widget.dart';
import '/auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/category_courses/category_courses_widget.dart';
import '/category_list/category_list_widget.dart';
import '/chat_page/chat_page_widget.dart';
import '/components/buy_pack_widget.dart';
import '/components/subscription_widget.dart';
import '/demos/demos_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/main.dart';
import '/med_page/med_page_widget.dart';
import '/meditations/meditations_widget.dart';
import '/menstrual_calendar/menstrual_calendar_widget.dart';
import '/mp3_page/mp3_page_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomePageModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - subscriptionEnd] action in HomePage widget.
  bool? subscritpionEnd;
  // Stores action output result for [Backend Call - API (GET USER COURSES)] action in HomePage widget.
  ApiCallResponse? apiResultr1o;
  InstantTimer? instantTimer;
  // State field(s) for Column widget.
  ScrollController? columnController;
  // State field(s) for PageView widget.
  PageController? pageViewController;
  // State field(s) for SlideShow widget.
  PageController? slideShowController;
  // State field(s) for ListView widget.
  ScrollController? listViewController1;
  // State field(s) for ListView widget.
  ScrollController? listViewController2;
  // State field(s) for ListView widget.
  ScrollController? listViewController3;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    columnController = ScrollController();
    listViewController1 = ScrollController();
    listViewController2 = ScrollController();
    listViewController3 = ScrollController();
  }

  void dispose() {
    instantTimer?.cancel();
    columnController?.dispose();
    listViewController1?.dispose();
    listViewController2?.dispose();
    listViewController3?.dispose();
  }

  /// Additional helper methods are added here.

}
