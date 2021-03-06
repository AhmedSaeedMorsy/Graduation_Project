abstract class UserStates {}

class UserInitState extends UserStates {}

class ChangeBottomNavigationIndex extends UserStates {}

class AppChangeBottomSheetState extends UserStates {}

class DepartmentLoadingState extends UserStates {}

class DepartmentSuccessState extends UserStates {}

class DepartmentErrorState extends UserStates {
  final String error;

  DepartmentErrorState(this.error);
}

class DoctorsInDepartmentLoadingState extends UserStates {}

class DoctorsInDepartmentSuccessState extends UserStates {}

class DoctorsInDepartmentErrorState extends UserStates {
  final String error;

  DoctorsInDepartmentErrorState(this.error);
}

class GetDoctorByIdLoadingState extends UserStates {}

class GetDoctorByIdSuccessState extends UserStates {}

class GetDoctorByIdErrorState extends UserStates {
  final String error;

  GetDoctorByIdErrorState(this.error);
}

class HospitalLoadingState extends UserStates {}

class HospitalSuccessState extends UserStates {}

class HospitalErrorState extends UserStates {
  final String error;

  HospitalErrorState(this.error);
}

class IntenseveCareLoadingState extends UserStates {}

class IntenseveCareSuccessState extends UserStates {}

class IntenseveCareErrorState extends UserStates {
  final String error;

  IntenseveCareErrorState(this.error);
}

class DepartmentInHospitalLoadingState extends UserStates {}

class DepartmentInHospitalSuccessState extends UserStates {}

class DepartmentInHospitalErrorState extends UserStates {
  final String error;

  DepartmentInHospitalErrorState(this.error);
}

class MedicineLoadingState extends UserStates {}

class MedicineSuccessState extends UserStates {}

class MedicineErrorState extends UserStates {
  final String error;

  MedicineErrorState(this.error);
}

class GetLoadingState extends UserStates {}

class GetSuccessState extends UserStates {}

class GetErrorState extends UserStates {
  final String error;

  GetErrorState(this.error);
}

class AddMedicineLoadingState extends UserStates {}

class AddMedicineSuccessState extends UserStates {}

class AddMedicineErrorState extends UserStates {
  final String error;

  AddMedicineErrorState(this.error);
}

class GetPrescriptionLoadingState extends UserStates {}

class GetPrescriptionSuccessState extends UserStates {}

class GetPrescriptionErrorState extends UserStates {
  final String error;

  GetPrescriptionErrorState(this.error);
}

class GetPrescriptionByIdLoadingState extends UserStates {}

class GetPrescriptionByIdSuccessState extends UserStates {}

class GetPrescriptionByIdErrorState extends UserStates {
  final String error;

  GetPrescriptionByIdErrorState(this.error);
}

class BookingDoctorLoadingState extends UserStates {}

class BookingDoctorSuccessState extends UserStates {}

class BookingDoctorErrorState extends UserStates {
  final String error;

  BookingDoctorErrorState(this.error);
}

class UserInfoLoadingState extends UserStates {}

class UserInfoSuccessState extends UserStates {}

class UserInfoErrorState extends UserStates {
  final String error;

  UserInfoErrorState(this.error);
}

class DoctorOfPatientLoadingState extends UserStates {}

class DoctorOfPatientSuccessState extends UserStates {}

class DoctorOfPatientErrorState extends UserStates {
  final String error;

  DoctorOfPatientErrorState(this.error);
}