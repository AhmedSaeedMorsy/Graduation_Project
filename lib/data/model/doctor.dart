class Doctor {
  late String name;
  late String dLastName;
  late String dPhone;
  String? imagePath;
  late int dAge;
  late String day;
  late String time;
  late Department department;

  Doctor();

  Doctor.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    dLastName = json["dLastName"];
    dPhone = json["dPhone"];
    imagePath = json["imagePath"];
    dAge = json["dAge"];
    day = json["day"];
    time = json["time"];
    department = Department.fromJson(json["department"]);
  }
}

class Department {
  late String name;
  Department.fromJson(Map<String, dynamic> json) {
    name = json["name"];
  }
}
