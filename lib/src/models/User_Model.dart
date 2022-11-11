// ignore_for_file: non_constant_identifier_names, file_names

class UserModel {
  String name;
  String email;
  String phonenumber;
  String CPF;
  String Password;

  UserModel({
    required this.CPF,
    required this.Password,
    required this.phonenumber,
    required this.email,
    required this.name,
  });
}
