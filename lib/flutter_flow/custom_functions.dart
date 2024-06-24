import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

double? subtotalProductos(
  int qty,
  double precio,
) {
  return qty * precio;
}

double precioEnvio(double amount) {
  double precioEnvio = 0;
  if (amount <= 149990) {
    precioEnvio = 12000;
  }
  return precioEnvio;
}

double totalCompra(
  double amount,
  double precioEnvio,
) {
  return amount + precioEnvio;
}

String? ultimos4Digitos(String? tarjeta) {
  // Devolver últimos 4 dígitos
  if (tarjeta != null && tarjeta.length >= 4) {
    return tarjeta.substring(tarjeta.length - 4);
  } else {
    return null;
  }
}

String textoEnvioGratis(
  double amount,
  double cuantofaltaenvio,
  String textoenvio,
) {
  double cuantofaltaenvio = 150000 - amount;
  String textoenvio;
  if (cuantofaltaenvio > 0) {
    textoenvio = "¡Te faltan $cuantofaltaenvio para tu envío gratis!";
  } else {
    textoenvio = '¡Ahora tienes envío gratis!';
  }
  return textoenvio;
}

String? detectarTarjeta(String? numeroTarjeta) {
  // Eliminar cualquier carácter que no sea un número
  final cleanNumeroTarjeta = numeroTarjeta?.replaceAll(RegExp(r"\D"), "");

  // Definir patrones para cada tipo de tarjeta
  final patrones = {
    "visa": "^4[0-9]{12}(?:[0-9]{3})?\$",
    "master":
        "^(5[1-5][0-9]{14}|2(?:2(?:2[1-9]|2[2-9]|[3-9][0-9])|7(?:[0-1][0-9]|20)))[0-9]{10}\$",
    "amex": "^3[47][0-9]{13}\$",
    // Añade más patrones para otros tipos de tarjetas si es necesario
  };

  // Comprobar cada patrón y devolver el tipo de tarjeta si se encuentra una coincidencia
  for (final tipo in patrones.keys) {
    if (RegExp(patrones[tipo]!).hasMatch(cleanNumeroTarjeta!)) {
      return tipo;
    }
  }

// Si no se encuentra un tipo de tarjeta válido, se devuelve "Desconocido"
  return "Desconocido";
}

bool? decide(DateTime dob) {
  DateTime todayDate = DateTime.now();
  int age = todayDate.year - dob.year;
  if (age >= 18) {
    return true;
  } else {
    return false;
  }
}
