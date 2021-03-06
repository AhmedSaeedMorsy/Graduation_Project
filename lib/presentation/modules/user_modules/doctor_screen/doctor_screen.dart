// ignore_for_file: sized_box_for_whitespace, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/local/cache_helper.dart';
import 'package:h_care/presentation/componant/componant.dart';

class DoctorScreen extends StatelessWidget {
  late String name;
  late String email;
  late String dLastName;
  late String dPhone;
  late String day;
  late String hospital;
  late String imagePath;
  late String dept;
  late String time;
  DoctorScreen.Info(this.dLastName, this.dPhone, this.day, this.email,
      this.hospital, this.imagePath, this.name, this.dept, this.time,
      {Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if (state is BookingDoctorSuccessState) {
          showToast(
              message: "Successfully booked",
              state: toast.success,
              title: "Done",
              context: context);
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              elevation: 0.0,
            ),
            body: offlineWidget(doctorWidget(context)));
      },
    );
  }

  Widget doctorWidget(context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                  topStart: Radius.circular(15.0),
                  topEnd: Radius.circular(15.0),
                ),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(imagePath),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: double.infinity,
            decoration: BoxDecoration(
              color: mainColor,
              borderRadius: const BorderRadiusDirectional.vertical(
                top: Radius.circular(
                  80.0,
                ),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name + " " + dLastName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 26.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 15.0,
                            ),
                            Text(
                              "Specialties: $dept",
                              style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      "Biography",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "hospital : $hospital",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Email : $email",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      "Phone : $dPhone",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      "Appointment",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Day : $day",
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text(
                      "schedule",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    bookMatrialButton(
                        backGround: forthColor,
                        textColor: mainColor,
                        onPressed: () {
                          showToast(
                            message: "Do you want to confirm your booking?",
                            state: toast.confirm,
                            title: "Confirm",
                            context: context,
                            showCance: true,
                            confirmFunction: () {
                              Navigator.pop(context);
                              UserCubit.get(context).bookingDoctor(
                                doctorId: email,
                                patientId: CacheHelper.getData(key: "userName"),
                              );
                            },
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
