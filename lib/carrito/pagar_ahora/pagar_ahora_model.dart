import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'pagar_ahora_widget.dart' show PagarAhoraWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

class PagarAhoraModel extends FlutterFlowModel<PagarAhoraWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // State field(s) for nombre widget.
  FocusNode? nombreFocusNode;
  TextEditingController? nombreTextController;
  String? Function(BuildContext, String?)? nombreTextControllerValidator;
  // State field(s) for numeroTarjeta widget.
  FocusNode? numeroTarjetaFocusNode;
  TextEditingController? numeroTarjetaTextController;
  String? Function(BuildContext, String?)? numeroTarjetaTextControllerValidator;
  String? _numeroTarjetaTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Necesitamos que ingreses este campo para enviar tus pedidos';
    }

    return null;
  }

  // State field(s) for mes widget.
  FocusNode? mesFocusNode;
  TextEditingController? mesTextController;
  final mesMask = MaskTextInputFormatter(mask: '##');
  String? Function(BuildContext, String?)? mesTextControllerValidator;
  // State field(s) for year widget.
  FocusNode? yearFocusNode;
  TextEditingController? yearTextController;
  final yearMask = MaskTextInputFormatter(mask: '####');
  String? Function(BuildContext, String?)? yearTextControllerValidator;
  // State field(s) for CCV widget.
  FocusNode? ccvFocusNode;
  TextEditingController? ccvTextController;
  String? Function(BuildContext, String?)? ccvTextControllerValidator;
  // State field(s) for ID widget.
  FocusNode? idFocusNode;
  TextEditingController? idTextController;
  String? Function(BuildContext, String?)? idTextControllerValidator;
  String? _idTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Necesitamos que ingreses este campo para enviar tus pedidos';
    }

    return null;
  }

  // Stores action output result for [Backend Call - API (Obtener Token Card)] action in Button widget.
  ApiCallResponse? apiResult3y2;
  // Stores action output result for [Backend Call - API (Crea Pago Tarjeta)] action in Button widget.
  ApiCallResponse? apiResultwfr;

  @override
  void initState(BuildContext context) {
    numeroTarjetaTextControllerValidator =
        _numeroTarjetaTextControllerValidator;
    idTextControllerValidator = _idTextControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nombreFocusNode?.dispose();
    nombreTextController?.dispose();

    numeroTarjetaFocusNode?.dispose();
    numeroTarjetaTextController?.dispose();

    mesFocusNode?.dispose();
    mesTextController?.dispose();

    yearFocusNode?.dispose();
    yearTextController?.dispose();

    ccvFocusNode?.dispose();
    ccvTextController?.dispose();

    idFocusNode?.dispose();
    idTextController?.dispose();
  }
}
