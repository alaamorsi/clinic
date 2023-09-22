import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/modules/login/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

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
      print(value.user?.email);
      print(value.user?.uid);
      if(FirebaseAuth.instance.currentUser!.emailVerified)
        {
          emit(LoginSuccessState(value.user!.uid));
        }
      // emit(LoginSuccessState(value.user!.uid));
      if (state is LoginSuccessState) {
        showToast(text: 'تم تسجيل الدخول بنجاح', state: ToastStates.SUCCESS);
      }
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
}
