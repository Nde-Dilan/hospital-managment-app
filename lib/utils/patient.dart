class Patient {
  final String name;
  final String age;
  final String gender;

  Patient({
    required this.name,
    required this.age,
    required this.gender,
  });

  get patientInfo => {'name': name, 'age': age, 'gender': gender};

  String getPatientInformation() {
    return "Full Name: $name \n Age: $age \n Gender: $gender \n";
  }
}
