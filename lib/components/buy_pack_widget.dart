import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/stripe/payment_manager.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
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
      alignment: AlignmentDirectional(0, 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.95,
              height: MediaQuery.of(context).size.height * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(45),
              ),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.95,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primaryBackground,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                        ),
                        alignment: AlignmentDirectional(0, 0),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0, 0),
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
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 15, 0, 0),
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
                                          alignment: AlignmentDirectional(0, 0),
                                          child: AutoSizeText(
                                            'Pachet de meditatii ??? Like a Diva??? .\nPrin aceste tehnici vei ie??i la alt nivel, vei realiza saltul cuantic. Doar medita??ia te invata sa tr??ie??ti acum ??i aici, sa sim??i clipa, sa-??i calmezi mintea. \nMajoritatea oamenilor tr??iesc in trecut sau viitor. Vina, regretele, dezam??girile, desp??r??irile, durerea ne fac sa traim in trecut. Grijile, nelinistea pentru ziua de m??ine ne fac sa tr??im in viitor. Magia este posibila doar c??nd accesezi starea acum ??i aici. Fericirea tr??ie??te doar in aceasta stare. \nPachetul include urm??toarele meditatii: \n1. Pasarea Pheonix \n2. Puterea str??mo??ilor\n3. Reconectarea la puterea personal?? \n4. Programarea realit????ii\n5. Voca??ia\n6. Dragostea de sine \n7. Conectarea la femeile puterii\n8. Medita??ia Stop HATE\n9. Medita??ia banilor \nPre?? pachet: 2222 lei cu acces pe via??a ( at??ta timp c??t va exista aplica??ia Hayat) \nAten??ie! Oferta este valabil?? pana pe 03.03.2023 \n??ncep??nd cu 04.03. 2023 pachetul va costa 3152 lei cu acces pentru 6 luni.\n\nAccesul in aplica??ie se face in baza abonamentului lunar de 7 euro.',
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Nunito Sans',
                                                  fontSize: 15,
                                                  lineHeight: 1.2,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 5),
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
                                              BorderRadius.circular(22),
                                        ),
                                        child: FFButtonWidget(
                                          onPressed: () async {
                                            final paymentResponse =
                                                await processStripePayment(
                                              context,
                                              amount: 222200,
                                              currency: 'RON',
                                              customerEmail: currentUserEmail,
                                              customerName:
                                                  currentUserDisplayName,
                                              description:
                                                  'Pachet de meditatii ??? Like a Diva???',
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
                                              final usersUpdateData = {
                                                'owned_meds':
                                                    FFAppState().packMeds,
                                              };
                                              await currentUserReference!
                                                  .update(usersUpdateData);
                                            } else {
                                              await showDialog(
                                                context: context,
                                                builder: (alertDialogContext) {
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

                                            setState(() {});
                                          },
                                          text: 'Cumpara',
                                          options: FFButtonOptions(
                                            width: double.infinity,
                                            height: double.infinity,
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
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                  size: 36,
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
