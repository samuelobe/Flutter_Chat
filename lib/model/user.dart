class User {
  final String email;
  final String password;

  User({this.email, this.password});

  Map<String, dynamic> getMap(){
    Map<String, dynamic> userMap = {"email": email, "password": password};
    return userMap;
  }
  
}