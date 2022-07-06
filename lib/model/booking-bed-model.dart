class BookingBed{
  late String msg;
  BookingBed();
  BookingBed.fromJson(json){
    msg = json;
  }
}