import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/doctor_layout/cubit/cubit.dart';
import 'package:myclinic/layout/doctor_layout/cubit/states.dart';
import 'package:myclinic/shared/components/components.dart';

import '../../shared/components/cache_helper.dart';
import '../../shared/components/constant.dart';
import '../login/login_screen1.dart';

class ProfileScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DoctorCubit,DoctorStates>(
      listener: (context,state) {},
      builder:(context,state){
        String imUrl='https://img.freepik.com/free-photo/smiling-doctor-with-strethoscope-isolated-grey_651396-974.jpg?size=626&ext=jpg&ga=GA1.1.1147619377.1695562532&semt=sph';
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              //doctor image
              Padding(
                padding: const EdgeInsets.only(top: 30.0,right: 10.0,left: 10.0,bottom: 10.0),
                child: Container(
                  height: 280.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                      image: DecorationImage(
                          image: NetworkImage(imUrl),
                          fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Row(children: [
                dataLabel('الدكتور', 'عبدالرحمن المحمدي'),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('أخصائي', 'باطنه'),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('سنوات الخبرة', '7 سنوات'),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('ايام العمل', 'السبت -الاحد -الثلاثاء'),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('مواعيد العمل', 'من 5 م حتى 9 م '),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('سعر الإعادة', '100 جـ'),
                SizedBox(width: 10,),
                dataLabel('سعر الكشف', '250 جـ'),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('رقم الهاتف', '01032343550'),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('العنوان', '      '),
              ],mainAxisAlignment:MainAxisAlignment.end,
              ),
              SizedBox(height: 10.0,),
              Row(children: [
                dataLabel('البريد الالكتروني', 'om.dr.omer2020445@gmail.com'),
              ],mainAxisAlignment:MainAxisAlignment.end,
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
                    DoctorCubit.get(context).currentIndex = 0;
                    navigateAndFinish(context, LoginScreen());
                  }, child: Text('تسجيل خروج',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),), ),
                ),
              ),
            ]
          ),
        );
      },
    );
  }
}