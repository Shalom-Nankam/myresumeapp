import 'package:flutter/material.dart';

class LanguageProvider with ChangeNotifier {
  bool _isFrench = false;

  bool get isFrench => _isFrench;

  void setFrench(bool value) {
    if (value) {
      _isFrench = true;
    }
    notifyListeners();
  }
}
