class User {
  final String email;
  final String password;
  final String phoneNumber;
  final String firstName;
  final String lastName;

  User(
      {this.email,
      this.password,
      this.phoneNumber,
      this.firstName,
      this.lastName});

  get getEmail => email;
  get getPassword => password;

  Map<String, dynamic> getMap() {
    Map<String, dynamic> userMap = {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
    };
    return userMap;
  }
}
