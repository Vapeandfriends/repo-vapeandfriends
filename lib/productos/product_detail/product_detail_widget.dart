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
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'product_detail_model.dart';
export 'product_detail_model.dart';

class ProductDetailWidget extends StatefulWidget {
  const ProductDetailWidget({
    super.key,
    required this.productos,
  });

  final ProductosRecord? productos;

  @override
  State<ProductDetailWidget> createState() => _ProductDetailWidgetState();
}

class _ProductDetailWidgetState extends State<ProductDetailWidget>
    with TickerProviderStateMixin {
  late ProductDetailModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProductDetailModel());

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 60.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'rowOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 80.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(0.0, 140.0),
            end: Offset(0.0, 0.0),
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CarritoRecord>>(
      stream: queryCarritoRecord(
        queryBuilder: (carritoRecord) => carritoRecord
            .where(
              'creator',
              isEqualTo: currentUserReference,
            )
            .where(
              'isActive',
              isEqualTo: true,
            ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondary,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<CarritoRecord> productDetailCarritoRecordList = snapshot.data!;
        final productDetailCarritoRecord =
            productDetailCarritoRecordList.isNotEmpty
                ? productDetailCarritoRecordList.first
                : null;
        return Title(
            title: 'ProductDetail',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).secondary,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).secondary,
                automaticallyImplyLeading: false,
                leading: InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    context.pop();
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 24.0,
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0.0,
              ),
              body: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 16.0),
                            child: Hero(
                              tag: valueOrDefault<String>(
                                widget.productos?.imagen,
                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/travel-app-u6jlgp/assets/vdmex861zjvw/cropped-favicon.png',
                              ),
                              transitionOnUserGestures: true,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16.0),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    widget.productos?.imagen,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/travel-app-u6jlgp/assets/vdmex861zjvw/cropped-favicon.png',
                                  ),
                                  width: double.infinity,
                                  height: 370.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 280.0,
                                height: 100.0,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(-1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 0.0, 16.0, 0.0),
                                    child: Text(
                                      valueOrDefault<String>(
                                        widget.productos?.name,
                                        '[name]',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 16.0, 0.0),
                                child: RichText(
                                  textScaler: MediaQuery.of(context).textScaler,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: valueOrDefault<String>(
                                          widget.productos?.categoria,
                                          '[Categoría]',
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'HelveticaNeue',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      )
                                    ],
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Poppins',
                                          letterSpacing: 0.0,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 12.0, 16.0, 16.0),
                            child: Text(
                              valueOrDefault<String>(
                                widget.productos?.description,
                                '[description]',
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color(0xFF414647),
                                    letterSpacing: 0.0,
                                  ),
                            ).animateOnPageLoad(
                                animationsMap['textOnPageLoadAnimation']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 40.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  formatNumber(
                                    widget.productos!.price,
                                    formatType: FormatType.decimal,
                                    decimalType: DecimalType.automatic,
                                    currency: '',
                                  ),
                                  textAlign: TextAlign.start,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        letterSpacing: 0.0,
                                      ),
                                ),
                                Container(
                                  width: 160.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    borderRadius: BorderRadius.circular(25.0),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: FlutterFlowCountController(
                                    decrementIconBuilder: (enabled) => Icon(
                                      Icons.remove_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context)
                                              .tertiary
                                          : FlutterFlowTheme.of(context)
                                              .tertiary,
                                      size: 20.0,
                                    ),
                                    incrementIconBuilder: (enabled) => Icon(
                                      Icons.add_rounded,
                                      color: enabled
                                          ? FlutterFlowTheme.of(context).primary
                                          : FlutterFlowTheme.of(context)
                                              .tertiary,
                                      size: 20.0,
                                    ),
                                    countBuilder: (count) => Text(
                                      count.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            fontSize: 24.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    count: _model.countControllerValue ??= 1,
                                    updateCount: (count) => setState(() =>
                                        _model.countControllerValue = count),
                                    stepSize: 1,
                                    minimum: 1,
                                  ),
                                ),
                              ],
                            ).animateOnPageLoad(
                                animationsMap['rowOnPageLoadAnimation']!),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 10.0),
                            child: Text(
                              'Recomendados para ti',
                              style: FlutterFlowTheme.of(context)
                                  .headlineSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          wrapWithModel(
                            model: _model.desechablesModel,
                            updateCallback: () => setState(() {}),
                            child: DesechablesWidget(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    elevation: 3.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 170.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4.0,
                            color: Color(0x320F1113),
                            offset: Offset(
                              0.0,
                              -2.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(0.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 20.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 13.0, 0.0, 0.0),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.dropDownValueController ??=
                                              FormFieldController<String>(null),
                                      options: widget.productos!.variaciones,
                                      onChanged: (val) => setState(
                                          () => _model.dropDownValue = val),
                                      width: 130.0,
                                      height: 40.0,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Poppins',
                                            letterSpacing: 0.0,
                                          ),
                                      hintText: valueOrDefault<String>(
                                        widget.productos?.seleccionaVariable,
                                        'Selecciona una opción',
                                      ),
                                      icon: Icon(
                                        Icons.arrow_drop_down_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      elevation: 2.0,
                                      borderColor:
                                          FlutterFlowTheme.of(context).primary,
                                      borderWidth: 1.0,
                                      borderRadius: 12.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 4.0, 8.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                      isMultiSelect: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 50.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      formatNumber(
                                        functions.subtotalProductos(
                                            _model.countControllerValue!,
                                            widget.productos!.price),
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.automatic,
                                        currency: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Subtotal',
                                      style: FlutterFlowTheme.of(context)
                                          .headlineSmall
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    StreamBuilder<List<CarritoRecord>>(
                                      stream: queryCarritoRecord(
                                        queryBuilder: (carritoRecord) =>
                                            carritoRecord
                                                .where(
                                                  'creator',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'isActive',
                                                  isEqualTo: true,
                                                ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CarritoRecord>
                                            buttonCarritoRecordList =
                                            snapshot.data!;
                                        final buttonCarritoRecord =
                                            buttonCarritoRecordList.isNotEmpty
                                                ? buttonCarritoRecordList.first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            if (loggedIn) {
                                              if (buttonCarritoRecord != null) {
                                                var productoSeleccionadoRecordReference1 =
                                                    ProductoSeleccionadoRecord
                                                        .collection
                                                        .doc();
                                                await productoSeleccionadoRecordReference1
                                                    .set(
                                                        createProductoSeleccionadoRecordData(
                                                  producto: widget
                                                      .productos?.reference,
                                                  name: widget.productos?.name,
                                                  description: widget
                                                      .productos?.description,
                                                  imagen:
                                                      widget.productos?.imagen,
                                                  price:
                                                      widget.productos?.price,
                                                  subTotal:
                                                      valueOrDefault<double>(
                                                    functions.subtotalProductos(
                                                        _model
                                                            .countControllerValue!,
                                                        widget
                                                            .productos!.price),
                                                    0.0,
                                                  ),
                                                  creator: currentUserReference,
                                                  cantidad: _model
                                                      .countControllerValue,
                                                ));
                                                _model.productoCreadoExiste =
                                                    ProductoSeleccionadoRecord
                                                        .getDocumentFromData(
                                                            createProductoSeleccionadoRecordData(
                                                              producto: widget
                                                                  .productos
                                                                  ?.reference,
                                                              name: widget
                                                                  .productos
                                                                  ?.name,
                                                              description: widget
                                                                  .productos
                                                                  ?.description,
                                                              imagen: widget
                                                                  .productos
                                                                  ?.imagen,
                                                              price: widget
                                                                  .productos
                                                                  ?.price,
                                                              subTotal:
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.subtotalProductos(
                                                                    _model
                                                                        .countControllerValue!,
                                                                    widget
                                                                        .productos!
                                                                        .price),
                                                                0.0,
                                                              ),
                                                              creator:
                                                                  currentUserReference,
                                                              cantidad: _model
                                                                  .countControllerValue,
                                                            ),
                                                            productoSeleccionadoRecordReference1);

                                                await buttonCarritoRecord!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'productosCount': FieldValue
                                                          .increment(_model
                                                              .countControllerValue!),
                                                      'amount': FieldValue
                                                          .increment(_model
                                                              .productoCreadoExiste!
                                                              .subTotal),
                                                      'productoSeleccionadoList':
                                                          FieldValue
                                                              .arrayUnion([
                                                        _model
                                                            .productoCreadoExiste
                                                            ?.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                var productoSeleccionadoRecordReference2 =
                                                    ProductoSeleccionadoRecord
                                                        .collection
                                                        .doc();
                                                await productoSeleccionadoRecordReference2
                                                    .set(
                                                        createProductoSeleccionadoRecordData(
                                                  producto: widget
                                                      .productos?.reference,
                                                  name: widget.productos?.name,
                                                  description: widget
                                                      .productos?.description,
                                                  imagen:
                                                      widget.productos?.imagen,
                                                  price:
                                                      widget.productos?.price,
                                                  subTotal:
                                                      valueOrDefault<double>(
                                                    functions.subtotalProductos(
                                                        _model
                                                            .countControllerValue!,
                                                        widget
                                                            .productos!.price),
                                                    0.0,
                                                  ),
                                                  creator: currentUserReference,
                                                  cantidad: _model
                                                      .countControllerValue,
                                                ));
                                                _model.productoCreado =
                                                    ProductoSeleccionadoRecord
                                                        .getDocumentFromData(
                                                            createProductoSeleccionadoRecordData(
                                                              producto: widget
                                                                  .productos
                                                                  ?.reference,
                                                              name: widget
                                                                  .productos
                                                                  ?.name,
                                                              description: widget
                                                                  .productos
                                                                  ?.description,
                                                              imagen: widget
                                                                  .productos
                                                                  ?.imagen,
                                                              price: widget
                                                                  .productos
                                                                  ?.price,
                                                              subTotal:
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.subtotalProductos(
                                                                    _model
                                                                        .countControllerValue!,
                                                                    widget
                                                                        .productos!
                                                                        .price),
                                                                0.0,
                                                              ),
                                                              creator:
                                                                  currentUserReference,
                                                              cantidad: _model
                                                                  .countControllerValue,
                                                            ),
                                                            productoSeleccionadoRecordReference2);

                                                await CarritoRecord.collection
                                                    .doc()
                                                    .set({
                                                  ...createCarritoRecordData(
                                                    creator:
                                                        currentUserReference,
                                                    productosCount: _model
                                                        .countControllerValue,
                                                    isActive: true,
                                                    amount:
                                                        valueOrDefault<double>(
                                                      functions.subtotalProductos(
                                                          _model
                                                              .countControllerValue!,
                                                          widget.productos!
                                                              .price),
                                                      0.0,
                                                    ),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'productoSeleccionadoList':
                                                          [
                                                        _model.productoCreado
                                                            ?.reference
                                                      ],
                                                    },
                                                  ),
                                                });
                                              }

                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    'Añadido al carrito',
                                                    style: GoogleFonts.getFont(
                                                      'Poppins',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondary,
                                                    ),
                                                  ),
                                                  duration: Duration(
                                                      milliseconds: 4000),
                                                  backgroundColor:
                                                      Color(0xFF223136),
                                                ),
                                              );
                                            } else {
                                              context.pushNamed('login');
                                            }

                                            setState(() {});
                                          },
                                          text: loggedIn
                                              ? 'Añadir al carrito'
                                              : 'Iniciar Sesión',
                                          options: FFButtonOptions(
                                            width: 180.0,
                                            height: 35.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        );
                                      },
                                    ),
                                    StreamBuilder<List<CarritoRecord>>(
                                      stream: queryCarritoRecord(
                                        queryBuilder: (carritoRecord) =>
                                            carritoRecord
                                                .where(
                                                  'creator',
                                                  isEqualTo:
                                                      currentUserReference,
                                                )
                                                .where(
                                                  'isActive',
                                                  isEqualTo: true,
                                                ),
                                        singleRecord: true,
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<CarritoRecord>
                                            buttonCarritoRecordList =
                                            snapshot.data!;
                                        final buttonCarritoRecord =
                                            buttonCarritoRecordList.isNotEmpty
                                                ? buttonCarritoRecordList.first
                                                : null;
                                        return FFButtonWidget(
                                          onPressed: () async {
                                            if (loggedIn) {
                                              if (buttonCarritoRecord != null) {
                                                var productoSeleccionadoRecordReference1 =
                                                    ProductoSeleccionadoRecord
                                                        .collection
                                                        .doc();
                                                await productoSeleccionadoRecordReference1
                                                    .set(
                                                        createProductoSeleccionadoRecordData(
                                                  producto: widget
                                                      .productos?.reference,
                                                  name: widget.productos?.name,
                                                  description: widget
                                                      .productos?.description,
                                                  imagen:
                                                      widget.productos?.imagen,
                                                  price:
                                                      widget.productos?.price,
                                                  subTotal:
                                                      valueOrDefault<double>(
                                                    functions.subtotalProductos(
                                                        _model
                                                            .countControllerValue!,
                                                        widget
                                                            .productos!.price),
                                                    0.0,
                                                  ),
                                                  creator: currentUserReference,
                                                  cantidad: _model
                                                      .countControllerValue,
                                                ));
                                                _model.productoCreadoExiste1 =
                                                    ProductoSeleccionadoRecord
                                                        .getDocumentFromData(
                                                            createProductoSeleccionadoRecordData(
                                                              producto: widget
                                                                  .productos
                                                                  ?.reference,
                                                              name: widget
                                                                  .productos
                                                                  ?.name,
                                                              description: widget
                                                                  .productos
                                                                  ?.description,
                                                              imagen: widget
                                                                  .productos
                                                                  ?.imagen,
                                                              price: widget
                                                                  .productos
                                                                  ?.price,
                                                              subTotal:
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.subtotalProductos(
                                                                    _model
                                                                        .countControllerValue!,
                                                                    widget
                                                                        .productos!
                                                                        .price),
                                                                0.0,
                                                              ),
                                                              creator:
                                                                  currentUserReference,
                                                              cantidad: _model
                                                                  .countControllerValue,
                                                            ),
                                                            productoSeleccionadoRecordReference1);

                                                await buttonCarritoRecord!
                                                    .reference
                                                    .update({
                                                  ...mapToFirestore(
                                                    {
                                                      'productosCount': FieldValue
                                                          .increment(_model
                                                              .countControllerValue!),
                                                      'amount': FieldValue
                                                          .increment(_model
                                                              .productoCreadoExiste1!
                                                              .subTotal),
                                                      'productoSeleccionadoList':
                                                          FieldValue
                                                              .arrayUnion([
                                                        _model
                                                            .productoCreadoExiste1
                                                            ?.reference
                                                      ]),
                                                    },
                                                  ),
                                                });
                                              } else {
                                                var productoSeleccionadoRecordReference2 =
                                                    ProductoSeleccionadoRecord
                                                        .collection
                                                        .doc();
                                                await productoSeleccionadoRecordReference2
                                                    .set(
                                                        createProductoSeleccionadoRecordData(
                                                  producto: widget
                                                      .productos?.reference,
                                                  name: widget.productos?.name,
                                                  description: widget
                                                      .productos?.description,
                                                  imagen:
                                                      widget.productos?.imagen,
                                                  price:
                                                      widget.productos?.price,
                                                  subTotal:
                                                      valueOrDefault<double>(
                                                    functions.subtotalProductos(
                                                        _model
                                                            .countControllerValue!,
                                                        widget
                                                            .productos!.price),
                                                    0.0,
                                                  ),
                                                  creator: currentUserReference,
                                                  cantidad: _model
                                                      .countControllerValue,
                                                ));
                                                _model.productoCreado1 =
                                                    ProductoSeleccionadoRecord
                                                        .getDocumentFromData(
                                                            createProductoSeleccionadoRecordData(
                                                              producto: widget
                                                                  .productos
                                                                  ?.reference,
                                                              name: widget
                                                                  .productos
                                                                  ?.name,
                                                              description: widget
                                                                  .productos
                                                                  ?.description,
                                                              imagen: widget
                                                                  .productos
                                                                  ?.imagen,
                                                              price: widget
                                                                  .productos
                                                                  ?.price,
                                                              subTotal:
                                                                  valueOrDefault<
                                                                      double>(
                                                                functions.subtotalProductos(
                                                                    _model
                                                                        .countControllerValue!,
                                                                    widget
                                                                        .productos!
                                                                        .price),
                                                                0.0,
                                                              ),
                                                              creator:
                                                                  currentUserReference,
                                                              cantidad: _model
                                                                  .countControllerValue,
                                                            ),
                                                            productoSeleccionadoRecordReference2);

                                                await CarritoRecord.collection
                                                    .doc()
                                                    .set({
                                                  ...createCarritoRecordData(
                                                    creator:
                                                        currentUserReference,
                                                    productosCount: _model
                                                        .countControllerValue,
                                                    isActive: true,
                                                    amount:
                                                        valueOrDefault<double>(
                                                      functions.subtotalProductos(
                                                          _model
                                                              .countControllerValue!,
                                                          widget.productos!
                                                              .price),
                                                      0.0,
                                                    ),
                                                  ),
                                                  ...mapToFirestore(
                                                    {
                                                      'productoSeleccionadoList':
                                                          [
                                                        _model.productoCreado1
                                                            ?.reference
                                                      ],
                                                    },
                                                  ),
                                                });
                                              }

                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 1000));

                                              context.pushNamed('newCarrito');
                                            } else {
                                              context.pushNamed('login');
                                            }

                                            setState(() {});
                                          },
                                          text: valueOrDefault<String>(
                                            loggedIn
                                                ? 'Comprar Ahora'
                                                : 'Iniciar Sesión',
                                            'Comprar Ahora',
                                          ),
                                          options: FFButtonOptions(
                                            width: 180.0,
                                            height: 35.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    14.0, 0.0, 14.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .titleSmall
                                                .override(
                                                  fontFamily: 'Poppins',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  fontSize: 12.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                          ),
                                        );
                                      },
                                    ),
                                  ].divide(SizedBox(height: 10.0)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ).animateOnPageLoad(
                      animationsMap['containerOnPageLoadAnimation']!),
                ],
              ),
            ));
      },
    );
  }
}
