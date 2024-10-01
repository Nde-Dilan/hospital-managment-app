import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/doctor.dart';
import 'package:logging/logging.dart';


 final _log = Logger('doctor_notifier.dart');


class DoctorNotifier extends ChangeNotifier {
  Doctor _doctor = Doctor(
    name: "Dr. John Doe",
    location: "Yaoundé",
    image: "assets/images/doctor-placeholder-appointment.png",
    age: "40",
    gender: "Male",
    email: "doctor@example.com",
    phoneNumber: "694525931",
    password: "password123",
    speciality: "Cardiologist",
    rating: "4.8",
    experience: "15 years",
    about:
        "Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She achived several awards for her wonderful contribution Read More. . .",
    review: '322',
  );

  void setDoctor(Doctor doctor) {
    _doctor = doctor;
    notifyListeners();
  }
 
  Doctor getDoctor() {
    return _doctor;
  }

  // Getters
  String get name => _doctor.name;
  String get location => _doctor.location;
  String get image => _doctor.image;
  String get age => _doctor.age;
  String get gender => _doctor.gender;
  String get email => _doctor.email;
  String get phoneNumber => _doctor.phoneNumber;
  String get speciality => _doctor.speciality;
  String get rating => _doctor.rating;
  String get reviews => _doctor.review;
  String get experience => _doctor.experience;
  String get about => _doctor.about;

  // Setters
  set name(String newName) {
    _doctor.name = newName;
    notifyListeners();
  }

  set location(String newLocation) {
    _doctor.location = newLocation;
    notifyListeners();
  }

  set image(String newImage) {
    _doctor.image = newImage;
    notifyListeners();
  }

  set age(String newAge) {
    _doctor.age = newAge;
    notifyListeners();
  }

  set gender(String newGender) {
    _doctor.gender = newGender;
    notifyListeners();
  }

  set email(String newEmail) {
    _doctor.email = newEmail;
    notifyListeners();
  }

  set phoneNumber(String newPhoneNumber) {
    _doctor.phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  set speciality(String newSpeciality) {
    _doctor.speciality = newSpeciality;
    notifyListeners();
  }

  set rating(String newRating) {
    _doctor.rating = newRating;
    notifyListeners();
  }

  set review(String newReview) {
    _doctor.review = newReview;
    notifyListeners();
  }

  set experience(String newExperience) {
    _doctor.experience = newExperience;
    notifyListeners();
  }

  set about(String newAbout) {
    _doctor.about = newAbout;
    notifyListeners();
  }

  // Method to update all doctor details
  void updateDoctor({
    required String name,
    required String location,
    required String image,
    required String age,
    required String gender,
    required String email,
    required String phoneNumber,
    required String password,
    required String speciality,
    required String rating,
    required String experience,
    required String about,
  }) {
    _doctor.name = name;
    _doctor.location = location;
    _doctor.image = image;
    _doctor.age = age;
    _doctor.gender = gender;
    _doctor.email = email;
    _doctor.phoneNumber = phoneNumber;
    _doctor.password = password;
    _doctor.speciality = speciality;
    _doctor.rating = rating;
    _doctor.experience = experience;
    _doctor.about = about;
    notifyListeners();
  }
}
