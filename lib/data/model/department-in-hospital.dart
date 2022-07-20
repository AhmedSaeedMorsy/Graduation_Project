// ignore_for_file: file_names

class DepartmentInHospitalModel{
  List deptDataModel = [] ; 
  DepartmentInHospitalModel();
  DepartmentInHospitalModel.fromJson(List json){
    for(var element in json){
      deptDataModel.add(DeptDataModel.fromJson(element));
    }
  }
}




class DeptDataModel{
  late int id;
  late String  name;  
  HospitalData ? hospitals;
  late String image;

  DeptDataModel.fromJson(Map <String,dynamic> json){
    id = json["id"];
    name =json["name"];
    image = json["image"];
    hospitals = HospitalData.fromJson(json["hospitals"]);
  }
}


class HospitalData{
  String ? id;
  String? name;

  HospitalData.fromJson(Map<String , dynamic> json){
    id = json["id"];
    name = json["name"];
  }
}