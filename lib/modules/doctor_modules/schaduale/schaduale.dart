import 'package:flutter/material.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class Schaduale extends StatelessWidget {
  const Schaduale({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return offlineWidget(schadualeWidget());
  }

  Widget schadualeWidget() {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: TextStyle(fontSize: 26.0, color: mainColor),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => schadualeItem(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemCount: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget schadualeItem() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadiusDirectional.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: mainColor,
              child: const Text(
                "03:30",
                style: TextStyle(color: Colors.white70, fontSize: 18.0),
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "name of patient",
                    style: TextStyle(
                      color: mainColor,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    "name of hospital",
                    style: TextStyle(
                      color: secondColor,
                      fontSize: 18.0,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 15.0,
            ),
            Column(
              children: [
                defaultMatrialButton(
                  text: "Confirm",
                  function: () {},
                ),
                const SizedBox(
                  height: 10.0,
                ),
                defaultMatrialButton(text: "Cancel", function: () {}),
              ],
            )
          ],
        ),
      ),
    );
  }
}
