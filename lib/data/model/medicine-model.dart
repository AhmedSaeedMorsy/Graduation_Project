import 'package:flutter/cupertino.dart';

class Medicine {
  List<MedicineModel> medicineModel = [];
  Medicine();
  Medicine.fromJson(List json) {
    for (var element in json) {
      medicineModel.add(MedicineModel.fromJson(element));
    }
  }
}

class MedicineModel {
  late int medicineId;
  late String medicineName;
  late String exprDate;
  late String phone;
  late String quantity;
  late String patientId;
  MedicineModel.fromJson(Map<String, dynamic> json) {
    medicineId = json["medicineId"];
    medicineName = json["medicineName"];
    exprDate = json["exprDate"];
    phone = json["phone"];
    quantity = json["quantity"];
    patientId = json["patientid"];
  }
}
