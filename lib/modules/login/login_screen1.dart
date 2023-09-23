// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/modules/login/cubit/cubit.dart';
import 'package:myclinic/modules/login/login_screen2.dart';
import 'package:myclinic/modules/login/cubit/states.dart';
import 'package:myclinic/modules/register/register_screen.dart';
import 'package:myclinic/shared/components/components.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              alignment: Alignment.bottomCenter,
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/clinic.jpg'),
                      fit: BoxFit.fitHeight)),
              child:  Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white54,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50.0),
                    topLeft: Radius.circular(50.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      firstButton(function: (){navigateTo(context, LoginScreen2());}, text: 'تسجيل الدخول'),
                      SizedBox(height: 10.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(onPressed: (){
                            navigateTo(context, RegisterScreen());
                          }, child: Text('إنشاء حساب',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.red))),
                          SizedBox(width: 10.0,),
                          Text('ليس لديك حساب ؟',style: TextStyle(fontSize: 16.0),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}