import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/layout/doctor_layout.dart';
import 'package:h_care/layout/user_layout.dart';
import 'package:h_care/modules/login/login_screen.dart';

import 'package:h_care/modules/splash_screen/splash_screen.dart';
import 'package:h_care/shared/bloc_observer.dart';

import 'package:h_care/shared/cubit/doctor_cubit/cubit.dart';
import 'package:h_care/shared/cubit/login_cubit/cubit.dart';

import 'package:h_care/shared/cubit/user_cubit/cubit.dart';
import 'package:h_care/shared/network/local/cache_helper.dart';
import 'package:h_care/shared/network/remote/dio.dart';
import 'package:h_care/shared/style/theme.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocOverrides.runZoned(
    () {
      LoginCubit();
    },
    blocObserver: MyBlocObserver(),
  );
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),  
        ),
        BlocProvider(
          create: (context) => UserCubit()..getHospital()..getDepartmentModel()..getBed(),
        ),
        BlocProvider(
          create: (context) => DoctorCubit(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        home:  const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
