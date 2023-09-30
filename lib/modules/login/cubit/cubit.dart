import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/modules/login/cubit/states.dart';
import 'package:myclinic/shared/components/cache_helper.dart';
import 'package:myclinic/shared/components/components.dart';
import 'package:myclinic/shared/components/constant.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: email,
      password: password,
    )
        .then((value) {
      print(value.user!.email);
      print(value.user!.uid);
      checkUser(value.user!.uid);
    }).catchError((error) {
      emit(LoginErrorState(error.toString()));
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffixIcon =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;

    emit(ChangePasswordVisibilityState());
  }

  //to check user is doctor or patient
  void checkUser(String uId) async{
    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('doctors').get().then((value) {
      value.docs.forEach((doctor) {
        if (doctor['uid'] == uId) {
          user = 'doctor';
          CacheHelper.saveData(key: 'user', value: 'doctor');
          if (FirebaseAuth.instance.currentUser!.emailVerified){
            emit(LoginSuccessState(uId));
            showToast(text: 'تم تسجيل الدخول بنجاح', state: ToastStates.SUCCESS);
          }
        }
      });
    });

    FirebaseFirestore.instance.collection('patients').get().then((value) {
      value.docs.forEach((patient) {
        if (patient['uid'] == uId) {
          user = 'patient';
          CacheHelper.saveData(key: 'user', value: 'patient');
          if (FirebaseAuth.instance.currentUser!.emailVerified){
            emit(LoginSuccessState(uId));
            showToast(text: 'تم تسجيل الدخول بنجاح', state: ToastStates.SUCCESS);
          }
        }
      });
    });
  }
}
