import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/doctor_cubit/cubit.dart';
import 'package:h_care/business-logic/doctor_cubit/states.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/model/prescription.dart';
import 'package:h_care/presentation/componant/componant.dart';
import 'package:intl/intl.dart';

class PatientScreen extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late String patientId;
  late String department;
  var formKey = GlobalKey<FormState>();
  var controllerMedicineName = TextEditingController();
  var controllerNotes = TextEditingController();
  var controllerDatetime = TextEditingController();
  late String name;
  PatientScreen(this.name, this.department, this.patientId, {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {
        if (state is AddPriscriptionSuccessState) {
          showToast(
              message: "Added successfully",
              state: toast.success,
              title: "Done",
              context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            title: Text(
              name,
              style: TextStyle(color: mainColor),
            ),
          ),
          body: offlineWidget(
            medicalHistoryWidgt(context),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (UserCubit.get(context).isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  DoctorCubit.get(context).addPriscription(
                    
                      dateTime: controllerDatetime.text,
                      medicineName: controllerMedicineName.text,
                      notes: controllerNotes.text,
                      patientId: patientId,
                      department: department);
                  Navigator.pop(context);

                  DoctorCubit.get(context).changeBottomSheet(
                    isShow: false,
                    icon: Icons.add,
                  );
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                        color: forthColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: forthColor,
                              border: Border.all(color: thirdColor, width: 2),
                              borderRadius: BorderRadiusDirectional.circular(
                                15.0,
                              ),
                            ),
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.all(20.0),
                            child: Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerMedicineName,
                                      textInputType: TextInputType.text,
                                      labelText: "Medicine Name",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Medicine Name must not be empty');
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.title,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerNotes,
                                      labelText: 'Notes',
                                      textInputType: TextInputType.text,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Notes must not be empty');
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.note,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerDatetime,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Date must not be empty');
                                        }
                                        return null;
                                      },
                                      textInputType: TextInputType.datetime,
                                      labelText: 'Date',
                                      prefixIcon: const Icon(
                                        Icons.calendar_today_outlined,
                                      ),
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2030-12-30'),
                                        ).then(
                                          (value) {
                                            controllerDatetime.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  UserCubit.get(context)
                      .changeBottomSheet(isShow: false, icon: Icons.add);
                });
                UserCubit.get(context).changeBottomSheet(
                    isShow: true, icon: Icons.note_add_outlined);
              }
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }

  Widget medicalHistoryWidgt(context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadiusDirectional.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Medical History..",
                          style: TextStyle(color: mainColor, fontSize: 24.0),
                        ),
                      ),
                      const Expanded(
                        flex: 2,
                        child: Image(
                          width: 130.0,
                          height: 150.0,
                          image: AssetImage(
                            "assets/images/medical_history.png",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: ConditionalBuilderRec(
                  condition: state is! GetPrescriptionLoadingState,
                  builder: (context) => ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => medicalHistoryItem(
                        context,
                        UserCubit.get(context)
                            .prescription
                            .prescriptionModel[index]),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                    itemCount: UserCubit.get(context)
                        .prescription
                        .prescriptionModel
                        .length,
                  ),
                  fallback: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget medicalHistoryItem(context, PrescriptionModel model) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadiusDirectional.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              model.dateTime,
              style: TextStyle(color: mainColor, fontSize: 20.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "Specialist : ${model.department}",
              style: TextStyle(color: mainColor, fontSize: 18.0),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              model.medicineName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(color: Colors.grey, fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
