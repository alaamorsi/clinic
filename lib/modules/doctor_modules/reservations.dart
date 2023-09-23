import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

class ReservationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        var cubit = DoctorCubit.get(context);
        return ConditionalBuilder(
          condition: true,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  //the first tow buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      MaterialButton(
                        onPressed: (){
                          cubit.changeReservesButton();
                        },
                        child: Text('الأعادات'),
                        color: cubit.resIsSelect?defaultColor:Colors.white,
                        textColor: Colors.black,
                        clipBehavior: Clip.antiAlias,
                        shape: Border.all(color: Colors.grey ,strokeAlign: BorderSide.strokeAlignCenter),
                      ),
                      SizedBox(width: 20.0,),
                      MaterialButton(
                        onPressed: (){
                          cubit.changeReservesButton();
                        },
                        child: Text('الكشوفات'),
                        color: cubit.resIsSelect?Colors.white:defaultColor,
                        textColor: Colors.black,
                        shape: Border.all(color: Colors.grey ,strokeAlign: BorderSide.strokeAlignCenter),
                      ),
                    ]
                  ),
                  //the Reservation list
                  if(cubit.resIsSelect)
                    ReReserveCard(),
                  if(!cubit.resIsSelect)
                    ReserveCard(),
                ]
              ),
            );
          },
          fallback: (BuildContext context)=>Text('لا توجد حجوزات',style: TextStyle(fontSize: 30.0,),),
        );
      },
    );
  }
  Widget ReserveCard()=>Container(
    height: 150.0,width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey)
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

      ]
    ),
  );
  Widget ReReserveCard()=>Container(
    height: 150.0,width: double.infinity,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(color: Colors.grey)
    ),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

        ]
    ),
  );
}