import '/auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/stripe/payment_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/main.dart';
import '/flutter_flow/revenue_cat_util.dart' as revenue_cat;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'subscription_model.dart';
export 'subscription_model.dart';

class SubscriptionWidget extends StatefulWidget {
  const SubscriptionWidget({Key? key}) : super(key: key);

  @override
  _SubscriptionWidgetState createState() => _SubscriptionWidgetState();
}

class _SubscriptionWidgetState extends State<SubscriptionWidget> {
  late SubscriptionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubscriptionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45.0),
              ),
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: Image.asset(
                              'assets/images/Calendar_astrologic.png',
                            ).image,
                          ),
                          borderRadius: BorderRadius.circular(45.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: MediaQuery.of(context).size.height * 0.4,
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    decoration: BoxDecoration(),
                                    alignment:
                                        AlignmentDirectional(-0.85, -0.4),
                                    child: AutoSizeText(
                                      'Continua cu\nplanul tau',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            fontSize: 38.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                  decoration: BoxDecoration(),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
                                  decoration: BoxDecoration(),
                                  alignment: AlignmentDirectional(-0.9, -0.4),
                                  child: Text(
                                    '49,99 lei / luna',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Nunito Sans',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  decoration: BoxDecoration(),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.5, 0.0),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    decoration: BoxDecoration(),
                                    child: AutoSizeText(
                                      'Zeci de beneficii de care poti beneficia in continuare special create doar pentru nevoile tale',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Nunito Sans',
                                            color: Color(0xFFB8B8B8),
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                  decoration: BoxDecoration(),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.65,
                                    height: MediaQuery.of(context).size.height *
                                        0.05,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20.0),
                                    ),
                                    alignment: AlignmentDirectional(0.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        if (isiOS) {
                                          final isEntitled = await revenue_cat
                                              .isEntitled('abonament_lunar');
                                          if (isEntitled == null) {
                                            return;
                                          } else if (!isEntitled) {
                                            await revenue_cat.loadOfferings();
                                          }

                                          if (isEntitled) {
                                            Navigator.pop(context);
                                          } else {
                                            _model.didPurchase =
                                                await revenue_cat
                                                    .purchasePackage(revenue_cat
                                                        .offerings!
                                                        .current!
                                                        .monthly!
                                                        .identifier);
                                            if (_model.didPurchase!) {
                                              await Navigator
                                                  .pushAndRemoveUntil(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      NavBarPage(
                                                          initialPage:
                                                              'HomePage'),
                                                ),
                                                (r) => false,
                                              );

                                              final usersUpdateData1 =
                                                  createUsersRecordData(
                                                subscribed: true,
                                                subscriptionDate:
                                                    getCurrentTimestamp,
                                              );
                                              await currentUserReference!
                                                  .update(usersUpdateData1);
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Tranzactie Esuata!',
                                                    style: TextStyle(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0x00000000),
                                                ),
                                              );
                                            }
                                          }
                                        } else {
                                          final paymentResponse =
                                              await processStripePayment(
                                            context,
                                            amount: 4999,
                                            currency: 'RON',
                                            customerEmail: currentUserEmail,
                                            customerName:
                                                currentUserDisplayName,
                                            description: 'Abonament Hayat',
                                            allowGooglePay: true,
                                            allowApplePay: true,
                                            buttonColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryColor,
                                            buttonTextColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryText,
                                          );
                                          if (paymentResponse.paymentId ==
                                              null) {
                                            if (paymentResponse.errorMessage !=
                                                null) {
                                              showSnackbar(
                                                context,
                                                'Error: ${paymentResponse.errorMessage}',
                                              );
                                            }
                                            return;
                                          }
                                          _model.paymentId =
                                              paymentResponse.paymentId!;

                                          if (_model.paymentId != null &&
                                              _model.paymentId != '') {
                                            final usersUpdateData2 =
                                                createUsersRecordData(
                                              subscribed: true,
                                              subscriptionDate:
                                                  getCurrentTimestamp,
                                            );
                                            await currentUserReference!
                                                .update(usersUpdateData2);
                                            Navigator.pop(context);
                                          } else {
                                            Navigator.pop(context);
                                          }
                                        }

                                        setState(() {});
                                      },
                                      text: 'Inscrie-te acum!',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: double.infinity,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: Color(0xFF5F4D7D),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .subtitle2
                                            .override(
                                              fontFamily: 'Nunito Sans',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 18.0,
                                            ),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () async {
              Navigator.pop(context);
            },
            child: Text(
              'Nu multumesc.',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 18.0,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
