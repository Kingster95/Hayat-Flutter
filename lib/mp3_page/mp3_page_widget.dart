import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/buy_pack_widget.dart';
import '/flutter_flow/flutter_flow_audio_player.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'mp3_page_model.dart';
export 'mp3_page_model.dart';

class Mp3PageWidget extends StatefulWidget {
  const Mp3PageWidget({
    Key? key,
    this.meditation,
    this.pack,
  }) : super(key: key);

  final MeditationsRecord? meditation;
  final PacksRecord? pack;

  @override
  _Mp3PageWidgetState createState() => _Mp3PageWidgetState();
}

class _Mp3PageWidgetState extends State<Mp3PageWidget> {
  late Mp3PageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => Mp3PageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (!(currentUserDocument?.ownedMeds?.toList() ?? [])
          .contains(widget.meditation!.reference)) {
        if (widget.meditation!.index! >= 2) {
          await showModalBottomSheet(
            isScrollControlled: true,
            backgroundColor: Color(0x41121212),
            context: context,
            builder: (context) {
              return Padding(
                padding: MediaQuery.of(context).viewInsets,
                child: BuyPackWidget(),
              );
            },
          ).then((value) => setState(() {}));
        }
      }
    });
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

    return FutureBuilder<PacksRecord>(
      future: PacksRecord.getDocumentOnce(widget.meditation!.pack!),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50.0,
              height: 50.0,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).secondaryColor,
              ),
            ),
          );
        }
        final mp3PagePacksRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Inapoi',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Nunito Sans',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0.0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(),
                      child: Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(32.0),
                            child: Image.network(
                              valueOrDefault<String>(
                                '${widget.meditation!.video}',
                                'https://firebasestorage.googleapis.com/v0/b/hayat-371613.appspot.com/o/med%2Fafrodita%2F1.png?alt=media&token=35342585-0b2b-4d18-8203-f8d55ba8f207',
                              ),
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(),
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        widget.meditation!.name!,
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Nunito Sans',
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.95,
                    constraints: BoxConstraints(
                      maxHeight: MediaQuery.of(context).size.height * 0.4,
                    ),
                    decoration: BoxDecoration(
                      color: Color(0x36CDCDCD),
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    alignment: AlignmentDirectional(0.0, 0.0),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(5.0, 25.0, 5.0, 25.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.85,
                        decoration: BoxDecoration(),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              AutoSizeText(
                                widget.meditation!.description!,
                                textAlign: TextAlign.start,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Nunito Sans',
                                      fontSize: 13.0,
                                      lineHeight: 1.2,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.12,
                      decoration: BoxDecoration(),
                      child: Visibility(
                        visible: valueOrDefault<bool>(
                          (widget.meditation!.index! <= 1) ||
                              (currentUserDocument?.ownedMeds?.toList() ?? [])
                                  .contains(widget.meditation!.reference),
                          false,
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: AuthUserStreamWidget(
                            builder: (context) => FlutterFlowAudioPlayer(
                              audio: Audio.network(
                                valueOrDefault<String>(
                                  '${widget.meditation!.mp3}',
                                  'https://firebasestorage.googleapis.com/v0/b/hayat-371613.appspot.com/o/med%2Fafrodita%2FMeditatia%20Afrodita.mp4?alt=media&token=33b4b306-4063-4f62-a4c8-da1354601925',
                                ),
                                metas: Metas(
                                  id: 'sample3.mp3-y5jq0urr',
                                  title: widget.meditation!.name,
                                ),
                              ),
                              titleTextStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    fontWeight: FontWeight.w600,
                                  ),
                              playbackDurationTextStyle:
                                  FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12.0,
                                      ),
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              playbackButtonColor:
                                  FlutterFlowTheme.of(context).alternate,
                              activeTrackColor:
                                  FlutterFlowTheme.of(context).alternate,
                              elevation: 0.0,
                            ),
                          ),
                        ),
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
