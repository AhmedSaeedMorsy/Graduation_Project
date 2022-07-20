// ignore_for_file: must_be_immutable

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/login_cubit/cubit.dart';
import 'package:h_care/business-logic/login_cubit/states.dart';
import 'package:h_care/constant/constant.dart';
import 'package:h_care/constant/style/color.dart';
import 'package:h_care/data/local/cache_helper.dart';
import 'package:h_care/presentation/componant/componant.dart';
import 'package:h_care/presentation/layout/doctor_layout.dart';
import 'package:h_care/presentation/layout/user_layout.dart';
import 'package:h_care/presentation/modules/register/register_screen.dart';



class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if (state is UserLoginSuccessState) {
          if (LoginCubit.get(context).userLoginModel!.isAuthenticated) {
            if (LoginCubit.get(context).userLoginModel!.role![0] == "User") {
              CacheHelper.setData(key: "role", value: "User");
              CacheHelper.setData(
                      key: "token",
                      value: LoginCubit.get(context).userLoginModel!.token)
                  .then((value) {
                navigatorPushAndReblace(context, UserHomeLayOut());
              });
              CacheHelper.setData(
                  key: "userName",
                  value: LoginCubit.get(context).userLoginModel!.username);
            } else if ((LoginCubit.get(context).userLoginModel!.role![0] ==
                "Doctor")) {
              CacheHelper.setData(key: "role", value: "Doctor");
              CacheHelper.setData(
                  key: "userName",
                  value: LoginCubit.get(context).userLoginModel!.username);
              CacheHelper.setData(
                      key: "token",
                      value: LoginCubit.get(context).userLoginModel!.token)
                  .then((value) {
                navigatorPushAndReblace(context, DoctorHomeLayOut());
              });
            }
            role = LoginCubit.get(context).userLoginModel!.role![0];
            username = LoginCubit.get(context).userLoginModel!.username!;
            token = LoginCubit.get(context).userLoginModel!.token;
          } else {
            showToast(
              message: LoginCubit.get(context).userLoginModel!.message ??
                  "try again",
              state: toast.error,
              context: context,
              title: 'Oops..!',
            );
          }
        } else if (state is UserLoginErrorState) {
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
          body: offlineWidget(SafeArea(
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
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          "Login",
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
                          onFieldSubmeitted: (String? value) {
                            if (formKey.currentState!.validate()) {}
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
                        ConditionalBuilderRec(
                          condition: state is! UserLoginLoadingState,
                          builder: (context) => defaultButton(
                            text: "Login",
                            function: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  passward: passwordController.text,
                                );
                              }
                            },
                          ),
                          fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an Account ?",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 91, 87, 87),
                                  fontSize: 18.0),
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
                                style:
                                    TextStyle(color: mainColor, fontSize: 18.0),
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
        ));
      },
    );
  }
}
