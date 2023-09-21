import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/modules/patient_modules/notifications.dart';
import 'package:myclinic/modules/register/cubit/cubit.dart';
import 'package:myclinic/modules/register/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

// ignore: must_be_immutable
class RegisterAsPatient extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )=> RegisterCubit(),
      child: BlocConsumer<RegisterCubit,RegisterStates>(
        listener: (context,state) {
          // if (state is CreatePatientSuccessState)
          //   {
          //     navigateAndFinish(context, PatientLayout());
          //   }
        },
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBarWithArrowBack(context: context,title: 'انشأ حساب طبيب ',),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      defaultFormField(
                          controller: nameController, type: TextInputType.name,
                          validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل الأسم بشكل صحيح';}
                          return null;},
                          label: 'الأسم', prefixIcon: Icons.person),
                      SizedBox(height: 20.0,),
                      defaultFormField(
                          controller: emailController, type: TextInputType.emailAddress,
                          validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل البريد الالكتروني الصحيح';}
                          return null;},
                          label: 'البريد الألكتروني', prefixIcon: Icons.email),
                      SizedBox(height: 20.0,),
                      defaultFormField(
                          controller: phoneController, type: TextInputType.number,
                          validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل رقم الهاتف بشكل صحيح';}
                          return null;},
                          label: 'رقم الهاتف', prefixIcon: Icons.phone),
                      SizedBox(height: 20.0,),
                      defaultFormField(
                          controller: addressController, type: TextInputType.streetAddress,
                          validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل العنوان بشكل صحيح';}
                          return null;},
                          label: 'العنوان', prefixIcon: Icons.location_pin),
                      SizedBox(height: 20.0,),
                      defaultFormField(
                          controller: passwordController, type: TextInputType.text,
                          validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل الباسورد الصحيح';}
                          return null;},
                          suffixIcon: RegisterCubit.get(context).suffixIcon,
                          label: 'كلمة المرور',
                          prefixIcon: Icons.lock_outline,
                          isPassword: RegisterCubit.get(context).isPassword,
                          suffixPressed: () {
                            RegisterCubit.get(context).changePasswordVisibility();
                          }),
                      SizedBox(height: 20,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 60.0),
                        child: firstButton(function: (){
                          if (formKey.currentState!.validate()) {
                            RegisterCubit.get(context).PatientRegister(
                              email: emailController.text,
                              password: passwordController.text,
                              name: nameController.text,
                              phone: phoneController.text,
                              address: addressController.text,
                            );
                          }
                        }, text: 'انشاء الحساب'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      )
    );
  }
}