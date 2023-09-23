import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/patient_layout/cubit/states.dart';
import 'package:myclinic/models/patient_model.dart';
import 'package:myclinic/modules/patient/doctors_list_screen.dart';
import 'package:myclinic/modules/patient/my_reservations_screen.dart';
import 'package:myclinic/modules/patient/patient_profile_screen.dart';
import 'package:myclinic/shared/components/constant.dart';

class PatientCubit extends Cubit<PatientStates> {

  PatientCubit() : super(PatientInitialStates());
  static PatientCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> screens = [
    DoctorsListScreen(),
    MyReservationsScreen(),
    PatientProfileScreen(),
  ];
  List<String> titles = [
    'الأطباء',
    'حجوزاتي',
    'الصفحة الشخصية',
  ];
  void changeBottomNav(int index) {
      currentIndex = index;
      emit(ChangeBottomNavState());
  }

  PatientModel? patientModel;
  void getUserData() {
    emit(GetPatientDataLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      patientModel = PatientModel.fromJson(value.data()!);
      emit(GetPatientDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(GetPatientDataErrorState(error.toString()));
    });
  }

}