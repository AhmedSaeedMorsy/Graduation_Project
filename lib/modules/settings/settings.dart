import 'package:flutter/material.dart';
import 'package:h_care/shared/style/color.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Settings..",
            style: TextStyle(color: mainColor, fontSize: 30.0),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const Icon(Icons.person),
              const SizedBox(
                width: 15.0,
              ),
              const Text(
                "Account",
                style: TextStyle(fontSize: 22.0),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const Icon(Icons.format_quote_outlined),
              const SizedBox(
                width: 15.0,
              ),
              const Text(
                "FAQ",
                style: TextStyle(fontSize: 22.0),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const Icon(Icons.contacts_outlined),
              const SizedBox(
                width: 15.0,
              ),
              const Text(
                "Contact US",
                style: TextStyle(fontSize: 22.0),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const Icon(Icons.privacy_tip_outlined),
              const SizedBox(
                width: 15.0,
              ),
              const Text(
                "Privacy & Security",
                style: TextStyle(fontSize: 22.0),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            children: [
              const Icon(Icons.logout_outlined),
              const SizedBox(
                width: 15.0,
              ),
              const Text(
                "Sign out",
                style: TextStyle(fontSize: 22.0),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.arrow_forward_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
