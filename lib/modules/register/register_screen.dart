import 'package:flutter/material.dart';
import 'package:myclinic/modules/register/register_as_doctor.dart';
import 'package:myclinic/modules/register/register_as_patient.dart';
import 'package:myclinic/shared/components/components.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithArrowBack(context: context,title: 'انشأ حساب',),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  firstButton(function: (){ navigateTo(context, RegisterAsDoctor());}, text: 'كـ طبيب'),
                  SizedBox(height: 30,),
                  firstButton(function: (){ navigateTo(context, RegisterAsPatient());}, text: 'كـ مريض / زائر '),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
