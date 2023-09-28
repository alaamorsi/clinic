import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/patient_layout/cubit/cubit.dart';
import 'package:myclinic/layout/patient_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

class PatientLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit , PatientStates>(
      listener: (context , state ){},
      builder: (context , state ){
        var cubit = PatientCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(cubit.titles[cubit.currentIndex],style: TextStyle(fontSize: 24.0),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.blueGrey,
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.tealAccent,
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            iconSize: 35.0,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.badge_rounded), label: 'الأطباء'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_search), label: 'البحث عن الأطباء'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt), label: 'حجوزاتي'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: 'الصفحة الشخصية'),
            ],
          ),
        );
      },
    );
  }
}
