import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/local/cache_helper.dart';
import 'package:h_care/data/model/doctor-of-patient.dart';
import 'package:h_care/data/model/doctors-in-department-model.dart';
import 'package:h_care/data/model/user.dart';
import 'package:h_care/presentation/componant/componant.dart';

class ProfileUserScreen extends StatelessWidget {
  const ProfileUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
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
              profileScreen(UserCubit.get(context).userModel, context)),
        );
      },
    );
  }

  Widget profileScreen(User model, context) {
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
                    child: const CircleAvatar(
                      radius: 60.0,
                      backgroundImage: AssetImage("assets/images/person.png"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              model.pFirstName + " " + model.pLastName,
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
                  Row(children: [
                    const Icon(Icons.alternate_email_outlined),
                    const SizedBox(
                      height: 10.0,
                    ),
                    const SizedBox(
                      width: 25.0,
                    ),
                    Text(
                      CacheHelper.getData(key: "userName"),
                      style: TextStyle(color: mainColor, fontSize: 18.0),
                    ),
                  ]),
                  const SizedBox(
                    height: 20.0,
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
                        "${model.pAge}",
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: .8,
                    width: double.infinity,
                    color: thirdColor,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Your Doctor",
                    style: TextStyle(color: mainColor, fontSize: 26.0),
                  ),
                  const SizedBox(height: 20.0),
                  ConditionalBuilderRec(
                    condition: UserCubit.get(context)
                        .doctorsOfPatient
                        .doctorsOfPatientModel
                        .isNotEmpty,
                    builder: (context) {
                      return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => doctorItem(
                            UserCubit.get(context)
                                .doctorsOfPatient
                                .doctorsOfPatientModel[index]),
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 15.0,
                        ),
                        itemCount: UserCubit.get(context)
                            .doctorsOfPatient
                            .doctorsOfPatientModel
                            .length,
                      );
                    },
                    fallback: (context) => const Center(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget doctorItem(DoctorsOfPatientModel model) {
    return Container(
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
                  backgroundImage: NetworkImage(model.doctorModel.imagePath),
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.doctorModel.name +
                            " " +
                            model.doctorModel.dLastName,
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
                        model.doctorModel.dPhone,
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
                    model.doctorModel.day,
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
          ],
        ),
      ),
    );
  }
}
