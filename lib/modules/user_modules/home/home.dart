import 'package:flutter/material.dart';
import 'package:h_care/modules/user_modules/hospital/hospital.dart';

import 'package:h_care/modules/user_modules/intensive_care/intensive_care.dart';
import 'package:h_care/shared/componant/componant.dart';

import 'package:h_care/shared/style/color.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: secondColor,
                  borderRadius: BorderRadiusDirectional.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: const [
                            Text(
                              "Need a Hospital ?",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            Text(
                              "We offer you the best hospitals to help you get better care",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Image(
                        image: AssetImage(
                          "assets/images/onboarding_4.png",
                        ),
                        height: 200.0,
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadiusDirectional.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Text(
                        "You want the nearest hospital..",
                        style: TextStyle(color: mainColor, fontSize: 20.0),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_outlined),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              InkWell(
                onTap: () => navigatTo(
                  context,
                  const IntensiveCare(),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white38,
                    borderRadius: BorderRadiusDirectional.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Text(
                          "Intensive Care..",
                          style: TextStyle(color: mainColor, fontSize: 20.0),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_forward_ios_outlined),
                          onPressed: () {},
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                "Hospitals.. ",
                style: TextStyle(color: mainColor, fontSize: 30.0),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => hospitalItem(context),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ),
                itemCount: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget hospitalItem(context) {
    return InkWell(
      onTap: () => navigatTo(context,const Hospital() ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white38,
          borderRadius: BorderRadiusDirectional.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Image(
                image: AssetImage("assets/images/hospital.png"),
                width: 100.0,
                height: 50.0,
              ),
              const SizedBox(
                width: 20.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name of Hospital",
                    style: TextStyle(color: mainColor, fontSize: 25.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text("Addres of Hospital",
                      style: TextStyle(color: secondColor, fontSize: 20.0)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
