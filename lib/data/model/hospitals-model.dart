class HospitalModel{
  List<HospitalDataModel> hospitalDataModel=[];
  
  HospitalModel();
  HospitalModel.fromJson(List json){
   for ( var element in json){
     hospitalDataModel.add(HospitalDataModel.fromJson(element));
   }
  } 
} 

class HospitalDataModel{
  late String id;
  late String name;
  late String image;
  late String address;

  HospitalDataModel.fromJson(Map<String ,dynamic>json){
    id = json["id"];
    name = json["name"];
    image = json["image"];
    address = json["address"];

  }
}