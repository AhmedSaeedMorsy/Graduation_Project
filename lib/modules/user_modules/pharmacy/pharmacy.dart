import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/model/medicine-model.dart';
import 'package:h_care/model/user-rigester-model.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/constant.dart';
import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/cubit/user_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';
import 'package:intl/intl.dart';

class Pharmacy extends StatelessWidget {
  Pharmacy({Key? key}) : super(key: key);
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var controllerMedicineName = TextEditingController();
  var controllerPhone = TextEditingController();
  var controllerExprDate = TextEditingController();
  var controllerQuantity = TextEditingController();
  var controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          key: scaffoldKey,
          body: offlineWidget(pharmacyWidget(context)),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              if (UserCubit.get(context).isBottomSheetShown) {
                if (formKey.currentState!.validate()) {
                  UserCubit.get(context).postMedicine(
                      patientId: controllerEmail.text,
                      medicineName: controllerMedicineName.text,
                      phone: controllerPhone.text,
                      quantity: controllerQuantity.text,
                      exprDate: controllerExprDate.text);
                  Navigator.pop(context);

                  UserCubit.get(context).changeBottomSheet(
                    isShow: false,
                    icon: Icons.add,
                  );
                }
              } else {
                scaffoldKey.currentState!
                    .showBottomSheet(
                      (context) => Container(
                        color: forthColor,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: forthColor,
                              border: Border.all(color: thirdColor, width: 2),
                              borderRadius: BorderRadiusDirectional.circular(
                                15.0,
                              ),
                            ),
                            width: double.infinity,
                            padding: const EdgeInsetsDirectional.all(20.0),
                            child: Form(
                              key: formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const SizedBox(
                                      height: 10.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerEmail,
                                      textInputType: TextInputType.emailAddress,
                                      labelText: "Your Email",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Your Email must not be empty');
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.alternate_email_outlined,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerMedicineName,
                                      textInputType: TextInputType.text,
                                      labelText: "Medicine Name",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Medicine Name must not be empty');
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.title,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerPhone,
                                      labelText: 'Phone',
                                      textInputType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Phone must not be empty');
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.phone,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerQuantity,
                                      textInputType: TextInputType.number,
                                      labelText: "Quantity",
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('Quantity must not be empty');
                                        }
                                        return null;
                                      },
                                      prefixIcon: const Icon(
                                        Icons.numbers,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20.0,
                                    ),
                                    defaultTextFormField(
                                      controller: controllerExprDate,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return ('ExprDate must not be empty');
                                        }
                                        return null;
                                      },
                                      textInputType: TextInputType.datetime,
                                      labelText: 'ExpirDate',
                                      prefixIcon: const Icon(
                                        Icons.calendar_today_outlined,
                                      ),
                                      onTap: () {
                                        showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate:
                                              DateTime.parse('2030-12-30'),
                                        ).then(
                                          (value) {
                                            controllerExprDate.text =
                                                DateFormat.yMMMd()
                                                    .format(value!);
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                    .closed
                    .then((value) {
                  UserCubit.get(context)
                      .changeBottomSheet(isShow: false, icon: Icons.add);
                });
                UserCubit.get(context).changeBottomSheet(
                    isShow: true, icon: Icons.note_add_outlined);
              }
            },
            child: Icon(
              UserCubit.get(context).fabIcon,
              color: forthColor,
            ),
          ),
        );
      },
    );
  }

  Widget pharmacyWidget(context) {
    return BlocConsumer<UserCubit, UserStates>(
      listener: (context, state) {
        if(state is AddMedicineSuccessState){
          showToast(
            message: "Added successfully",
            state: toast.success,
            title: "Done",
            context: context);
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pharmacy..",
                style: TextStyle(color: mainColor, fontSize: 26.0),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Expanded(
                child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => drugItem(
                        UserCubit.get(context)
                            .medicineModel
                            .medicineModel[index]),
                    separatorBuilder: (context, index) => Container(
                          color: mainColor,
                          width: double.infinity,
                          height: 2.0,
                        ),
                    itemCount: UserCubit.get(context)
                        .medicineModel
                        .medicineModel
                        .length),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget drugItem(MedicineModel model) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: mainColor,
            radius: 22.0,
            child: Text(
              model.quantity,
              textScaleFactor: 1.5,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.medicineName,
                    style: const TextStyle(fontSize: 18.0),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Text(
                    "Expiry date : ${model.exprDate}",
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
          ),
          defaultMatrialButton(text: "Request", function: () {}),
        ],
      ),
    );
  }
}
