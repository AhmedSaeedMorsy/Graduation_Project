class DoctorsInDepart {
  DoctorsInDepart();
  List<DoctorDataModel> doctorInDepartmentData = [];
  DoctorsInDepart.fromJson(List json) {
    for (var element in json) {
      doctorInDepartmentData.add(DoctorDataModel.fromJson(element));
    }
  }
}

class DoctorDataModel {
  late String id;
  late String name;
  late String dLastName;
  late String dPhone;
  late String day;
  late String time;
  late HospitalDataModel hospital;
  late String imagePath;
  DoctorDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    dLastName = json["dLastName"];
    dPhone = json["dPhone"];
    imagePath = json["imagePath"];
    day = json["day"];
    time = json["time"];

    hospital = HospitalDataModel.fromJson(json["hospitals"]);
  }
}

class HospitalDataModel {
  late String id;
  late String name;
  HospitalDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
