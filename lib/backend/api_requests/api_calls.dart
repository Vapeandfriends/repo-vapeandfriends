import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ObtenerTokenCardCall {
  static Future<ApiCallResponse> call({
    String? publicKey = 'APP_USR-9daaf41b-ab06-41e8-9e4f-2eefb9f1c4e1',
    String? accessToken =
        'APP_USR-8495367464922625-051517-5043363137d563ca566e0274241f466c-387197033',
    int? cardNumber,
    String? cardholderName = '',
    String? identificationType = '',
    int? identificationNumber,
    int? securityCode,
    int? cardExpirationMonth,
    int? cardExpirationYear,
  }) async {
    final ffApiRequestBody = '''
{
  "card_number": "${cardNumber}",
  "cardholder": {
    "name": "${cardholderName}",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    }
  },
  "security_code": "${securityCode}",
  "expiration_month": "${cardExpirationMonth}",
  "expiration_year": "${cardExpirationYear}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener Token Card',
      apiUrl:
          'https://api.mercadopago.com/v1/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? tokenTarjeta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? ultimosDigitos(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.last_four_digits''',
      ));
}

class CreaPagoTarjetaCall {
  static Future<ApiCallResponse> call({
    String? accessToken =
        'APP_USR-8495367464922625-051517-5043363137d563ca566e0274241f466c-387197033',
    double? transactionAmount,
    String? tokenTarjeta = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? identificationType = '',
    String? identificationNumber = '',
    String? city = '',
    String? description = '',
    String? paymentMethod = '',
  }) async {
    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${tokenTarjeta}",
  "installments": 1,
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    },
    "address": {
      "city": "${city}"
    }
  },
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Crea Pago Tarjeta',
      apiUrl: 'https://api.mercadopago.com/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static int? iDpago(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  static String? fechaCreacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.date_created''',
      ));
  static String? fechaAprobacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.date_last_updated''',
      ));
  static String? tipoOperacion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.operation_type''',
      ));
  static String? tipoTarjeta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.payment_method_id''',
      ));
  static String? tipoPago(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_type_id''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  static String? moneda(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency_id''',
      ));
  static dynamic? identificacion(dynamic response) => getJsonField(
        response,
        r'''$.payer.identification''',
      );
  static int? numeroIdentificacion(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.collector_id''',
      ));
  static dynamic? numeroCliente(dynamic response) => getJsonField(
        response,
        r'''$.payer.phone''',
      );
  static int? montoTransaccion(dynamic response) =>
      castToType<int>(getJsonField(
        response,
        r'''$.transaction_amount''',
      ));
  static String? ultimosDigitosTarjeta(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.card.last_four_digits''',
      ));
  static dynamic? documentCardHolder(dynamic response) => getJsonField(
        response,
        r'''$.card.cardholder.identification''',
      );
  static String? descripcion(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.description''',
      ));
}

class ObtenerDatosPagoCall {
  static Future<ApiCallResponse> call({
    String? id = '',
    String? accessToken = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener Datos Pago',
      apiUrl: 'https://api.mercadopago.com/v1/payments/${id}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${accessToken}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
