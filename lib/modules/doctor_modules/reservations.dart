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
                Text('لا توجد حجوزات',style: TextStyle(fontSize: 30.0,color: Colors.grey))]
                ,mainAxisAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        );
      },
    );
  }
}
//the first tow buttons
// Row(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children:[
//       ElevatedButton(
//         onPressed: (){},
//         child: Text('الأعادات',style: TextStyle(color: Colors.black),),
//         style: ButtonStyle(
//           backgroundColor: MaterialStateProperty.resolveWith((states) {
//             if (states.contains(MaterialState.pressed)) {
//               return defaultColor;
//             }
//             return Colors.white;
//           }),
//         ),
//
//       ),
//       SizedBox(width: 20.0,),
//       MaterialButton(
//         onPressed: (){
//           cubit.changeReservesButton();
//         },
//         child: Text('الكشوفات'),
//         color: cubit.resIsSelect?Colors.white:defaultColor,
//         textColor: Colors.black,
//         shape: Border.all(color: Colors.grey ,strokeAlign: BorderSide.strokeAlignCenter),
//       ),
//     ]
// ),
//               AppBar(
//                 leading: Padding(
//                   padding: const EdgeInsets.all(7.0),
//                   child: Container(
//                     decoration: BoxDecoration(
//                     color: defaultColor,
//                     borderRadius: BorderRadius.circular(25.0),
//               ),child: Center(child: Text('1',style: TextStyle(fontSize: 14,color: Colors.black)))),
//                 ),
//                 title: Text(cubit.titles[cubit.currentIndex], style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 28.0),),
//                 actions: [
//                   IconButton(
//                       onPressed: (){
//                         navigateTo(context, DoctorNotificationsScreen());
//                       },
//                       icon: Icon(Icons.notifications,color: Colors.grey,size: iconSize,)
//                   ),
//                 ],
//                 centerTitle: true,
//                 elevation: 5.0,
//                 flexibleSpace: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                   ),
//                 ),
//               );
