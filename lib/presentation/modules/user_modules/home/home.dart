import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/model/hospitals-model.dart';
import 'package:h_care/presentation/componant/componant.dart';
import 'package:h_care/presentation/modules/user_modules/hospital/hospital.dart';
import 'package:h_care/presentation/modules/user_modules/intensive_care/intensive_care.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilderRec(
          condition:
              UserCubit.get(context).hospitalModel.hospitalDataModel.isNotEmpty,
          builder: (context) =>
              Scaffold(body: offlineWidget(homeWidget(context))),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  Widget homeWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: secondColor,
                borderRadius: BorderRadiusDirectional.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Need a Hospital ?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "We offer you the best hospitals to help you get better care",
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Image(
                      image: AssetImage(
                        "assets/images/onboarding_4.png",
                      ),
                      height: 200.0,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadiusDirectional.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "You want the nearest hospital..",
                        style: TextStyle(color: mainColor, fontSize: 18.0),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios_outlined),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            InkWell(
              onTap: () => navigatTo(
                context,
                const IntensiveCare(),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadiusDirectional.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Intensive Care..",
                          style: TextStyle(color: mainColor, fontSize: 18.0),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Hospitals.. ",
              style: TextStyle(color: mainColor, fontSize: 26.0),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ConditionalBuilderRec(
              condition: UserCubit.get(context)
                  .hospitalModel
                  .hospitalDataModel
                  .isEmpty,
              builder: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
              fallback: (context) => ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => hospitalItem(
                    context,
                    UserCubit.get(context)
                        .hospitalModel
                        .hospitalDataModel[index]),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ),
                itemCount: UserCubit.get(context)
                    .hospitalModel
                    .hospitalDataModel
                    .length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget hospitalItem(context, HospitalDataModel model) {
    return InkWell(
      onTap: () {
        UserCubit.get(context).getDeptInHospital(model.id);
        navigatTo(context, Hospital.info(model.name, model.address,model.image));
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadiusDirectional.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(model.image), fit: BoxFit.cover),
                  ),
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.name,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: 22.0,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: "Address : ",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 18.0,
                        ),
                        children: [
                          TextSpan(
                            text: model.address,
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
