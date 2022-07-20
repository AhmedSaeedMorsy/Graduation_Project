import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/doctor_cubit/cubit.dart';
import 'package:h_care/business-logic/doctor_cubit/states.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/model/patient-of-doctor.dart';
import 'package:h_care/presentation/componant/componant.dart';
import 'package:h_care/presentation/modules/doctor_modules/patient_screen/patient_screen.dart';

class Patients extends StatelessWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return offlineWidget(patientsWidget());
  }

  Widget patientsWidget() {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your Patient",
                  style: TextStyle(color: mainColor, fontSize: 26.0),
                ),
                const SizedBox(height: 20.0),
                ConditionalBuilderRec(
                  condition: DoctorCubit.get(context)
                      .patientOfDoctor
                      .patientOfDoctorModel
                      .isNotEmpty,
                  builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => patientItem(
                          context,
                          DoctorCubit.get(context)
                              .patientOfDoctor
                              .patientOfDoctorModel[index]),
                      separatorBuilder: (context, index) => Container(
                            color: mainColor,
                            width: double.infinity,
                            height: 2.0,
                          ),
                      itemCount: DoctorCubit.get(context)
                          .patientOfDoctor
                          .patientOfDoctorModel
                          .length),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget patientItem(
    context,
    PatientOfDoctorModel model,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.patient.pFirstName + " " + model.patient.pLastName,
                  style: TextStyle(fontSize: 22.0, color: mainColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  model.patientid,
                  maxLines: 3,
                  style: TextStyle(fontSize: 14.0, color: secondColor),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  "Age :  ${model.patient.pAge}",
                  style: TextStyle(fontSize: 16.0, color: secondColor),
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 5.0,
          ),
          Expanded(
            flex: 2,
            child: defaultMatrialButton(
                text: "modify",
                function: () {
                  navigatTo(
                    context,
                    PatientScreen(
                        model.patient.pFirstName +
                            " " +
                            model.patient.pLastName,
                        DoctorCubit.get(context).doctor.department.name,
                        model.patientid),
                  );
                  UserCubit.get(context).getAllPrescription(
                    email: model.patientid,
                  );
                }),
          ),
        ],
      ),
    );
  }
}
