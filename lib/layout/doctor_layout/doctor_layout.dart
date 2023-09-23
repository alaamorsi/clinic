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
          appBar: appBarWithIcon(context: context, title: cubit.titles[cubit.currentIndex],patient: false),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNav(index);
              },
              iconSize: 30.0,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.healing),label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.person_search),label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.list_alt),label: ''),
                BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: '')
              ]),
        );
      },
    );
  }
}