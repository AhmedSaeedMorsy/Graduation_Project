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

  DeptDataModel.fromJson(Map <String,dynamic> json){
    id = json["id"];
    name =json["name"];
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