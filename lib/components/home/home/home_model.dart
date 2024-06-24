import '/auth/base_auth_user_provider.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/accesorios/accesorios_widget.dart';
import '/components/baterias/baterias_widget.dart';
import '/components/desechables/desechables_widget.dart';
import '/components/equipos/equipos_widget.dart';
import '/components/herbales/herbales_widget.dart';
import '/components/liquidos/liquidos_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'home_widget.dart' show HomeWidget;
import 'package:smooth_page_indicator/smooth_page_indicator.dart'
    as smooth_page_indicator;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeModel extends FlutterFlowModel<HomeWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for Desechables component.
  late DesechablesModel desechablesModel;
  // Model for Liquidos component.
  late LiquidosModel liquidosModel;
  // Model for Equipos component.
  late EquiposModel equiposModel;
  // Model for Baterias component.
  late BateriasModel bateriasModel;
  // Model for Accesorios component.
  late AccesoriosModel accesoriosModel;
  // Model for Herbales component.
  late HerbalesModel herbalesModel;
  // State field(s) for Carousel widget.
  CarouselController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    desechablesModel = createModel(context, () => DesechablesModel());
    liquidosModel = createModel(context, () => LiquidosModel());
    equiposModel = createModel(context, () => EquiposModel());
    bateriasModel = createModel(context, () => BateriasModel());
    accesoriosModel = createModel(context, () => AccesoriosModel());
    herbalesModel = createModel(context, () => HerbalesModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    desechablesModel.dispose();
    liquidosModel.dispose();
    equiposModel.dispose();
    bateriasModel.dispose();
    accesoriosModel.dispose();
    herbalesModel.dispose();
  }
}
