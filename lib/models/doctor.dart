import 'package:hospital_managment_app/models/user.dart';

class Doctor extends User {
  String speciality;

  String rating;
  String review;
  String experience;
  String about;

  Doctor( {
    required this.speciality,
    required this.rating,
    required this.review,
    required this.experience,
    required this.about, required super.name, required super.location, required super.image, required super.age, required super.gender, required super.email, required super.phoneNumber, required super.password,super.role="DOCTOR"
  });

}