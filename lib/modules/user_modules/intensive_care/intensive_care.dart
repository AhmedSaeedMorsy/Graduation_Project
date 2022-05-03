import 'package:flutter/material.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class IntensiveCare extends StatelessWidget {
  const IntensiveCare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Intensive Care",
          style: TextStyle(color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.separated(
            itemBuilder: (context, index) => intensiveCareItem(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 15.0,
                ),
            itemCount: 10),
      ),
    );
  }

  Widget intensiveCareItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15.0),
        color: Colors.white70,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.text_format,
                  size: 32.0,
                  color: mainColor,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  "Hospital Name",
                  style: TextStyle(color: mainColor, fontSize: 22.0),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Icon(
                  Icons.home_filled,
                  size: 32.0,
                  color: secondColor,
                ),
                const SizedBox(
                  width: 15.0,
                ),
                Text(
                  "Address of hospital",
                  style: TextStyle(fontSize: 20.0, color: secondColor),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: const [
                Icon(
                  Icons.attach_money_outlined,
                  size: 32.0,
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  "price : 100.0",
                  style: TextStyle(
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15.0,
            ),
            defaultButton(text: "booking bed", function: () {})
          ],
        ),
      ),
    );
  }
}
