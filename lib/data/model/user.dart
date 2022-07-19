class User {
  late String pFirstName;
  late String pLastName;
  late int pAge;
  User();

  User.fromJson(Map<String, dynamic> json) {
    pFirstName = json["pFirstName"];
    pLastName = json["pLastName"];
    pAge = json["pAge"];
  }
}
