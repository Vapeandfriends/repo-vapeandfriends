import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    if (mounted) {
      setState(() => _loading = true);
    }
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        context.pushNamed(
          initialPageName,
          pathParameters: parameterData.pathParameters,
          extra: parameterData.extra,
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      if (mounted) {
        setState(() => _loading = false);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Center(
            child: Image.asset(
              'assets/images/LOGO-IOS-V&F.png',
              width: 250.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'InicioBanner': ParameterData.none(),
  'Contacto': ParameterData.none(),
  'crearCuenta': ParameterData.none(),
  'ProductDetail': (data) async => ParameterData(
        allParams: {
          'productos': await getDocumentParameter<ProductosRecord>(
              data, 'productos', ProductosRecord.fromSnapshot),
        },
      ),
  'Home': ParameterData.none(),
  'RecuContra': (data) async => ParameterData(
        allParams: {
          'userProfile': await getDocumentParameter<UsersRecord>(
              data, 'userProfile', UsersRecord.fromSnapshot),
        },
      ),
  'login': ParameterData.none(),
  'Categorias': ParameterData.none(),
  'DireccionEnvio': (data) async => ParameterData(
        allParams: {
          'userProfile': await getDocumentParameter<UsersRecord>(
              data, 'userProfile', UsersRecord.fromSnapshot),
        },
      ),
  'Usuario': ParameterData.none(),
  'AccesoriosCat': ParameterData.none(),
  'Buscador': ParameterData.none(),
  'pagarAhora': (data) async => ParameterData(
        allParams: {
          'orden': await getDocumentParameter<OrderRecord>(
              data, 'orden', OrderRecord.fromSnapshot),
          'monto': getParameter<double>(data, 'monto'),
        },
      ),
  'ConfirmacionDePago': (data) async => ParameterData(
        allParams: {
          'ultimosDigitos': getParameter<String>(data, 'ultimosDigitos'),
          'monto': getParameter<double>(data, 'monto'),
        },
      ),
  'VerificacionEdad': ParameterData.none(),
  'blogDetail': (data) async => ParameterData(
        allParams: {
          'articulos': await getDocumentParameter<NewsRecord>(
              data, 'articulos', NewsRecord.fromSnapshot),
        },
      ),
  'BateriasCat': ParameterData.none(),
  'CargadoresCat': ParameterData.none(),
  'DesechablesCat': ParameterData.none(),
  'EquiposCat': ParameterData.none(),
  'HerbalesCat': ParameterData.none(),
  'LiquidosCat': ParameterData.none(),
  'ResistenciasCat': ParameterData.none(),
  'TanquesCat': ParameterData.none(),
  'preguntasFrecuentes': ParameterData.none(),
  'popupIOS': ParameterData.none(),
  'popupANDROID': ParameterData.none(),
  'newCarrito': ParameterData.none(),
  'Blog': ParameterData.none(),
  'PromocionesCat': ParameterData.none(),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
