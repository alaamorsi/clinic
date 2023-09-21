import 'package:flutter/material.dart';
import 'package:myclinic/modules/patient_modules/notifications.dart';
import 'package:myclinic/shared/components/components.dart';

// ignore: must_be_immutable
class RegisterAsDoctor extends StatelessWidget {

  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var specialController = TextEditingController();
  var phoneController = TextEditingController();
  var experienceController = TextEditingController();
  var addressController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithArrowBack(context: context,title: 'انشأ حساب طبيب ',),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              defaultFormField(
                  controller: nameController, type: TextInputType.name,
                  validate: (String value) {if (value.isEmpty) {return 'name is too short';}},
                  label: 'الأسم', prefixIcon: Icons.person),
              SizedBox(height: 20,),
              defaultFormField(
                  controller: specialController, type: TextInputType.text,
                  validate: (String value) {if (value.isEmpty) {return 'your special must not be empty';}},
                  label: 'أخصائي', prefixIcon: Icons.cable),
              SizedBox(height: 20,),
              defaultFormField(
                  controller: emailController, type: TextInputType.emailAddress,
                  validate: (String value) {if (value.isEmpty) {return 'email must not be empty';}},
                  label: 'البريد الألكتروني', prefixIcon: Icons.email),
              SizedBox(height: 20,),
              defaultFormField(
                  controller: phoneController, type: TextInputType.number,
                  validate: (String value) {if (value.isEmpty) {return 'phone is too short';}},
                  label: 'رقم الهاتف', prefixIcon: Icons.phone),
              SizedBox(height: 20,),
              defaultFormField(
                  controller: experienceController, type: TextInputType.number,
                  validate: (String value) {if (value.isEmpty) {return 'your experience is too short';}},
                  label: 'عدد سنوات الخبرة', prefixIcon: Icons.explicit),
              SizedBox(height: 20,),
              defaultFormField(
                  controller: addressController, type: TextInputType.streetAddress,
                  validate: (String value) {if (value.isEmpty) {return 'your address must not be empty';}},
                  label: 'العنوان', prefixIcon: Icons.location_pin),
              SizedBox(height: 20,),
              defaultFormField(
                  controller: passwordController, type: TextInputType.text,
                  validate: (String value) {if (value.isEmpty) {return 'password is too short';}},
                  label: 'الباسورد', prefixIcon: Icons.lock),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  firstButton(
                      width: 200,height: 40,
                      function: (){navigateTo(context, PatientNotificationsScreen());}, text: 'انشاء الحساب'),
                ],
              )            ],
          ),
        ),
      ),
    );
  }
}
