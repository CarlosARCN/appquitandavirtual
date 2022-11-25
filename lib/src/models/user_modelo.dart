class UserModel {
  String? name;
  String? email;
  String? phonenumber;
  String? cpf;
  String? password;
  String? id;
  String? token;

  UserModel({
    this.name,
    this.email,
    this.phonenumber,
    this.cpf,
    this.password,
    this.id,
    this.token,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'],
      email: map['email'],
      id: map['id'],
      name: map['fullname'],
      password: map['password'],
      phonenumber: map['phone'],
      token: map['token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cpf': cpf,
      'email': email,
      'id': id,
      'fullname': name,
      'password': password,
      'phone': phonenumber,
      'token': token,
    };
  }

  @override
  String toString() {
    return 'name: $name | cpf: $cpf';
  }
}
