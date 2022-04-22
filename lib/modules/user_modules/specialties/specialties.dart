// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:h_care/modules/user_modules/doctors/doctors.dart';

import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class Specialties extends StatelessWidget {
  const Specialties({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white38,
        borderRadius: BorderRadiusDirectional.vertical(
          top: Radius.circular(60.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Specialties..",
                style: TextStyle(color: mainColor, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 1 / 1,
                  children: List.generate(
                    20,
                    (index) => buildGradItem(context),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildGradItem(context) {
    return InkWell(
      onTap: () {
        navigatTo(context , const DoctorDisplay());
      },
      child: Container(
        decoration: BoxDecoration(
          color: mainColor,
          borderRadius: BorderRadiusDirectional.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: const [
              Image(
                image: AssetImage(
                  "assets/images/photo1.png",
                ),
                width: 60.0,
                height: 60.0,
              ),SizedBox(
                height: 10.0,
              ),
              Text(
                "specialist name",
                style: TextStyle(color: Colors.white70, fontSize: 22.0),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "30 Doctor",
                style: TextStyle(color: Colors.grey, fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
