import 'package:hospital_managment_app/models/user.dart';

class Patient extends User {
   String medicalHistory;
  final List<Map<String, String>> appointmentsDate = [
    {"date": "12", "time": "10:00 AM", "day": "Mon"},
    {"date": "14", "time": "11:00 AM", "day": "Tue"},
    {"date": "15", "time": "12:00 AM", "day": "Thu"},
    {"date": "16", "time": "13:00 AM", "day": "Wed"},
  ];

  final List<String> currentAppointments = ["Dental surgery ","General Dentist","Aesthetic Surgery"];

  Patient({
    this.medicalHistory = '',
    required super.name,
    required super.location,
    required super.image,
    required super.age,
    required super.gender,
    required super.email,
    required super.phoneNumber,
    required super.password,   super.role="PATIENT",
  });

  String getPatientInformation() {
    return "Full Name: $name \n Age: $age \n Gender: $gender \n";
  }
}
