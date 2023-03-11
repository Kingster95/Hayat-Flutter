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
import 'buy_pack_model.dart';
export 'buy_pack_model.dart';

class BuyPackWidget extends StatefulWidget {
  const BuyPackWidget({Key? key}) : super(key: key);

  @override
  _BuyPackWidgetState createState() => _BuyPackWidgetState();
}

class _BuyPackWidgetState extends State<BuyPackWidget> {
  late BuyPackModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BuyPackModel());
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
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.8,
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
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4.0,
                              color: Color(0x33000000),
                              offset: Offset(0.0, 2.0),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.75,
                                decoration: BoxDecoration(),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 15.0, 0.0, 0.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.64,
                                          decoration: BoxDecoration(),
                                          alignment:
                                              AlignmentDirectional(0.0, 0.0),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                AutoSizeText(
                                                  'Pachet de meditatii “ Like a Diva” .\nPrin aceste tehnici vei ieși la alt nivel, vei realiza saltul cuantic. Doar meditația te invata sa trăiești acum și aici, sa simți clipa, sa-ți calmezi mintea. \nMajoritatea oamenilor trăiesc in trecut sau viitor. Vina, regretele, dezamăgirile, despărțirile, durerea ne fac sa traim in trecut. Grijile, nelinistea pentru ziua de mâine ne fac sa trăim in viitor. Magia este posibila doar când accesezi starea acum și aici. Fericirea trăiește doar in aceasta stare. \nPachetul include următoarele meditatii: \n1. Pasarea Pheonix \n2. Puterea strămoșilor\n3. Reconectarea la puterea personală \n4. Programarea realității\n5. Vocația\n6. Dragostea de sine \n7. Conectarea la femeile puterii\n8. Meditația Stop HATE\n9. Meditația banilor \nPreț pachet: 2222 lei cu acces pe viața ( atâta timp cât va exista aplicația Hayat) \nAtenție! Oferta este valabilă pana pe 03.03.2023 \nÎncepând cu 04.03. 2023 pachetul va costa 3152 lei cu acces pentru 6 luni.\n\nAccesul in aplicație se face in baza abonamentului lunar.',
                                                  textAlign: TextAlign.start,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Nunito Sans',
                                                        fontSize: 14.0,
                                                        lineHeight: 1.2,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.05,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          borderRadius:
                                              BorderRadius.circular(22.0),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            if (isiOS) {
                                              final isEntitled =
                                                  await revenue_cat.isEntitled(
                                                      'monthly_access');
                                              if (isEntitled == null) {
                                                return;
                                              } else if (!isEntitled) {
                                                await revenue_cat
                                                    .loadOfferings();
                                              }

                                              if (isEntitled) {
                                                Navigator.pop(context);
                                              } else {
                                                _model.didPurchase =
                                                    await revenue_cat
                                                        .purchasePackage(
                                                            revenue_cat
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
                                                          color: FlutterFlowTheme
                                                                  .of(context)
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
                                                amount: 222200,
                                                currency: 'RON',
                                                customerEmail: currentUserEmail,
                                                customerName:
                                                    currentUserDisplayName,
                                                description:
                                                    'Pachet de meditatii “ Like a Diva”',
                                                allowGooglePay: true,
                                                allowApplePay: true,
                                              );
                                              if (paymentResponse.paymentId ==
                                                  null) {
                                                if (paymentResponse
                                                        .errorMessage !=
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
                                                final usersUpdateData2 = {
                                                  'owned_meds':
                                                      FFAppState().packMeds,
                                                };
                                                await currentUserReference!
                                                    .update(usersUpdateData2);
                                              } else {
                                                await showDialog(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Detalii Tranzactie'),
                                                      content: Text(
                                                          'Plata nu a fost efectuata cu succes'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext),
                                                          child: Text('Ok'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              }

                                              Navigator.pop(context);
                                            }

                                            setState(() {});
                                          },
                                          text: 'Cumpara',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: double.infinity,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryColor,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Nunito Sans',
                                                      color: Colors.white,
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
                            Align(
                              alignment: AlignmentDirectional(0.87, -0.95),
                              child: InkWell(
                                onTap: () async {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.close,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 36.0,
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
          ),
        ],
      ),
    );
  }
}
