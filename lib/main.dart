import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/firebase_options.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/patient_layout/cubit/cubit.dart';
import 'package:myclinic/modules/login/login_screen1.dart';
import 'package:myclinic/shared/components/bloc_observer.dart';
import 'package:myclinic/shared/components/cache_helper.dart';
import 'package:myclinic/shared/components/cubit/cubit.dart';
import 'package:myclinic/shared/components/cubit/states.dart';

void main() async{
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  // uId = CacheHelper.getData(key: 'uId');
  // if(uId != null)
  // {
  //   widget = Layout();
  // } else {
  //   widget = LoginScreen();
  // }
  // Widget? widget;









  runApp( MyApp(
    // startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {

  // final Widget? startWidget;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AppCubit()),
        BlocProvider(
            create: (BuildContext context) => DoctorCubit()),
        BlocProvider(
            create: (BuildContext context) => PatientCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: LoginScreen(),
          );
        },
      ),
    );
  }
}