// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, dead_code

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:h_care/modules/user_modules/doctors/doctors.dart';
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
        Icon? prefixIcon,
        IconButton? suffixIcon,
        bool obscure = false,
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
        label: Text("${labelText}",style: TextStyle(fontSize: 20.0,color: mainColor),),
        
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
        color: mainColor,
        borderRadius: BorderRadius.circular(15.0),
      ),
    );

navigatTo(context, Widget) {
  return Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Widget),
  );
}

Widget bookMatrialButton({
  required Color backGround,
  required Color textColor,
}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadiusDirectional.circular(15.0),
        color: backGround),
    width: double.infinity,
    child: MaterialButton(
      onPressed: () {},
      child: Text(
        "book",
        style: TextStyle(color: textColor, fontSize: 24.0),
      ),
    ),
  );
}

Widget buildGradItem(context) {
  return InkWell(
    onTap: () {
      navigatTo(context, const DoctorDisplay());
    },
    child: Container(
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadiusDirectional.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: const [
            Image(
              image: AssetImage(
                "assets/images/photo1.png",
              ),
              width: 60.0,
              height: 60.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "specialist name",
              style: TextStyle(color: Colors.white70, fontSize: 22.0),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "30 Doctor",
              style: TextStyle(color: Colors.grey, fontSize: 16.0),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defaultMatrialButton(
  {
    required String text,
    void Function()? function ,
  }
) {
  return MaterialButton(
    onPressed:function,
    minWidth: 100.0,
    child: Text(
      text,
      style:const TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    color: mainColor,
  );
}


void showToast({
  required String message,
  required toast state
}) =>
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 5,
      backgroundColor: choseColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum toast{
  success,error
}

Color choseColor(toast state){
  switch(state){
    case toast.success : return Colors.green;
    break;
    case toast.error : return Colors.red;
    break;
  }
}
