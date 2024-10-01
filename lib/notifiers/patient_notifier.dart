import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/patient.dart';


class PatientNotifier extends ChangeNotifier {
  Patient _patient = Patient(
    name: "Jane Smith",
    location: "456 Health Ave",
    image: "assets/images/patient-placeholder.png",
    age: "30",
    gender: "Female",
    email: "patient@example.com",
    phoneNumber: "123456789",
    password: "password123",
    medicalHistory: "No known allergies",
  );

  void setPatient(Patient patient) {
    _patient = patient;
    notifyListeners();
  }

  void setPatientFromUser(User? user) {
    if (user != null) {
      _patient = Patient(
        name: user.displayName ?? "",
        location: "",
        image: user.photoURL ?? "",
        age: "",
        gender: "",
        email: user.email ?? "",
        phoneNumber: user.phoneNumber ?? "",
        password: "",
        medicalHistory: "",
      );
      notifyListeners();
    }
  }

  Patient getPatient() {
    return _patient;
  }

  // Getters
  String get name => _patient.name;
  String get location => _patient.location;
  String get image => _patient.image;
  String get age => _patient.age;
  String get gender => _patient.gender;
  String get email => _patient.email;
  String get phoneNumber => _patient.phoneNumber;
  String get medicalHistory => _patient.medicalHistory;

  // Setters
  set name(String newName) {
    _patient.name = newName;
    notifyListeners();
  }

  set location(String newLocation) {
    _patient.location = newLocation;
    notifyListeners();
  }

  set image(String newImage) {
    _patient.image = newImage;
    notifyListeners();
  }

  set age(String newAge) {
    _patient.age = newAge;
    notifyListeners();
  }

  set gender(String newGender) {
    _patient.gender = newGender;
    notifyListeners();
  }

  set email(String newEmail) {
    _patient.email = newEmail;
    notifyListeners();
  }

  set phoneNumber(String newPhoneNumber) {
    _patient.phoneNumber = newPhoneNumber;
    notifyListeners();
  }
 

  set medicalHistory(String newMedicalHistory) {
    _patient.medicalHistory = newMedicalHistory;
    notifyListeners();
  }

  // Method to update all patient details
  void updatePatient({
    required String name,
    required String location,
    required String image,
    required String age,
    required String gender,
    required String email,
    required String phoneNumber,
    required String medicalHistory,
  }) {
    _patient.name = name;
    _patient.location = location;
    _patient.image = image;
    _patient.age = age;
    _patient.gender = gender;
    _patient.email = email;
    _patient.phoneNumber = phoneNumber;
    _patient.medicalHistory = medicalHistory;
    notifyListeners();
  }
}