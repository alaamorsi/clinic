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
  var dateController = TextEditingController();
  var resTypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        return BlocConsumer<DoctorCubit,DoctorStates>(
          listener: (context,state) {},
          builder:(context,state){
            // var cubit = DoctorCubit.get(context);
            return Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 30.0),
                      child: Column(
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                            formFieldWithoutIcons(
                                controller: nameController,
                                type: TextInputType.name,
                                validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل الأسم بشكل صحيح';}return null;}),
                            SizedBox(width: 10.0,),
                            label('اسم المريض'),
                          ]),
                          SizedBox(height: 20.0,),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                            formFieldWithoutIcons(
                                controller: ageController,
                                type: TextInputType.number,
                                validate: (String? value) {if (value!.isEmpty) {return 'رجاءً ادخل العمر او السن';}return null;}),
                            SizedBox(width: 10.0,),
                            label('سن المريض'),
                          ]),
                          SizedBox(height: 20.0,),
                          Row(mainAxisAlignment: MainAxisAlignment.end,children: [
                            formFieldWithoutIcons(
                                controller: dateController,
                                type: TextInputType.datetime,
                                validate: (String? value) {if (value!.isEmpty) {return 'برجاء ادخال الموعد بشكل صحيح ';}return null;}),
                            SizedBox(width: 10.0,),
                            label('موعد الحجز'),
                          ]),
                          SizedBox(height: 20.0,),
                          Row(
                            children: [
                              Expanded(child: goodButton(function: (){}, text: 'اعادة')),
                              SizedBox(width: 10.0),
                              Expanded(child: goodButton(function: (){}, text: 'كشف')),
                            ]
                          ),
                          SizedBox(height: 20.0,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: goodButton(function: (){
                              if (formKey.currentState!.validate()) {}
                            }, text: 'تأكيد الحجز'),
                          ),
                        ]
                      ),
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
                ),
              ),
            );
          },
        );
      },
    );
  }
}