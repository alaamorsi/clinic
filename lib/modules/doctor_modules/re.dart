import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

class ReScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        var cubit = DoctorCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 20.0),
          child: ConditionalBuilder(
            condition: true,
            builder: (BuildContext context) {
              return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index)=>ReservedCard((index+1).toString(), 'الاسم', 'العمر'),
                separatorBuilder: (BuildContext context, int index)=>SizedBox(height: 20,),
                itemCount: 10,
              );
            },
            fallback: (BuildContext context)=>Center(
              child: Row(children: [
                Icon(Icons.mood_bad,color: Colors.grey,size: 30.0,),
                SizedBox(width: 10.0,),
                Text('لا توجد اعادات',style: TextStyle(fontSize: 30.0,color: Colors.grey))]
                ,mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
