import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/patient_layout/cubit/cubit.dart';
import 'package:myclinic/layout/patient_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';
import 'package:myclinic/shared/components/constant.dart';

import '../../shared/components/cache_helper.dart';
import '../login/login_screen1.dart';

// ignore: must_be_immutable
class PatientProfileScreen extends StatelessWidget {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit , PatientStates>(
      listener: (context , state ){},
      builder: (context , state ){
        nameController.text = 'علاء مرسي فتحي مرسي';
        phoneController.text = '01150068522';
        addressController.text = 'بجوار مدرسة سيلا الإبتدإية';
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 105.0,
                      backgroundColor: Colors.tealAccent,
                      child: CircleAvatar(
                        radius: 100.0,
                        backgroundImage: AssetImage('assets/me.jpg'),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0,),
                  defaultFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 2) {
                        return 'رجاءً ادخل الأسم بشكل صحيح';
                      }
                    },
                    label: 'الأسم',
                    prefixIcon: Icons.person,
                  ),
                  SizedBox(height: 10.0,),
                  defaultFormField(
                    controller: phoneController,
                    type: TextInputType.number,
                    validate: (String? value) {
                      if (value!.isEmpty || value.length < 11) {
                        return 'رجاءً ادخل رقم الهاتف بشكل صحيح';
                      }
                    },
                    label: 'رقم الهاتف',
                    prefixIcon: Icons.call,
                  ),
                  SizedBox(height: 10.0,),
                  defaultFormField(
                    controller: addressController,
                    type: TextInputType.text,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'رجاءً ادخل العنوان بشكل صحيح';
                      }
                    },
                    label: 'العنوان',
                    prefixIcon: Icons.location_on_sharp,
                  ),
                  SizedBox(height: 10.0,),
                  Center(
                    child: Container(
                      width: 150.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.greenAccent.shade400,
                      ),
                      child: TextButton(onPressed: (){}, child: Text('تعديل',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),), ),
                    ),
                  ),
                  SizedBox(height: 10.0,),
                  Center(
                    child: Container(
                      width: 150.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(25.0),
                        color: Colors.red.shade400,
                      ),
                      child: TextButton(onPressed: (){
                        CacheHelper.removeData(key: 'uid');
                        CacheHelper.removeData(key: 'user');
                        uId ='';
                        user = '';
                        PatientCubit.get(context).currentIndex = 0;
                        navigateAndFinish(context, LoginScreen());
                      }, child: Text('تسجيل خروج',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),), ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
