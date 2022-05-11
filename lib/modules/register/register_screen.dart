// ignore_for_file: must_be_immutable

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/cubit/login_cubit/cubit.dart';
import 'package:h_care/shared/cubit/login_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var firstNameController = TextEditingController();
  var phoneController = TextEditingController();
  var ageController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Sign Up",
              style: TextStyle(color: mainColor),
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Image(
                        width: 150.0,
                        height: 150.0,
                        image: AssetImage("assets/images/icon.png"),
                      ),
                      Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: mainColor,
                        ),
                      ),
                      defaultTextFormField(
                        controller: firstNameController,
                        textInputType: TextInputType.name,
                        labelText: "first name",
                        prefixIcon: const Icon(Icons.person),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Name";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        controller: lastNameController,
                        textInputType: TextInputType.name,
                        labelText: "last name",
                        prefixIcon: const Icon(Icons.person),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        labelText: "Email Address",
                        prefixIcon: const Icon(Icons.alternate_email_outlined),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Email Adress";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        controller: passwordController,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "Password",
                        obscure: LoginCubit.get(context).isShownPassword,
                        prefixIcon: const Icon(Icons.lock_outlined),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            LoginCubit.get(context).changeVisibilityPassword();
                          },
                          icon: LoginCubit.get(context).suffixPassword,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        controller: confirmPasswordController,
                        textInputType: TextInputType.visiblePassword,
                        labelText: "confirm Password",
                        obscure: LoginCubit.get(context).isShownConfirmPassword,
                        prefixIcon: const Icon(Icons.lock_outlined),
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                        },
                        suffixIcon: IconButton(
                          onPressed: () {
                            LoginCubit.get(context)
                                .changeVisibilityConfirmPassword();
                          },
                          icon: LoginCubit.get(context).suffixConfirmPassword,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        controller: ageController,
                        textInputType: TextInputType.number,
                        labelText: "age",
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please Enter Your Password";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      defaultTextFormField(
                        controller: phoneController,
                        textInputType: TextInputType.phone,
                        labelText: "phone",
                        prefixIcon: const Icon(
                          Icons.phone,
                        ),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ConditionalBuilderRec(
                        condition: true,
                        builder: (context) => defaultButton(
                          text: "Sign Up",
                          function: () {},
                        ),
                        fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
