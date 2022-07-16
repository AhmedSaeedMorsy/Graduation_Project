// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps, dead_code

import 'package:flutter/material.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:h_care/model/department-model.dart';
import 'package:h_care/modules/user_modules/doctors/doctors.dart';
import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/style/color.dart';

import '../../model/department-in-hospital.dart';

void navigatorPushAndReblace(context, Widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ),
    (Route<dynamic> route) => false);

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType textInputType,
  required String labelText,
  Icon? prefixIcon,
  IconButton? suffixIcon,
  bool obscure = false,
  void Function(String)? onFieldSubmeitted,
  void Function()? onTap,
  String? Function(String?)? validator,
}) =>
    TextFormField(
      onTap: onTap,
      onFieldSubmitted: onFieldSubmeitted,
      obscureText: obscure,
      validator: validator,
      controller: controller,
      keyboardType: textInputType,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
        label: Text(
          "${labelText}",
          style: TextStyle(fontSize: 20.0, color: mainColor),
        ),
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
    clipBehavior: Clip.antiAliasWithSaveLayer,
    decoration: BoxDecoration(
      borderRadius: BorderRadiusDirectional.circular(15.0),
      color: backGround,
    ),
    width: double.infinity,
    height: 40.0,
    child: MaterialButton(
      onPressed: () {},
      child: Text(
        "book",
        style: TextStyle(color: textColor, fontSize: 22.0),
      ),
    ),
  );
}

Widget buildGradItem(
  context,
  model,
) {
  return InkWell(
    onTap: () {
      UserCubit.get(context).getDoctorsInDepart(id: model.id);
      navigatTo(context, DoctorDisplay.Indept(model.name));
    },
    child: Container(
      height: 100,
      decoration: BoxDecoration(
        color: mainColor,
        borderRadius: BorderRadiusDirectional.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Expanded(
              flex: 2,
              child: Image(
                image: AssetImage(
                  "assets/images/photo1.png",
                ),
                width: 60.0,
                height: 60.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Text(
                model.name,
                style: const TextStyle(color: Colors.white70, fontSize: 20.0),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget defaultMatrialButton({
  required String text,
  void Function()? function,
}) {
  return MaterialButton(
    onPressed: function,
    minWidth: 80.0,
    child: Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    color: mainColor,
  );
}

void showToast(
        {required String message,
        required toast state,
        required String title,
        required BuildContext context,
        bool showCance = false,
        void Function()? confirmFunction}) =>
    CoolAlert.show(
      context: context,
      title: title,
      confirmBtnText: "ok",
      onCancelBtnTap: () => Navigator.pop(context),
      type: choseToast(state),
      text: message,
      cancelBtnText: "cancel",
      showCancelBtn: showCance,
      onConfirmBtnTap: confirmFunction,
    );

enum toast { success, warning, error, confirm }

choseToast(toast state) {
  switch (state) {
    case toast.success:
      return CoolAlertType.success;
      break;
    case toast.error:
      return CoolAlertType.error;
      break;
    case toast.warning:
      return CoolAlertType.warning;
      break;
    case toast.confirm:
      return CoolAlertType.confirm;
      break;
  }
}

Widget offlineWidget(Widget widget) {
  return OfflineBuilder(
    connectivityBuilder: (
      BuildContext context,
      ConnectivityResult connectivity,
      Widget child,
    ) {
      final bool connected = connectivity != ConnectivityResult.none;
      if (connected) {
        return widget;
      } else {
        return Center(
          child: Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Can't connect .. Check your internet",
                style: TextStyle(
                  fontSize: 18.0,
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Image(
                image: AssetImage(
                  "assets/images/offline.png",
                ),
              ),
            ]),
          ),
        );
      }
    },
    child: Center(
        child: CircularProgressIndicator(
      color: mainColor,
    )),
  );
}
