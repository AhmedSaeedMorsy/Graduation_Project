class IntensiveCareModel {
  IntensiveCareModel();
  List<IntensiveCareDataModel> intensiveCareDataModel = [];
  IntensiveCareModel.fromJson(List json) {
    for (var element in json) {
      intensiveCareDataModel.add(IntensiveCareDataModel.fromJson(element));
    }
  }
}

class IntensiveCareDataModel {
  String? id;
  HospitalData? hospital;
  String? bedfloor;
  int? bednumber;

  IntensiveCareDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    hospital = HospitalData.fromJson(json["hospitals"]);
    bednumber = json["bednumber"];
    bedfloor = json["bedfloor"];

  }
}

class HospitalData {
  late String id;
  late String name;
  late String address;
  HospitalData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];

  }
}
