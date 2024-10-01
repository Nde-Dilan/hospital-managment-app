import 'package:flutter/material.dart';

class IsDoctorNotifier extends ChangeNotifier {
  bool _isDoctor = false; // Initial state

  bool get isDoctor => _isDoctor;

  void setIsDoctor(bool isDoctor) {
    _isDoctor = isDoctor;
    notifyListeners();
  }
}
