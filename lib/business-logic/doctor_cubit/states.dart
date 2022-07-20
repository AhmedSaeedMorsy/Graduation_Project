abstract class DoctorStates{}

class DoctorInitState extends DoctorStates{}

class ChangeBottomNavigationIndex extends DoctorStates{}

class DoctorOfPatientLoadingState extends DoctorStates {}

class DoctorOfPatientSuccessState extends DoctorStates {}

class DoctorOfPatientErrorState extends DoctorStates {
  final String error;

  DoctorOfPatientErrorState(this.error);
}

class DoctorInfoLoadingState extends DoctorStates {}

class DoctorInfoSuccessState extends DoctorStates {}

class DoctorInfoErrorState extends DoctorStates {
  final String error;

  DoctorInfoErrorState(this.error);
}

class AppChangeBottomSheetState extends DoctorStates{}

class AddPriscriptionLoadingState extends DoctorStates {}

class AddPriscriptionSuccessState extends DoctorStates {}

class AddPriscriptionErrorState extends DoctorStates {
  final String error;

  AddPriscriptionErrorState(this.error);
}