import 'package:hospital_managment_app/models/user.dart';

class Patient extends User {
  Patient({
    required super.name,
    required super.location,
    required super.image, required super.age, required super.gender, required super.email, required super.phoneNumber, required super.password,
  });

  get patientInfo => {'name': name, 'age': age, 'gender': gender};

  String getPatientInformation() {
    return "Full Name: $name \n Age: $age \n Gender: $gender \n";
  }
}
