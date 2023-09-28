import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

// ignore: must_be_immutable
class ReserveNowScreen extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var dayController = TextEditingController();
  var resTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        return BlocConsumer<DoctorCubit,DoctorStates>(
          listener: (context,state) {},
          builder:(context,state){
            var cubit = DoctorCubit.get(context);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
              child: Container(
                child: Column(
                  children: [
                    Row(children: [
                      label('اسم المريض'),
                      formFieldWithoutIcons(
                          controller: nameController,
                          type: TextInputType.name,
                          validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل الأسم بشكل صحيح';}return null;})]),
                  ]
                ),
                decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(color: Colors.grey),
                      bottom: BorderSide(color: Colors.grey),
                      right: BorderSide(color: Colors.grey),
                      left: BorderSide(color: Colors.grey)),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        );
      },
    );
  }
}