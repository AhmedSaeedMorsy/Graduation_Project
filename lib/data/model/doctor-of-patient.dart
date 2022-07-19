class DoctorsOfPatient {
  List<DoctorsOfPatientModel> doctorsOfPatientModel = [];
  DoctorsOfPatient();
  DoctorsOfPatient.fromJson(List json){
    for(var element in json){
      doctorsOfPatientModel.add(DoctorsOfPatientModel.fromJson(element));
    }
  }

}

class DoctorsOfPatientModel {
  late DoctorModel doctorModel;
  DoctorsOfPatientModel.fromJson(Map<String, dynamic> json) {

    doctorModel = DoctorModel.fromJson(json["doctor"]);
  }
}

class DoctorModel {
  late String id;
  late String name;
  late String dLastName;
  late String dPhone;
  late String imagePath;
  late String day;
  DoctorModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    dLastName = json["dLastName"];
    dPhone = json["dPhone"];
    imagePath = json["imagePath"];
    day = json["day"];
  }
}
