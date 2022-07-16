import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/model/intensive-care-model.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/constant.dart';
import 'package:h_care/shared/cubit/login_cubit/cubit.dart';
import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';

class IntensiveCare extends StatelessWidget {
  const IntensiveCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: ((context, state) {
        
      }),
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
Widget intensiveWidget(context){
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
            Row(
              children: [
                Icon(
                  Icons.home_filled,
                  size: 32.0,
                  color: secondColor,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  "Address of hospital",
                  style: TextStyle(fontSize: 20.0, color: secondColor),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: const [
                Icon(
                  Icons.attach_money_outlined,
                  size: 32.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "price : 100.0",
                  style: TextStyle(
                    fontSize: 18.0,
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
