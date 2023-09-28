import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

class DoctorLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        var cubit = DoctorCubit.get(context);
        return Scaffold(
          appBar:appBarWithIcon(context: context, title: cubit.titles[cubit.currentIndex],patient: false),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNav(index);
              },
              iconSize: 30.0,
              unselectedFontSize: 16.0,
              selectedFontSize: 17.0,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.medical_information),label: 'الكشوفات'),
                BottomNavigationBarItem(icon: Icon(Icons.medical_information_outlined),label: 'الاعادات'),
                BottomNavigationBarItem(icon: Icon(Icons.person_search),label: 'البحث'),
                BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: 'احجز الأن'),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'البروفايل')
              ]),
        );
      },
    );
  }
}