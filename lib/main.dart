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

///////////////// main function ///////////////////////
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  ////////// BloC observer //////////////////
  BlocOverrides.runZoned(
    () {
      LoginCubit();
      UserCubit();
      DoctorCubit();
    },
    blocObserver: MyBlocObserver(),
  );
  /////// object of Dio ////////////////////
  DioHelper.init();
  ////////// object of Shared preferences ///////////////////
  await CacheHelper.init();
  ////////////// run App /////////////////////////
  runApp(const MyApp());
}

///////////////////////////// The Main Class of App //////////////////////////////////
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ////////////////////////// providers of all BloC of App //////////////////////////////////
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => UserCubit()
            ..getHospital()
            ..getDepartmentModel()
            ..getBed(),
        ),
        BlocProvider(
          create: (context) => DoctorCubit(),
        ),
      ],
      child: MaterialApp(
        theme: lightTheme,
        home:
            const SplashScreen(), ////////////////////start Screen of App //////////////////////
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
