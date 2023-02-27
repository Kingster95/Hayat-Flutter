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

import 'package:flutter/services.dart';

import 'dart:convert';

import 'package:webview_flutter/webview_flutter.dart';

class VimeoVideo extends StatefulWidget {
  const VimeoVideo({
    Key? key,
    this.width,
    this.height,
    required this.videoId,
    required this.referrer,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoId;
  final String referrer;

  @override
  _VimeoVideoState createState() => _VimeoVideoState();
}

class _VimeoVideoState extends State<VimeoVideo> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    String id = widget.videoId;
    return Scaffold(
      backgroundColor: Color(0xff3D1766),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return WebView(
            //initialUrl: 'https://player.vimeo.com/video/videoid',
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController controller) {
              controller.loadUrl(
                'https://player.vimeo.com/video/$id?autoplay=1',
                headers: {"Referer": "https://artadeafifemeie.ro"},
              );
            },
          );
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
