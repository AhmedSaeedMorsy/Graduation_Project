import 'package:flutter/material.dart';
import 'package:h_care/shared/style/color.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "name of patient",
          style: TextStyle(color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadiusDirectional.circular(15.0)),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Prescription..",
                  style: TextStyle(color: mainColor, fontSize: 30.0),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  "date : 02:04:202",
                  style: TextStyle(
                    color: mainColor,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        prescriptionItem(index + 1),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 15.0,
                    ),
                    itemCount: 8,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget prescriptionItem(int index) {
    return Text(
      "$index- Lorem Achieving success through hard work is my top priority. Lorem Achieving success through ",
      style: TextStyle(color: secondColor, fontSize: 18.0),
    );
  }
}
