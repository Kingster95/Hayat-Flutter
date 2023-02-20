import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../create_account/create_account_widget.dart';
import '../create_pin/create_pin_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CreateProfileModel extends FlutterFlowModel {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  bool isMediaUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Nume widget.
  TextEditingController? numeController;
  String? Function(BuildContext, String?)? numeControllerValidator;
  String? _numeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Camp Obligatoriu';
    }

    if (val.length < 3) {
      return 'Minim 3 caractere';
    }

    return null;
  }

  // State field(s) for Prenume widget.
  TextEditingController? prenumeController;
  String? Function(BuildContext, String?)? prenumeControllerValidator;
  String? _prenumeControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Camp Obligatoriu';
    }

    if (val.length < 3) {
      return 'Minim 3 caractere';
    }

    return null;
  }

  // State field(s) for Username widget.
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Camp Obligatoriu';
    }

    if (val.length < 3) {
      return 'Minim 3 caractere';
    }

    return null;
  }

  // State field(s) for Telefon widget.
  TextEditingController? telefonController;
  String? Function(BuildContext, String?)? telefonControllerValidator;
  // State field(s) for Email widget.
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for Password widget.
  TextEditingController? passwordController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordControllerValidator;
  // Stores action output result for [Backend Call - API (REGISTER)] action in Button widget.
  ApiCallResponse? apiResulthue;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LocationsRecord? locDoc;
  // Stores action output result for [Backend Call - API (LOGIN)] action in Button widget.
  ApiCallResponse? login;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {
    numeControllerValidator = _numeControllerValidator;
    prenumeControllerValidator = _prenumeControllerValidator;
    usernameControllerValidator = _usernameControllerValidator;
    passwordVisibility = false;
  }

  void dispose() {
    numeController?.dispose();
    prenumeController?.dispose();
    usernameController?.dispose();
    telefonController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
  }

  /// Additional helper methods are added here.

}
