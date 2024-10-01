import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/doctor.dart';
import 'package:hospital_managment_app/models/patient.dart';
import 'package:hospital_managment_app/models/user.dart' as user;
import 'package:logging/logging.dart';

class UserNotifier extends ChangeNotifier {
  user.User _user = user.User(
    age: "25",
    gender: "Male",
    email: "example@example.com",
    phoneNumber: "1234567890",
    password: "password123",
    name: "Nde Dilan",
    location: "Nyom II",
    image: "assets/images/doctor-placeholder-appointment.png",
    role: 'PATIENT',
  );

  final Logger _log = Logger('user_notifier.dart');

  //Take a doctor in and return a user to be use in the app
  void createUserFromFirebase(User? firebaseUser, bool isDoctor) {
    if (firebaseUser != null) {
      user.User appUser = user.User(
        name: firebaseUser.displayName ?? "",
        location: "", //check the firebase user
        image: firebaseUser.photoURL ?? "",
        age: "",
        gender: "",
        email: firebaseUser.email ?? "",
        phoneNumber: firebaseUser.phoneNumber ?? "",
        role: isDoctor ? 'DOCTOR' : 'PATIENT',
      );
      _log.info("User details updated from user: ${appUser.name}");
      setUser(appUser);
      notifyListeners();
    }
  }

  // Setters
  set name(String newName) {
    _user.name = newName;
    notifyListeners();
  }

  set image(String newImage) {
    _user.image = newImage;
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

  void setUser(user.User user) {
    _user = user;
    notifyListeners();
  }

  user.User getUser() {
    return _user;
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
