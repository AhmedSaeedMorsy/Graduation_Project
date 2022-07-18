import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/model/prescription.dart';
import 'package:h_care/presentation/componant/componant.dart';
import 'package:h_care/presentation/modules/user_modules/prescription/prescription-Screen.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return offlineWidget(medicalHistoryWidgt(context));
  }

  Widget medicalHistoryWidgt(context) {
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
              condition: UserCubit.get(context)
                  .prescription
                  .prescriptionModel
                  .isNotEmpty,
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
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }

  Widget medicalHistoryItem(context, PrescriptionModel model) {
    return InkWell(
      onTap: () {
        UserCubit.get(context).getPrescriptionById(id: model.id);
        navigatTo(
            context,
            PrescriptionScreen.info(model.dateTime, model.department,
                model.medicineName, model.notes));
      },
      child: Container(
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
      ),
    );
  }
}
