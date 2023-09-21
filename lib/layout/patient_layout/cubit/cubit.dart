import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/patient_layout/cubit/states.dart';

class PatientCubit extends Cubit<PatientStates> {

  PatientCubit() : super(PatientInitialStates());
  static PatientCubit get(context) => BlocProvider.of(context);
}