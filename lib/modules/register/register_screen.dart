import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/modules/register/cubit/cubit.dart';
import 'package:myclinic/modules/register/cubit/states.dart';
import 'package:myclinic/modules/register/register_as_doctor.dart';
import 'package:myclinic/modules/register/register_as_patient.dart';
import 'package:myclinic/shared/components/components.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state) {  },
        builder: (context,state) {
          return Scaffold(
            appBar: appBarWithArrowBack(context: context,title: 'انشأ حساب',),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    firstButton(function: (){ navigateTo(context, RegisterAsDoctor());}, text: 'كـ طبيب'),
                    SizedBox(height: 20.0,),
                    firstButton(function: (){ navigateTo(context, RegisterAsPatient());}, text: 'كـ مريض / زائر '),
                  ]
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
