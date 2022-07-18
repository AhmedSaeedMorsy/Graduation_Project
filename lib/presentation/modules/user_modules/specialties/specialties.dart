// ignore_for_file: avoid_unnecessary_containers

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/presentation/componant/componant.dart';



class Specialties extends StatelessWidget {
  const Specialties({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return offlineWidget(specialtiesWidget(context));
      },
    );
  }

  Widget specialtiesWidget(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(60.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Specialties..",
                style: TextStyle(color: mainColor, fontSize: 26.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ConditionalBuilderRec(
                condition: UserCubit.get(context)
                    .departmentModel
                    .departmentData
                    .isNotEmpty,
                builder: (context) => Container(
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0,
                    crossAxisSpacing: 8.0,
                    childAspectRatio: 1 / 1.2,
                    children: List.generate(
                      UserCubit.get(context)
                          .departmentModel
                          .departmentData
                          .length,
                      (index) => buildGradItem(
                          context,
                          UserCubit.get(context)
                              .departmentModel
                              .departmentData[index]),
                    ),
                  ),
                ),
                fallback: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
