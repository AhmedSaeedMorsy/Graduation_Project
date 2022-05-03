// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

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

  
}
