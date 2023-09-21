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
          // if (state is LoginErrorState) {
          //   showToast(text: state.error, state: ToastStates.ERROR);
          // }
          // if (state is LoginSuccessState) {
          //   CacheHelper.saveData(
          //     key: 'uId',
          //     value: state.uId,
          //   )?.then((value) {
          //     navigateAndFinish(
          //       context,
          //       SocialLayout(),
          //     );
          //   });
          // }
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
                      fit: BoxFit.cover)),
              child:  Container(
                width: double.infinity,
                height: 300.0,
                decoration: BoxDecoration(
                  color: Colors.white,
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
//Scaffold(
//             appBar: AppBar(),
//             body: Center(
//               child: SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Form(
//                     key: formKey,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           'LOGIN',
//                           style:
//                               Theme.of(context).textTheme.headline4?.copyWith(
//                                     color: Colors.black,
//                                   ),
//                         ),
//                         Text(
//                           'Login now to communicate with friends',
//                           style:
//                               Theme.of(context).textTheme.bodyText1?.copyWith(
//                                     color: Colors.grey,
//                                   ),
//                         ),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         defaultFormField(
//                           controller: emailController,
//                           type: TextInputType.emailAddress,
//                           validate: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'please enter your email address';
//                             }
//                           },
//                           label: 'Email Address',
//                           prefixIcon: Icons.email_outlined,
//                         ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         defaultFormField(
//                           controller: passwordController,
//                           type: TextInputType.visiblePassword,
//                           suffixIcon: LoginCubit.get(context).suffix,
//                           validate: (String? value) {
//                             if (value!.isEmpty) {
//                               return 'password is too short';
//                             }
//                           },
//                           onSubmit: (value) {
//                             if (formKey.currentState!.validate()) {
//                               // LoginCubit.get(context).userLogin(
//                               //   email: emailController.text,
//                               //   password: passwordController.text,
//                               // );
//                             }
//                           },
//                           isPassword: LoginCubit.get(context).isPassword,
//                           suffixPressed: () {
//                             LoginCubit.get(context)
//                                 .changePasswordVisibility();
//                           },
//                           label: 'Password',
//                           prefixIcon: Icons.lock_outline,
//                         ),
//                         SizedBox(
//                           height: 30.0,
//                         ),
//                         ConditionalBuilder(
//                           condition: state is! LoginLoadingState,
//                           builder: (context) => firstButton(
//                             function: () {
//                               if (formKey.currentState!.validate()) {
//                                 LoginCubit.get(context).userLogin(
//                                   email: emailController.text,
//                                   password: passwordController.text,
//                                 );
//                               }
//                             },
//                             text: 'login',
//                             isUpperCase: true,
//                           ),
//                           fallback: (context) =>
//                               Center(child: CircularProgressIndicator()),
//                         ),
//                         SizedBox(
//                           height: 15.0,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Don\'t have an account?',
//                             ),
//                             firstButton(
//                               function: () {
//                                 // navigateTo(
//                                 //   context,
//                                 //   SocialRegisterScreen(),
//                                 // );
//                               },
//                               text: 'register',
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           );
