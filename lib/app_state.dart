import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _AgeVerification =
          prefs.getBool('ff_AgeVerification') ?? _AgeVerification;
    });
    _safeInit(() {
      _installPWAadvice =
          prefs.getBool('ff_installPWAadvice') ?? _installPWAadvice;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _AgeVerification = false;
  bool get AgeVerification => _AgeVerification;
  set AgeVerification(bool value) {
    _AgeVerification = value;
    prefs.setBool('ff_AgeVerification', value);
  }

  bool _buscando = false;
  bool get buscando => _buscando;
  set buscando(bool value) {
    _buscando = value;
  }

  bool _installPWAadvice = true;
  bool get installPWAadvice => _installPWAadvice;
  set installPWAadvice(bool value) {
    _installPWAadvice = value;
    prefs.setBool('ff_installPWAadvice', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
