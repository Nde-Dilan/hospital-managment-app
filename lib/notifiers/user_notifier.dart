import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/user.dart';

class UserNotifier extends ChangeNotifier {
  User _user = User(
    age: "25",
    gender: "Male",
    email: "example@example.com",
    phoneNumber: "1234567890",
    password: "password123",
    name: "John Doe",
    location: "New York",
    image: "assets/images/doctor-placeholder-appointment.png",
  );

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  User getUser() {
    return _user;
  }

  // Getters
  String get name => _user.name;
  String get password => _user.password;
  String get phoneNumber => _user.phoneNumber;
  String get email => _user.email;

  // Setters
  set name(String newName) {
    _user.name = newName;
    notifyListeners();
  }

  set password(String newPassword) {
    _user.password = newPassword;
    notifyListeners();
  }

  set phoneNumber(String newPhoneNumber) {
    _user.phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  set email(String newEmail) {
    _user.email = newEmail;
    notifyListeners();
  }

  // Method to update all user details
  void updateUser(
      {required String name,
      required String password,
      required String phoneNumber,
      required String email}) {
    _user.name = name;
    _user.password = password;
    _user.phoneNumber = phoneNumber;
    _user.email = email;
    notifyListeners();
  }
}
