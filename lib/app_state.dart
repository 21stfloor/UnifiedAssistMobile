import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      _muted = prefs.getBool('ff_muted') ?? _muted;
    });
    _safeInit(() {
      _doneGettingStarted =
          prefs.getBool('ff_doneGettingStarted') ?? _doneGettingStarted;
    });
    _safeInit(() {
      _doneGettingStarted2 =
          prefs.getBool('ff_doneGettingStarted2') ?? _doneGettingStarted2;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  bool _muted = false;
  bool get muted => _muted;
  set muted(bool value) {
    _muted = value;
    prefs.setBool('ff_muted', value);
  }

  bool _doneGettingStarted = false;
  bool get doneGettingStarted => _doneGettingStarted;
  set doneGettingStarted(bool value) {
    _doneGettingStarted = value;
    prefs.setBool('ff_doneGettingStarted', value);
  }

  bool _doneGettingStarted2 = false;
  bool get doneGettingStarted2 => _doneGettingStarted2;
  set doneGettingStarted2(bool value) {
    _doneGettingStarted2 = value;
    prefs.setBool('ff_doneGettingStarted2', value);
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
