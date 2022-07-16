// ignore_for_file: must_be_immutable

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/layout/user_layout.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/constant.dart';
import 'package:h_care/shared/cubit/login_cubit/cubit.dart';
import 'package:h_care/shared/cubit/login_cubit/states.dart';
import 'package:h_care/shared/network/local/cache_helper.dart';
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
      listener: (context, state) {
        if (state is UserRigesterSuccessState) {
          if (LoginCubit.get(context).userRigesterModel!.isAuthenticated) {
            CacheHelper.setData(
                key: "role",
                value: LoginCubit.get(context).userLoginModel!.role![0]);
            CacheHelper.setData(
                    key: "token",
                    value: LoginCubit.get(context).userRigesterModel!.token)
                .then((value) {
              navigatorPushAndReblace(context, UserHomeLayOut());
            });
            CacheHelper.setData(
                key: "userName",
                value: LoginCubit.get(context).userRigesterModel!.username);
            token = LoginCubit.get(context).userRigesterModel!.token;
            username = LoginCubit.get(context).userRigesterModel!.username;
            role = LoginCubit.get(context).userLoginModel!.role![0];
          } else {
            showToast(
              message: LoginCubit.get(context).userRigesterModel!.message ??
                  "try again",
              context: context,
              title: 'Oops..!',
              state: toast.error,
            );
          }
        } else if (state is UserRigesterErrorState) {
          showToast(
            message: "Please enter correct data , and try again",
            state: toast.error,
            context: context,
            title: 'Oops..!',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(
                "Sign Up",
                style: TextStyle(color: mainColor),
              ),
            ),
            body: offlineWidget(
              Center(
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
                          const SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            "Sign up",
                            style: TextStyle(
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
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
                            prefixIcon:
                                const Icon(Icons.alternate_email_outlined),
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
                                LoginCubit.get(context)
                                    .changeVisibilityPassword();
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
                            obscure:
                                LoginCubit.get(context).isShownConfirmPassword,
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
                              icon:
                                  LoginCubit.get(context).suffixConfirmPassword,
                            ),
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
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please Enter Your phone number";
                              }
                            },
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
                                return "Please Enter Your age";
                              }
                            },
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilderRec(
                            condition: state is! UserRigesterLoadingState,
                            builder: (context) => defaultButton(
                              text: "Sign Up",
                              function: () {
                                if (formKey.currentState!.validate()) {
                                  LoginCubit.get(context).userRigester(
                                    confirmPassward:
                                        confirmPasswordController.text,
                                    email: emailController.text,
                                    passward: passwordController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    phoneNumper: phoneController.text,
                                    age: ageController.text,
                                  );
                                }
                              },
                            ),
                            fallback: (context) => const Center(
                                child: CircularProgressIndicator()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }
}
