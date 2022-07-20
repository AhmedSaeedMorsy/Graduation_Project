
// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/doctor_cubit/states.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/data/model/doctor.dart';
import 'package:h_care/data/model/patient-of-doctor.dart';
import 'package:h_care/data/remote/dio.dart';
import 'package:h_care/presentation/modules/doctor_modules/patients/patients.dart';
import 'package:h_care/presentation/modules/settings/settings.dart';

class DoctorCubit extends Cubit<DoctorStates> {
  DoctorCubit() : super(DoctorInitState());

  static DoctorCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomnavItem = const [
    Patients(),
    Settings(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(ChangeBottomNavigationIndex());
  }
///////////////////////////////// Bottom Sheet ///////////////////////////////////////////////////////////////////////////\

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.add;

  void changeBottomSheet({required bool isShow, required IconData icon}) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  ////////////////// Patient of Doctor ////////////////////
  PatientOfDoctor patientOfDoctor = PatientOfDoctor();
  void getPatientOfDoctor({required String id}) {
    emit(DoctorOfPatientLoadingState());
    DioHelper.getData(path: "/api/Department/listyourPatient?doctorId=$id")
        .then((value) {
      patientOfDoctor = PatientOfDoctor.fromJson(value.data);
      emit(DoctorOfPatientSuccessState());
    }).catchError((error) {
      emit(DoctorOfPatientErrorState(error.toString()));
      print(error.toString());
    });
  }

  /////////////////////// Doctor info /////////////////////////
  Doctor doctor = Doctor();
  void getDotorInfo({required String id}) {
    emit(DoctorInfoLoadingState());
    DioHelper.getData(path: "/api/Department/GetDoctorById?id=$id")
        .then((value) {
      doctor = Doctor.fromJson(value.data);
      emit(DoctorInfoSuccessState());
    }).catchError((error) {
      emit(DoctorInfoErrorState(error.toString()));
      print(error.toString());
    });
  }

  ///////////////////// Add Priscription //////////////////////
  void addPriscription({
    required String dateTime,
    required String medicineName,
    required String notes,
    required String patientId,
    required String department,
    context
  }) {
    emit(AddPriscriptionLoadingState());
    DioHelper.postData(
            path:
                "/api/prescription/addPriscription?datetime=$dateTime&medicineName=$medicineName&notes=$notes&patientId=$patientId&department=$department")
        .then((value) {
      emit(AddPriscriptionSuccessState());
      UserCubit.get(context).getAllPrescription(email: patientId);
    }).catchError((error) {
      emit(AddPriscriptionErrorState(error.toString()));
      print(error.toString());
    });
  }
}
