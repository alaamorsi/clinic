import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/models/doctor_model.dart';
import 'package:myclinic/models/patient_model.dart';
import 'package:myclinic/modules/register/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  void DoctorRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
    ).then((value)
    {
      DoctorCreate(name: name, email: email, phone: phone, uid: value.user!.uid);
      if (state is RegisterSuccessState) {
        showToast(text: 'تم التسجيل بنجاح', state: ToastStates.SUCCESS);
      }
    }
    ).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    }
    );
  }

  void DoctorCreate({
    required String name,
    required String email,
    required String phone,
    required String uid,
  })
  {
    DoctorModel model = DoctorModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      isEmailVerified: false,
      image: 'https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-600w-1768126784.jpg',
      address: '',
      experience: '',
      specialty: '',
      dPrice: '',
      rPrice: '',
      workDays: '',
      workHours: '',
    );

    FirebaseFirestore.instance.collection('doctors').doc(uid).set(model.toMap())
        .then((value){
      emit(CreateDoctorSuccessState());
    }).catchError((error){
      emit(CreateDoctorErrorState(error));
    });
  }

  void PatientRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
  })
  {
    emit(RegisterLoadingState());
    FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    ).then((value)
    {
      PatientCreate(name: name, email: email, phone: phone, uid: value.user!.uid);
      if (state is RegisterSuccessState) {
        showToast(text: 'تم التسجيل بنجاح', state: ToastStates.SUCCESS);
      }
    }
    ).catchError((error)
    {
      emit(RegisterErrorState(error.toString()));
    }
    );
  }

  void PatientCreate({
    required String name,
    required String email,
    required String phone,
    required String uid,
  })
  {
    PatientModel model = PatientModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      isEmailVerified: false,
      image: 'https://www.shutterstock.com/image-photo/young-handsome-man-beard-wearing-600w-1768126784.jpg',
      address: '',
    );

    FirebaseFirestore.instance.collection('doctors').doc(uid).set(model.toMap())
        .then((value){
      emit(CreateDoctorSuccessState());
    }).catchError((error){
      emit(CreateDoctorErrorState(error));
    });
  }

  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword = true;

  void changePasswordVisibility()
  {
    isPassword = !isPassword;
    suffixIcon = isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined ;
    emit(RegisterChangePasswordVisibilityState());
  }
}