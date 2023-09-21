import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';

class DoctorCubit extends Cubit<DoctorStates> {

  DoctorCubit() : super(DoctorInitialStates());
  static DoctorCubit get(context) => BlocProvider.of(context);
}