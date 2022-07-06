
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/model/booking-bed-model.dart';
import 'package:h_care/model/department-in-hospital.dart';
import 'package:h_care/model/department-model.dart';
import 'package:h_care/model/doctors-indepartment-model.dart';
import 'package:h_care/model/hospitals-model.dart';
import 'package:h_care/model/intensive-care-model.dart';

import 'package:h_care/modules/settings/settings.dart';
import 'package:h_care/modules/user_modules/home/home.dart';
import 'package:h_care/modules/user_modules/medical_history/medical_history.dart';
import 'package:h_care/modules/user_modules/pharmacy/pharmacy.dart';
import 'package:h_care/modules/user_modules/specialties/specialties.dart';
import 'package:h_care/shared/end-points.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';
import 'package:h_care/shared/network/remote/dio.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitState());
///////////////////////////////////////////////////////////////// Method to call Cubit ///////////////////////////////////////////
  static UserCubit get(context) => BlocProvider.of(context);

  ///////////////////////////////////////////////////////////////////bottom navigation bar //////////////////////////////////////////////////////////
  int currentIndex = 0;
  List<Widget> bottomnavItem = const [
    Home(),
    Specialties(),
    Pharmacy(),
    MedicalHistory(),
    Settings(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }

//////////////////////////////////////////////////////////////////All Department ////////////////////////////////////////////////////////
  DepartmentModel departmentModel = DepartmentModel();
  void getDepartmentModel() {
    emit(DepartmentLoadingState());
    DioHelper.getData(
      path: allDepartment,
    ).then((value) {
      departmentModel = DepartmentModel.fromJson(value.data);
      print(departmentModel.departmentData.length);
      print(departmentModel.departmentData[1].name);

      emit(DepartmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DepartmentErrorState(error.toString()));
    });
  }

//////////////////////////////////////////////////////////////// Doctors In Department ////////////////////////////////////////////////
  DoctorsInDepart doctorsInDepart = DoctorsInDepart();

  void getDoctorsInDepart({required int id}) {
    emit(DoctorsInDepartmentLoadingState());

    DioHelper.getData(path: "/api/Department/getalldoctorindepartment?id=$id")
        .then((value) {
      doctorsInDepart = DoctorsInDepart.fromJson(value.data);
      print(doctorsInDepart.doctorInDepartmentData.length);
      emit(DoctorsInDepartmentSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DoctorsInDepartmentErrorState(error.toString()));
    });
  }

/////////////////////////////////////////////////////////////// All Hospital/////////////////////////////////////////////
  HospitalModel hospitalModel = HospitalModel();
  void getHospital() {
    emit(HospitalLoadingState());
    DioHelper.getData(
      path: hospital,
    ).then((value) {
      hospitalModel = HospitalModel.fromJson(value.data);
      print(hospitalModel.hospitalDataModel.length);
      emit(HospitalSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HospitalErrorState(error.toString()));
    });
  }

/////////////////////////////////////////////////////////////// All Bed In Intenseve care //////////////////////////////////////////////
  IntensiveCareModel intensiveCareModel = IntensiveCareModel();

  void getBed() {
    emit(IntenseveCareLoadingState());
    DioHelper.getData(
      path: bed,
    ).then((value) {
      intensiveCareModel = IntensiveCareModel.fromJson(value.data);
    }).catchError((error) {
      print(error.toString());
      emit(IntenseveCareErrorState(error.toString()));
    });
  }

////////////////////////////////////////////////////// Booking bed/////////////////////////////////////////
  BookingBed? bookingBedModel;

  void bookingIntensiveCare({
    required patientId,
    required bedId,
  }) {
    intensiveCareModel.intensiveCareDataModel = [];
    emit(BookingBedLoadingState());
    DioHelper.postData(
      path: "/api/Department/bookingbed?patientid=$patientId&bedid=$bedId",
    ).then((value) {
      bookingBedModel = BookingBed.fromJson(value.data);
       getBed();
      emit(BookingBedSuccessState());
     
    }).catchError((error) {
      print(error.toString());
      emit(BookingBedErrorState(error.toString()));
    });
  }

////////////////////////////////////////////Department In Hospital/////////////////////////////////////////////

  DepartmentInHospitalModel departmentInHospitalModel =
      DepartmentInHospitalModel();

  void getDeptInHospital(id) {
    emit(DepartmentInHospitalLoadingState());
    DioHelper.getData(
      path: "/api/Department/departinhospital?id=$id",
    ).then((value) {
      departmentInHospitalModel =
          DepartmentInHospitalModel.fromJson(value.data);
      print(departmentInHospitalModel.deptDataModel.length);
      emit(DepartmentInHospitalSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(DepartmentInHospitalErrorState(error.toString()));
    });
  }
}
