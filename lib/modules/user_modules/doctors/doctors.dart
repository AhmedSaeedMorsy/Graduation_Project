// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:h_care/modules/user_modules/doctor_screen/doctor_screen.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class DoctorDisplay extends StatelessWidget {
  const DoctorDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Doctors.. ",
              style: TextStyle(color: mainColor, fontSize: 30.0),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) => doctorItem(context),
                  separatorBuilder: (context, index) => const SizedBox(
                        height: 15.0,
                      ),
                  itemCount: 10),
            )
          ],
        ),
      ),
    );
  }

  Widget doctorItem(context) {
    return GestureDetector(
      onTap: () {
        navigatTo(context, const DoctorScreen());
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(15.0),
            color: thirdColor),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white38,
                    ),
                    child: const Image(
                      width: 100.0,
                      height: 100.0,
                      image: AssetImage(
                        "assets/images/onboarding_4.png",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "name doctor",
                          style: TextStyle(
                            color: mainColor,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        const Text(
                          "Specialiest of doctor",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w100,
                            color: Colors.white,
                          ),
                        ),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 0.0),
                          itemBuilder: (context, number) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: const [
                  Icon(Icons.attach_money_outlined),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("price :"),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text("100"),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              bookMatrialButton(backGround: mainColor, textColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
