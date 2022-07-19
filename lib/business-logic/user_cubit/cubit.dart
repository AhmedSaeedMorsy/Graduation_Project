import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/end-points.dart';
import 'package:h_care/data/model/department-in-hospital.dart';
import 'package:h_care/data/model/department-model.dart';
import 'package:h_care/data/model/doctors-in-department-model.dart';
import 'package:h_care/data/model/hospitals-model.dart';
import 'package:h_care/data/model/intensive-care-model.dart';
import 'package:h_care/data/model/medicine-model.dart';
import 'package:h_care/data/model/prescription.dart';
import 'package:h_care/data/remote/dio.dart';
import 'package:h_care/presentation/modules/settings/settings.dart';
import 'package:h_care/presentation/modules/user_modules/home/home.dart';
import 'package:h_care/presentation/modules/user_modules/medical_history/medical_history.dart';
import 'package:h_care/presentation/modules/user_modules/pharmacy/pharmacy.dart';
import 'package:h_care/presentation/modules/user_modules/specialties/specialties.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitState());
///////////////////////////////////////////////////////////////// Method to call Cubit ///////////////////////////////////////////
  static UserCubit get(context) => BlocProvider.of(context);

  ///////////////////////////////////////////////////////////////////bottom navigation bar //////////////////////////////////////////////////////////
  int currentIndex = 0;
  List<Widget> bottomnavItem = [
    const Home(),
    const Specialties(),
    PharmacyScreen(),
    const MedicalHistory(),
    const Settings(),
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
  ///////////////////////////////////////// Pharmacy ///////////////////////////////////////////////////

  Medicine medicineModel = Medicine();
  void getMedicine() {
    emit(MedicineLoadingState());
    DioHelper.getData(
      path: medicine,
    ).then((value) {
      medicineModel = Medicine.fromJson(value.data);
      emit(MedicineSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MedicineErrorState(error.toString()));
    });
  }
  /////////////////////////// Add Medicine //////////////////////////////////////

  void postMedicine({
    required String patientId,
    required String medicineName,
    required String phone,
    required String quantity,
    required String exprDate,
  }) {
    emit(AddMedicineLoadingState());
    DioHelper.postData(
      path:
          "/api/medicine/addmedicine?patientId=$patientId&medicineName=$medicineName&phone=$phone&quantity=$quantity&ExprDate=$exprDate",
    ).then((value) {
      emit(AddMedicineSuccessState());
      getMedicine();
    }).catchError((error) {
      emit(AddMedicineErrorState(error));
    });
  }

  ////////////////////////////get doctor by id ///////////////////////////////////////
  DoctorsInDepart doctorById = DoctorsInDepart();

  void getDoctorById({required String id}) {
    emit(GetDoctorByIdLoadingState());

    DioHelper.getData(path: "/api/Department/GetDoctorById?id=$id")
        .then((value) {
      doctorById = DoctorsInDepart.fromJson(value.data);
      emit(GetDoctorByIdSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetDoctorByIdErrorState(error.toString()));
    });
  }

  /////////////////////// Prescription ///////////////////////////////////////////////////
  Prescription prescription = Prescription();
  void getAllPrescription({required String email}) {
    emit(GetPrescriptionLoadingState());
    DioHelper.getData(
            path: "/api/prescription/getallprescriptions?patientid=$email")
        .then((value) {
      prescription = Prescription.fromJson(value.data);
      emit(GetPrescriptionSuccessState());
    }).catchError((error) {
      emit(GetPrescriptionErrorState(error.toString()));
    });
  }

  /////////////////////// Prescription By Id /////////////////////////////////////////
  void getPrescriptionById({required int id}) {
    emit(GetPrescriptionByIdLoadingState());
    DioHelper.getData(path: "/api/prescription/getprescriptionById?id=$id")
        .then((value) {
      emit(GetPrescriptionByIdLoadingState());
    }).catchError((error) {
      emit(GetPrescriptionByIdErrorState(error.toString()));
    });
  }

  /////////////////////// Booking Doctor ///////////////////////////////////////////
  void bookingDoctor({
    required String doctorId,
    required String patientId,
  }) {
    emit(BookingDoctorLoadingState());
    DioHelper.postData(
            path:
                "/api/Department/bookingdoctor?id=$doctorId&patientId=$patientId")
        .then((value) {
      emit(BookingDoctorSuccessState());
    }).catchError((error) {
      emit(
        BookingDoctorErrorState(
          error.toString(),
        ),
      );
      print(error.toString());
    });
  }
}
