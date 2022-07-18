import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/states.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/model/intensive-care-model.dart';
import 'package:h_care/presentation/componant/componant.dart';

class IntensiveCare extends StatelessWidget {
  const IntensiveCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: ((context, state) {}),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Intensive Care",
              style: TextStyle(color: mainColor),
            ),
          ),
          body: offlineWidget(intensiveWidget(context)),
        );
      },
    );
  }

  Widget intensiveWidget(context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ConditionalBuilderRec(
        condition: UserCubit.get(context)
            .intensiveCareModel
            .intensiveCareDataModel
            .isNotEmpty,
        builder: (context) => ListView.separated(
            itemBuilder: (context, index) => intensiveCareItem(
                UserCubit.get(context)
                    .intensiveCareModel
                    .intensiveCareDataModel[index],
                context),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ),
            itemCount: UserCubit.get(context)
                .intensiveCareModel
                .intensiveCareDataModel
                .length),
        fallback: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  Widget intensiveCareItem(IntensiveCareDataModel model, context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15.0),
        color: Colors.white70,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.text_format,
                  size: 32.0,
                  color: mainColor,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  model.hospital!.name,
                  style: TextStyle(color: mainColor, fontSize: 22.0),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.home_filled,
                    size: 32.0,
                    color: secondColor,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                  Expanded(
                    child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text: "Address : ",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: 20.0,
                        ),
                        children: [
                          TextSpan(
                            text: model.hospital!.address,
                            style: TextStyle(
                              color: secondColor,
                              fontSize: 18.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.home,
                  size: 32.0,
                  color: secondColor,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                RichText(
                  text: TextSpan(
                    text: "Bed Floor : ",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20.0,
                    ),
                    children: [
                      TextSpan(
                        text: model.bedfloor,
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.numbers_outlined,
                  size: 32.0,
                  color: secondColor,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                RichText(
                  text: TextSpan(
                    text: "Bed Number : ",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20.0,
                    ),
                    children: [
                      TextSpan(
                        text: "${model.bednumber}",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                const Icon(
                  Icons.attach_money_outlined,
                  size: 32.0,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                RichText(
                  text: TextSpan(
                    text: "Price : ",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20.0,
                    ),
                    children: [
                      TextSpan(
                        text: "200.0",
                        style: TextStyle(
                          color: secondColor,
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
          ],
        ),
      ),
    );
  }
}
