// ignore_for_file: sized_box_for_whitespace

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Image(
                image: AssetImage("assets/images/onboarding_4.png"),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              height: double.infinity,
              decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: const BorderRadiusDirectional.vertical(
                      top: Radius.circular(80.0))),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            children: const [
                              Text(
                                "name doctor",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "specialiest of doctor",
                                style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "4.5",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        "Biography",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      const Text(
                        "Lorem Achieving success through hard work is my top priority. Lorem Achieving success through hard work is my top priority. Lorem Achieving success through hard work is my top priority. ",
                        maxLines: 7,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.0,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        "Appointment",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      DatePicker(
                        DateTime.now(),
                        height: 120.0,
                        dateTextStyle: const TextStyle(
                            color: Colors.white70, fontSize: 22.0),
                        dayTextStyle: const TextStyle(
                            color: Colors.white70, fontSize: 14.0),
                        monthTextStyle: const TextStyle(
                            color: Colors.white70, fontSize: 14.0),
                        initialSelectedDate: DateTime.now(),
                        selectionColor: forthColor,
                        selectedTextColor: mainColor,
                        onDateChange: (date) {
                          // New date selected
                        },
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        "schedule",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height: 54.0,
                        child: ListView.separated(
                            itemBuilder: (context, index) => scheduleButton(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  width: 10.0,
                                ),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: 6),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      bookMatrialButton(
                          backGround: forthColor, textColor: mainColor),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget scheduleButton() {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadiusDirectional.circular(12.0)),
        child: MaterialButton(
          onPressed: () {},
          child: const Text(
            "08:30 pm",
            style: TextStyle(fontSize: 18.0),
          ),
        ));
  }
}
