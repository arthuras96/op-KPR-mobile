class User {
  int idperson;
  String name;
  //String password;
  String role;
  String token;

  User(
      {this.idperson,
      this.name,
      //this.password,
      this.role,
      this.token});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        idperson: parsedJson['idperson'],
        name: parsedJson['name'],
        //password: parsedJson['password'],
        role: parsedJson['role'],
        token: parsedJson['token']);
  }
}
