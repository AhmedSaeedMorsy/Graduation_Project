import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:h_care/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super( AppInitState());

}