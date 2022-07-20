import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/doctor_cubit/cubit.dart';
import 'package:h_care/business-logic/doctor_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/local/cache_helper.dart';
import 'package:h_care/data/model/doctor.dart';
import 'package:h_care/presentation/componant/componant.dart';

class ProfileDoctorScreen extends StatelessWidget {
  const ProfileDoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit, DoctorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Profile",
              style: TextStyle(color: mainColor),
            ),
          ),
          body: offlineWidget(
              profileScreen(DoctorCubit.get(context).doctor, context)),
        );
      },
    );
  }

  Widget profileScreen(Doctor model, context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 260.0,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Align(
                    alignment: AlignmentDirectional.topCenter,
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: const BorderRadiusDirectional.only(
                              topStart: Radius.circular(10.0),
                              topEnd: Radius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  CircleAvatar(
                    radius: 65.0,
                    backgroundColor: forthColor,
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundImage: backgroundImage(context),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              model.name + " " + model.dLastName,
              style: TextStyle(
                color: mainColor,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              height: .8,
              width: double.infinity,
              color: thirdColor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.alternate_email_outlined),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        CacheHelper.getData(key: "userName"),
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.phone),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        model.dPhone,
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Age",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16.0),
                      ),
                      const SizedBox(
                        width: 22.0,
                      ),
                      Text(
                        "${model.dAge}",
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        model.day,
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      const Icon(Icons.business_outlined),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        model.department.name,
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer,
                        size: 25.0,
                      ),
                      const SizedBox(
                        width: 25.0,
                      ),
                      Text(
                        model.time,
                        style: TextStyle(color: mainColor, fontSize: 16.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  backgroundImage(context) {
    if (DoctorCubit.get(context).doctor.imagePath != null) {
      return NetworkImage(
        DoctorCubit.get(context).doctor.imagePath!,
        
      );
    }
    return AssetImage(
      "assets/images/person.png",
      
    );
  }
}
