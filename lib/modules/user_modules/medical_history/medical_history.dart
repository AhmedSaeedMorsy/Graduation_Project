import 'package:flutter/material.dart';
import 'package:h_care/modules/user_modules/prescription/prescription.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class MedicalHistory extends StatelessWidget {
  const MedicalHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    "Medical History..",
                    style: TextStyle(color: mainColor, fontSize: 30.0),
                  ),
                  const Image(
                    width: 130.0,
                    height: 150.0,
                    image: AssetImage(
                      "assets/images/medical_history.png",
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
              child: ListView.separated(
                  itemBuilder: (context, index) => medicalHistoryItem(context),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                  itemCount: 10)),
        ],
      ),
    );
  }

  Widget medicalHistoryItem(context) {
    return InkWell(
      onTap: () => navigatTo(context, const Prescription()),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadiusDirectional.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Today",
                style: TextStyle(color: mainColor, fontSize: 20.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Specialist : dental ",
                style: TextStyle(color: mainColor, fontSize: 18.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                "Lorem Achieving success through hard work is my top priority. Lorem Achieving success through ",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(color: Colors.grey, fontSize: 14.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
