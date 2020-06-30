class User {
  final String email;
  final String password;

  User({this.email, this.password});

  get getEmail => email;
  get getPassword => password;

  Map<String, dynamic> getMap(){
    Map<String, dynamic> userMap = {"email": email, "password": password};
    return userMap;
  }
  
}