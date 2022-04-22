// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';

class Search extends StatelessWidget {
  Search({Key? key}) : super(key: key);
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(fontSize: 25.0, color: mainColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          child: defaultTextFormField(
            controller: searchController,
            textInputType: TextInputType.text,
            labelText: "Search",
            prefixIcon: const Icon(
              Icons.search_outlined,
            ),
          ),
        ),
      ),
    );
  }
}
