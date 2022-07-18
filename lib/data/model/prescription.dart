class Prescription {
  List<PrescriptionModel> prescriptionModel = [];
  Prescription();
  Prescription.fromJson(List json){
    for(var element in json){
      prescriptionModel.add(PrescriptionModel.fromJson(element));
    }
  }
}

class PrescriptionModel {
  late int id;
  late String medicineName;
  late String dateTime;
  late String department;
  late String notes;

  PrescriptionModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    medicineName = json["medicineName"];
    dateTime = json["dateTime"];
    notes = json["notes"];
    department = json["department"];
  }
}
