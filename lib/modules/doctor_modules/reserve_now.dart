import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';

class ReserveNowScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        return Container(
          color: Colors.white,
        );
      },
    );
  }
}