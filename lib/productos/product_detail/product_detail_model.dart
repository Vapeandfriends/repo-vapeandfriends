import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/desechables/desechables_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import '/flutter_flow/custom_functions.dart' as functions;
import 'product_detail_widget.dart' show ProductDetailWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailModel extends FlutterFlowModel<ProductDetailWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for CountController widget.
  int? countControllerValue;
  // Model for Desechables component.
  late DesechablesModel desechablesModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductoSeleccionadoRecord? productoCreadoExiste;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductoSeleccionadoRecord? productoCreado;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductoSeleccionadoRecord? productoCreadoExiste1;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ProductoSeleccionadoRecord? productoCreado1;

  @override
  void initState(BuildContext context) {
    desechablesModel = createModel(context, () => DesechablesModel());
  }

  @override
  void dispose() {
    desechablesModel.dispose();
  }
}
