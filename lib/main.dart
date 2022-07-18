import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/business-logic/doctor_cubit/cubit.dart';
import 'package:h_care/business-logic/login_cubit/cubit.dart';
import 'package:h_care/business-logic/user_cubit/cubit.dart';
import 'package:h_care/constant/style/theme.dart';
import 'package:h_care/data/local/cache_helper.dart';
import 'package:h_care/data/remote/dio.dart';
import 'package:h_care/presentation/modules/splash_screen/splash_screen.dart';


///////////////// main function ///////////////////////
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  ////////// BloC observer //////////////////
 
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
            ..getBed()
            ..getMedicine()
            ..getAllPrescription(
              email: CacheHelper.getData(key: "userName"),
            ),
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
