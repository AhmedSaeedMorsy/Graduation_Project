class UserRigesterModel {
  String ? message ;
  late bool isAuthenticated;
  String ?username;
  String? email;
  List<String>? role;
  String? token;

  UserRigesterModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isAuthenticated = json['isAuthenticated'];
    username = json['username'];
    email = json['email'];
    role = json['role'].cast<String>();
    token = json['token'];
  }
}
