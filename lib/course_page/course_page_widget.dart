import '../backend/api_requests/api_calls.dart';
import '../components/buy_pop_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../vimeo_video/vimeo_video_widget.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'course_page_model.dart';
export 'course_page_model.dart';

class CoursePageWidget extends StatefulWidget {
  const CoursePageWidget({
    Key? key,
    this.body,
    this.unlocked,
    bool? med,
  })  : this.med = med ?? false,
        super(key: key);

  final dynamic body;
  final bool? unlocked;
  final bool med;

  @override
  _CoursePageWidgetState createState() => _CoursePageWidgetState();
}

class _CoursePageWidgetState extends State<CoursePageWidget> {
  late CoursePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CoursePageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: GetUserCoursesCall.call(),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ),
          );
        }
        final coursePageGetUserCoursesResponse = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.37,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 1,
                        child: Stack(
                          alignment: AlignmentDirectional(0, 0),
                          children: [
                            Image.network(
                              valueOrDefault<String>(
                                getJsonField(
                                  widget.body,
                                  r'''$.image''',
                                ),
                                'https://arta2.b-cdn.net/cover_cursuri/7.png',
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height * 1,
                              fit: BoxFit.fitWidth,
                            ),
                            Align(
                              alignment: AlignmentDirectional(-1, -1),
                              child: FlutterFlowIconButton(
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 60,
                                icon: Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 25,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.02,
                    decoration: BoxDecoration(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.07,
                    decoration: BoxDecoration(),
                    child: AutoSizeText(
                      getJsonField(
                        widget.body,
                        r'''$.name''',
                      ).toString(),
                      style: FlutterFlowTheme.of(context).bodyText1.override(
                            fontFamily: 'Nunito Sans',
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.015,
                    decoration: BoxDecoration(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.041,
                    decoration: BoxDecoration(),
                    child: Stack(
                      children: [
                        if (() {
                          if (getJsonField(
                                widget.body,
                                r'''$.so''',
                              ) ==
                              '1') {
                            return false;
                          } else if (getJsonField(
                                widget.body,
                                r'''$.offer''',
                              ) !=
                              '0') {
                            return false;
                          } else {
                            return true;
                          }
                        }())
                          Text(
                            valueOrDefault<String>(
                              '${getJsonField(
                                widget.body,
                                r'''$.price''',
                              ).toString()}  Lei',
                              'Pret afisat pe site',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        if (getJsonField(
                              widget.body,
                              r'''$.so''',
                            ) ==
                            '1')
                          Text(
                            'SOLD OUT',
                            textAlign: TextAlign.start,
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Nunito Sans',
                                      color: Color(0xFF800909),
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                          ),
                        if (() {
                          if (getJsonField(
                                widget.body,
                                r'''$.so''',
                              ) ==
                              '1') {
                            return false;
                          } else if (getJsonField(
                                widget.body,
                                r'''$.offer''',
                              ) ==
                              '0') {
                            return false;
                          } else {
                            return true;
                          }
                        }())
                          Text(
                            valueOrDefault<String>(
                              '${getJsonField(
                                widget.body,
                                r'''$.offer''',
                              ).toString()}  Lei',
                              'Pret afisat pe site',
                            ),
                            textAlign: TextAlign.start,
                            style: FlutterFlowTheme.of(context)
                                .bodyText1
                                .override(
                                  fontFamily: 'Nunito Sans',
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                      ],
                    ),
                  ),
                  Container(
                    width: 100,
                    height: MediaQuery.of(context).size.height * 0.014,
                    decoration: BoxDecoration(),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.5,
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                if (() {
                                  if (getJsonField(
                                        widget.body,
                                        r'''$.is_pack''',
                                      ) ==
                                      '1') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '4') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '7') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '8') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '9') {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                }())
                                  DefaultTabController(
                                    length: 2,
                                    initialIndex: 0,
                                    child: Column(
                                      children: [
                                        TabBar(
                                          labelColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          unselectedLabelColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                          labelStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1,
                                          indicatorColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryText,
                                          tabs: [
                                            Tab(
                                              text: 'Despre',
                                            ),
                                            Tab(
                                              text: 'Lectii',
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: TabBarView(
                                            children: [
                                              SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 10, 0, 0),
                                                      child: AutoSizeText(
                                                        valueOrDefault<String>(
                                                          functions.cleanString(
                                                              getJsonField(
                                                            widget.body,
                                                            r'''$.description''',
                                                          ).toString()),
                                                          'Descriere',
                                                        ),
                                                        textAlign:
                                                            TextAlign.start,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Nunito Sans',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              FutureBuilder<ApiCallResponse>(
                                                future:
                                                    GetCoursesLessonsCall.call(
                                                  id: getJsonField(
                                                    widget.body,
                                                    r'''$.id''',
                                                  ).toString(),
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final listViewGetCoursesLessonsResponse =
                                                      snapshot.data!;
                                                  return Builder(
                                                    builder: (context) {
                                                      final lesson =
                                                          getJsonField(
                                                        listViewGetCoursesLessonsResponse
                                                            .jsonBody,
                                                        r'''$.data''',
                                                      ).toList();
                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            lesson.length,
                                                        itemBuilder: (context,
                                                            lessonIndex) {
                                                          final lessonItem =
                                                              lesson[
                                                                  lessonIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        15,
                                                                        0,
                                                                        0),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.1,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16),
                                                              ),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          'Lecția Numarul ${valueOrDefault<String>(
                                                                            lessonIndex.toString(),
                                                                            '0',
                                                                          )}',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  if (valueOrDefault<
                                                                      bool>(
                                                                    () {
                                                                      if (widget
                                                                          .unlocked!) {
                                                                        return true;
                                                                      } else if ((lessonIndex ==
                                                                              0) &&
                                                                          (getJsonField(
                                                                                widget.body,
                                                                                r'''$.has_demo''',
                                                                              ) ==
                                                                              '1')) {
                                                                        return true;
                                                                      } else {
                                                                        return false;
                                                                      }
                                                                    }(),
                                                                    false,
                                                                  ))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            60,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .play_circle_fill,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              45,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          if (lessonIndex ==
                                                                              0) {
                                                                            if (getJsonField(
                                                                                  widget.body,
                                                                                  r'''$.has_demo''',
                                                                                ) ==
                                                                                '1') {
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => VimeoVideoWidget(
                                                                                    videoID: getJsonField(
                                                                                      lessonItem,
                                                                                      r'''$.video_id''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              if (widget.unlocked!) {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) => VimeoVideoWidget(
                                                                                      videoID: getJsonField(
                                                                                        lessonItem,
                                                                                        r'''$.video_id''',
                                                                                      ).toString(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                            }
                                                                          } else {
                                                                            if (widget.unlocked!) {
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => VimeoVideoWidget(
                                                                                    videoID: getJsonField(
                                                                                      lessonItem,
                                                                                      r'''$.video_id''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                  if (!valueOrDefault<
                                                                      bool>(
                                                                    () {
                                                                      if (widget
                                                                          .unlocked!) {
                                                                        return true;
                                                                      } else if ((lessonIndex ==
                                                                              0) &&
                                                                          (getJsonField(
                                                                                widget.body,
                                                                                r'''$.has_demo''',
                                                                              ) ==
                                                                              '1')) {
                                                                        return true;
                                                                      } else {
                                                                        return false;
                                                                      }
                                                                    }(),
                                                                    false,
                                                                  ))
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              25,
                                                                              0),
                                                                      child:
                                                                          FlutterFlowIconButton(
                                                                        borderColor:
                                                                            Colors.transparent,
                                                                        borderRadius:
                                                                            30,
                                                                        borderWidth:
                                                                            1,
                                                                        buttonSize:
                                                                            60,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .lock,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          size:
                                                                              36,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          if (lessonIndex ==
                                                                              0) {
                                                                            if (widget.med ==
                                                                                false) {
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => VimeoVideoWidget(
                                                                                    videoID: getJsonField(
                                                                                      lessonItem,
                                                                                      r'''$.video_id''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            } else {
                                                                              if (getJsonField(
                                                                                    widget.body,
                                                                                    r'''$.id''',
                                                                                  ) ==
                                                                                  '41') {
                                                                                await Navigator.push(
                                                                                  context,
                                                                                  MaterialPageRoute(
                                                                                    builder: (context) => VimeoVideoWidget(
                                                                                      videoID: getJsonField(
                                                                                        lessonItem,
                                                                                        r'''$.video_id''',
                                                                                      ).toString(),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              } else {
                                                                                await launchURL('https://artadeafifemeie.ro/detalii-curs/${getJsonField(
                                                                                  widget.body,
                                                                                  r'''$.slug''',
                                                                                ).toString()}');
                                                                              }
                                                                            }
                                                                          } else {
                                                                            if (widget.unlocked!) {
                                                                              await Navigator.push(
                                                                                context,
                                                                                MaterialPageRoute(
                                                                                  builder: (context) => VimeoVideoWidget(
                                                                                    videoID: getJsonField(
                                                                                      lessonItem,
                                                                                      r'''$.video_id''',
                                                                                    ).toString(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            }
                                                                          }
                                                                        },
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                if (!() {
                                  if (getJsonField(
                                        widget.body,
                                        r'''$.is_pack''',
                                      ) ==
                                      '1') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '4') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '7') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '8') {
                                    return false;
                                  } else if (getJsonField(
                                        widget.body,
                                        r'''$.cat_id''',
                                      ) ==
                                      '9') {
                                    return false;
                                  } else {
                                    return true;
                                  }
                                }())
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.9,
                                    decoration: BoxDecoration(),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: AutoSizeText(
                                              valueOrDefault<String>(
                                                functions
                                                    .cleanString(getJsonField(
                                                  widget.body,
                                                  r'''$.description''',
                                                ).toString()),
                                                'Descriere',
                                              ),
                                              textAlign: TextAlign.start,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Nunito Sans',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          if (!widget.unlocked!)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 15, 0, 35),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (false)
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 10, 0),
                                          child: FutureBuilder<ApiCallResponse>(
                                            future: GetCoursesLessonsCall.call(
                                              id: getJsonField(
                                                widget.body,
                                                r'''$.id''',
                                              ).toString(),
                                            ),
                                            builder: (context, snapshot) {
                                              // Customize what your widget looks like when it's loading.
                                              if (!snapshot.hasData) {
                                                return Center(
                                                  child: SizedBox(
                                                    width: 50,
                                                    height: 50,
                                                    child:
                                                        CircularProgressIndicator(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              final buttonGetCoursesLessonsResponse =
                                                  snapshot.data!;
                                              return FFButtonWidget(
                                                onPressed: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          VimeoVideoWidget(
                                                        videoID: getJsonField(
                                                          buttonGetCoursesLessonsResponse
                                                              .jsonBody,
                                                          r'''$.data[0].video_id''',
                                                        ).toString(),
                                                      ),
                                                    ),
                                                  );
                                                },
                                                text: 'Vezi demo curs',
                                                options: FFButtonOptions(
                                                  width: 1,
                                                  height: double.infinity,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .subtitle2
                                                          .override(
                                                            fontFamily:
                                                                'Nunito Sans',
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            lineHeight: 1.4,
                                                          ),
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    if (!widget.unlocked!)
                                      Expanded(
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            await showModalBottomSheet(
                                              isScrollControlled: true,
                                              backgroundColor:
                                                  Colors.transparent,
                                              context: context,
                                              builder: (context) {
                                                return Padding(
                                                  padding:
                                                      MediaQuery.of(context)
                                                          .viewInsets,
                                                  child: Container(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            1,
                                                    child: BuyPopWidget(
                                                      slug: valueOrDefault<
                                                          String>(
                                                        getJsonField(
                                                          widget.body,
                                                          r'''$.slug''',
                                                        ).toString(),
                                                        '\$.slug',
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).then((value) => setState(() {}));
                                          },
                                          text: 'Inscrie-te',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: double.infinity,
                                            color: FlutterFlowTheme.of(context)
                                                .alternate,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      lineHeight: 1.4,
                                                    ),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(100),
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
