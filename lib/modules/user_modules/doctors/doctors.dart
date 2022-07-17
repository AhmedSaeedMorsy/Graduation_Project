// ignore_for_file: avoid_print

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:h_care/model/doctors-in-department-model.dart';

import 'package:h_care/modules/user_modules/doctor_screen/doctor_screen.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';

class DoctorDisplay extends StatelessWidget {
  DoctorDisplay({Key? key}) : super(key: key);

  @override
  //late int id;
  late String dept;
  DoctorDisplay.Indept(
    this.dept,
  );
  //UserCubit.get(context).getDoctorsInDepart(id: id);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
        listener: ((context, state) {}),
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(),
              body: offlineWidget(
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Doctors.. ",
                        style: TextStyle(color: mainColor, fontSize: 26.0),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      ConditionalBuilderRec(
                        condition: state is! DoctorsInDepartmentLoadingState,
                        builder: (context) => Expanded(
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemBuilder: (context, index) => doctorItem(
                                  context,
                                  UserCubit.get(context)
                                      .doctorsInDepart
                                      .doctorInDepartmentData[index]),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 15.0,
                                  ),
                              itemCount: UserCubit.get(context)
                                  .doctorsInDepart
                                  .doctorInDepartmentData
                                  .length),
                        ),
                        fallback: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }

  Widget doctorItem(context, DoctorDataModel model) {
    return GestureDetector(
      onTap: () {
        navigatTo(context, const DoctorScreen());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(15.0),
          color: thirdColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        NetworkImage(model.imagePath),
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          model.name + " " + model.dLastName,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 22.0,
                            fontWeight: FontWeight.w100,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          dept,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          model.dPhone,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  height: 1.0,
                  width: double.infinity,
                  color: mainColor,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      model.hospital.name,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.white,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.attach_money_outlined),
                      SizedBox(
                        width: 2.0,
                      ),
                      Text("price :"),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text("100"),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                model.day,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w100,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(
                height: 10.0,
              ),
              bookMatrialButton(backGround: mainColor, textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
