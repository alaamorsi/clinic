// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:myclinic/shared/components/components.dart';
//
// // ignore: must_be_immutable
// class FinishProfile extends StatelessWidget {
//
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<DocotorCubit,DoctorStates>(
//         listener: (context,state) {},
//         builder: (context,state) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             appBar: appBarWithArrowBack(context: context,title: 'استكمال البيانات',),
//             body: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Form(
//                 key: formKey,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 60.0),
//                         child: firstButton(function: (){}, text: 'حفظ البيانات'),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         }
//     );
//   }
// }
