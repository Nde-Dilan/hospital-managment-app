class User {
  String name;
  String age;
  String role;
  String gender;
  String email;
  String? password;
  String phoneNumber;
  String location;
  String image;

  User({
    required this.age,
    required this.role,
    required this.gender,
    required this.email,
    required this.phoneNumber,
      this.password,
    required this.name,
    required this.location,
    required this.image,
  });

}

