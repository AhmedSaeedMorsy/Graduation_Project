import 'package:flutter/material.dart';
import 'package:h_care/modules/doctor_modules/patient_screen/patient_screen.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class Patients extends StatelessWidget {
  const Patients({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return offlineWidget(patientsWidget());
  }

  Widget patientsWidget() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListView.separated(
          itemBuilder: (context, index) => patientItem(context),
          separatorBuilder: (context, index) => Container(
                color: mainColor,
                width: double.infinity,
                height: 2.0,
              ),
          itemCount: 10),
    );
  }

  Widget patientItem(context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "name of patient",
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "date : 02:04:2022",
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
          const Spacer(),
          defaultMatrialButton(
              text: "modify",
              function: () => navigatTo(context, const PatientScreen())),
        ],
      ),
    );
  }
}
