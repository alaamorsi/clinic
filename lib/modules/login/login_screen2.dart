import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/doctor_layout/doctor_layout.dart';
import 'package:myclinic/modules/login/cubit/cubit.dart';
import 'package:myclinic/modules/login/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

import '../../shared/components/cache_helper.dart';

// ignore: must_be_immutable
class LoginScreen2 extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(text: 'البريد الالكتروني او كلمة المرور غير صحيح', state: ToastStates.ERROR);
          }
          if (state is LoginSuccessState && FirebaseAuth.instance.currentUser!.emailVerified)
            {
              CacheHelper.saveData(
                key: 'uid',
                value: state.uId,
              )!.then((value) {
                navigateAndFinish(context,DoctorLayout());
              });
            }
          if(!FirebaseAuth.instance.currentUser!.emailVerified){
            showToast(text: 'قم بتأكيد البريد الألكتروني', state: ToastStates.ERROR);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBarWithArrowBack(context: context, title: 'تسجيل الدخول'),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    defaultFormField(
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'رجاءً ادخل البريد الالكتروني الصحيح';
                          }
                          return null;
                        },
                        label: 'البريد الالكتروني',
                        prefixIcon: Icons.email_outlined),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'رجاءً ادخل كلمة المرور الصحيحة';
                        }
                        return null;
                      },
                      suffixIcon: LoginCubit.get(context).suffixIcon,
                      label: 'كلمة المرور',
                      prefixIcon: Icons.lock_outline,
                      isPassword: LoginCubit.get(context).isPassword,
                      suffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => firstButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              LoginCubit.get(context).userLogin(
                                email: emailController.text,
                                password: passwordController.text,
                              );
                            }
                          },
                          text: 'تسجيل الدخول',
                          isUpperCase: true,
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
