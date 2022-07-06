class IntensiveCareModel{
  IntensiveCareModel();
  List <IntensiveCareDataModel> intensiveCareDataModel =[];
  IntensiveCareModel.fromJson(List json){
    for ( var element in json){
     intensiveCareDataModel.add(IntensiveCareDataModel.fromJson(element));
   }
  }
}

class IntensiveCareDataModel{
  String ? id;
  HospitalData? hospital;

  IntensiveCareDataModel.fromJson(Map <String ,dynamic> json){
    id =json["id"];
    hospital = HospitalData.fromJson(json["hospitals"]);
  }
}






class HospitalData{
  late String id;
  late String name;
  HospitalData.fromJson(Map <String ,dynamic> json){
    id = json["id"];
    name = json["name"];
  }
}