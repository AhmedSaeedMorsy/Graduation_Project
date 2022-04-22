// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'package:flutter/material.dart';
import 'package:h_care/shared/style/color.dart';

void navigatorPushAndReblace(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (Route<dynamic> route) => false);

Widget defaultTextFormField(
        {required TextEditingController controller,
        required TextInputType textInputType,
        required String labelText,
        required Icon prefixIcon,
        IconButton? suffixIcon,
        bool obscure = false ,
        void Function(String)? onFieldSubmeitted,
        String? Function(String?)? validator}) =>
    TextFormField(
      onFieldSubmitted: onFieldSubmeitted,
      obscureText: obscure,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        label: Text("${labelText}"),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );

Widget defaultButton(
        {required String text, required void Function()? function}) =>
    Container(
      width: double.infinity,
      child: TextButton(
        onPressed: function,
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      decoration: BoxDecoration(
        color:mainColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );

navigatTo(context, Widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget),
  );
}

Widget bookMatrialButton(
  {
    required Color backGround ,
    required Color textColor,
  }
){
  return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(15.0),
                    color: backGround),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {},
                  child:  Text(
                    "book",
                    style: TextStyle(color:textColor, fontSize: 24.0),
                  ),
                ),
              );
}