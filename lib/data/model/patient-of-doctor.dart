class PatientOfDoctor {
  List<PatientOfDoctorModel> patientOfDoctorModel = [];
  PatientOfDoctor();
  PatientOfDoctor.fromJson(List json) {
    for (var element in json) {
      patientOfDoctorModel.add(PatientOfDoctorModel.fromJson(element));
    }
  }
}

class PatientOfDoctorModel {
  late Patient patient;
  late String patientid;
  PatientOfDoctorModel.fromJson(Map<String, dynamic> json) {
    patientid = json["patientid"];
    patient = Patient.fromJson(json["patient"]);
  }
}

class Patient {
  late String pFirstName;
  late String pLastName;
  late int pAge;
  Patient.fromJson(Map<String, dynamic> json) {
    pFirstName = json["pFirstName"];
    pLastName = json["pLastName"];
    pAge = json["pAge"];
  }
}
