// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/layout/home_layout.dart';
import 'package:h_care/modules/register/register_screen.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/cubit/login_cubit/cubit.dart';
import 'package:h_care/shared/cubit/login_cubit/states.dart';
import 'package:h_care/shared/style/color.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, states) {},
      builder: (context, states) {
        return Scaffold(
          body: SafeArea(
            child: Center(
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
                          "Login",
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                            color: mainColor,
                          ),
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
                          obscure: LoginCubit.get(context).isShown,
                          prefixIcon: const Icon(Icons.lock_outlined),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please Enter Your Password";
                            }
                          },
                          onFieldSubmeitted: (String? value) {
                            if (formKey.currentState!.validate()) {}
                          },
                          suffixIcon: IconButton(
                            onPressed: () {
                              LoginCubit.get(context)
                                  .changeVisibilityPassword();
                            },
                            icon: LoginCubit.get(context).suffix,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        defaultButton(
                            text: "Login",
                            function: () {
                              if (formKey.currentState!.validate()) {
                                navigatTo(context, const HomeLayOut());
                              }
                            }),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an Account ?",
                              style: TextStyle(color: Colors.grey),
                            ),
                            const SizedBox(
                              width: 5.0,
                            ),
                            TextButton(
                              onPressed: () {
                                navigatTo(context, RegisterScreen());
                              },
                              child: Text(
                                "Sign Up",
                                style: TextStyle(color: mainColor),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
