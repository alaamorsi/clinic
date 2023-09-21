import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/modules/login/cubit/cubit.dart';
import 'package:myclinic/modules/login/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

class LoginScreen2 extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context )=> LoginCubit(),
      child: BlocConsumer<LoginCubit , LoginStates>(
        listener: (context , state ){},
        builder: (context , state ){
          return Scaffold(
            appBar: AppBar(
              title: Text(
                'تسجيل الدخول',
                style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Colors.white12,
              elevation: 0.0,
              leading: IconButton(onPressed: (){Navigator.pop(context);},icon: Icon(Icons.arrow_back,color: Colors.black,),),
            ),
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
                        validate: (String value) {
                          if (value.isEmpty) {
                            return 'رجاءً ادخل البريد الالكتروني الصحيح';
                          }
                        },
                        label: 'البريد الالكتروني',
                        prefixIcon: Icons.email_outlined),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validate: (String value) {
                        if (value.isEmpty) {
                          return 'رجاءً ادخل كلمة المرور الصحيحة';
                        }
                      },
                      suffixIcon: LoginCubit.get(context).suffixIcon,
                      label: 'كلمة المرور',
                      prefixIcon: Icons.lock_outline,
                      isPassword: LoginCubit.get(context).isPassword,
                      suffixPressed: () {
                        LoginCubit.get(context).changePasswordVisibility();
                      },
                    ),
                    SizedBox(height: 20.0,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60.0),
                      child: firstButton(function: (){}, text: 'تسجيل الدخول'),
                    )
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
