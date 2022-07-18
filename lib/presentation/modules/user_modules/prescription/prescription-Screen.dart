// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/presentation/componant/componant.dart';

class PrescriptionScreen extends StatelessWidget {
  late String medicineName;
  late String dateTime;
  late String department;
  late String notes;

  PrescriptionScreen.info(
      this.dateTime, this.department, this.medicineName, this.notes);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(), body: offlineWidget(prescriptionWidget()));
  }

  Widget prescriptionWidget() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadiusDirectional.circular(15.0)),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                "Prescription..",
                style: TextStyle(color: mainColor, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                dateTime,
                style: TextStyle(
                  color: mainColor,
                  fontSize: 25.0,
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Text(
                "Specialist : $department ",
                style: TextStyle(color: mainColor, fontSize: 22.0),
              ),
              const SizedBox(
                height: 50.0,
              ),
              Container(height: 1.0,width: double.infinity,color: mainColor,),
              const SizedBox(
                height: 30.0,
              ),
              prescriptionItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget prescriptionItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: "Medicine Name : ",
            style: TextStyle(
              color: mainColor,
              fontSize: 22.0,
            ),
            children: [
              TextSpan(
                text: medicineName,
                style: TextStyle(
                  color: secondColor,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15.0,
        ),
        RichText(
          text: TextSpan(
            text: "Notes : ",
            style: TextStyle(
              color: mainColor,
              fontSize: 22.0,
            ),
            children: [
             
              TextSpan(
                text: notes,
                style: TextStyle(
                  color: secondColor,
                  fontSize: 22.0,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
