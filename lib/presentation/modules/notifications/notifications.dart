// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/presentation/componant/componant.dart';


class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 25.0, color: mainColor),
        ),
      ),
      body: offlineWidget(notificationWidget()),
    );
  }

  Widget notificationWidget() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        child: ListView.separated(
          itemBuilder: (context, index) => notificationItem(),
          separatorBuilder: (context, index) => const SizedBox(
            height: 15.0,
          ),
          itemCount: 10,
        ),
      ),
    );
  }

  Widget notificationItem() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: thirdColor, width: 2),
        borderRadius: BorderRadiusDirectional.circular(
          15.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: mainColor,
              radius: 5.0,
            ),
            const SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Notifications title",
                    style: TextStyle(color: mainColor, fontSize: 22.0),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const Text(
                    "Lorem Achieving success through hard work is my top priority. Lorem Achieving success through",
                    style: TextStyle(fontSize: 16.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
