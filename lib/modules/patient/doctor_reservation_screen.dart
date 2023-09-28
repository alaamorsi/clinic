import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myclinic/layout/patient_layout/cubit/cubit.dart';
import 'package:myclinic/layout/patient_layout/cubit/states.dart';
import 'package:myclinic/modules/patient/doctor_reservation_result.dart';
import 'package:myclinic/shared/components/components.dart';

class DoctorReservationScreen extends StatelessWidget {
  @override
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var dayController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool checkK = true;

  Widget build(BuildContext context) {
    var cubit = PatientCubit.get(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<PatientCubit, PatientStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'تأكيد الحجز',
              style: TextStyle(fontSize: 24.0),
            ),
            centerTitle: true,
            backgroundColor: Colors.blueGrey,
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty || value.length < 3)
                            return 'رجاءً ادخل الأسم بشكل صحيح';
                        },
                        label: 'الأسم',
                        prefixIcon: Icons.person),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                        controller: ageController,
                        type: TextInputType.number,
                        validate: (String? value) {
                          if (value!.isEmpty ||
                              value.startsWith('0') ||
                              value.length > 2)
                            return 'رجاءً ادخل العر بشكل صحيح';
                        },
                        label: 'العمر',
                        prefixIcon: Icons.timelapse_rounded),
                    SizedBox(
                      height: 20.0,
                    ),
                    defaultFormField(
                        controller: dayController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty || value.length > 8)
                            return 'رجاءً ادخل اليوم بشكل صحيح';
                        },
                        label: 'اليوم',
                        prefixIcon: Icons.view_day_rounded),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            checkK = false;
                            cubit.isKashf(checkK);
                          },
                          child: Container(
                            width: screenWidth / 3,
                            height: 50.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                              color: cubit.iskashf
                                  ? Color.fromRGBO(14, 213, 213, 15)
                                  : Colors.limeAccent,
                            ),
                            child: Center(
                                child: Text(
                              'إعادة',
                              style: TextStyle(fontSize: 20.0),
                            )),
                          ),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            checkK = true;
                            cubit.isKashf(checkK);
                          },
                          child: Container(
                            width: screenWidth / 3,
                            height: 50.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(10.0),
                              color: cubit.iskashf
                                  ? Colors.limeAccent
                                  : Color.fromRGBO(14, 213, 213, 15),
                            ),
                            child: Center(
                                child: Text(
                              'كشف',
                              style: TextStyle(fontSize: 20.0),
                            )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      width: double.infinity,
                      height: 50.0,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(25.0),
                          color: Colors.tealAccent),
                      child: TextButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            navigateTo(context, DoctorReservationResult());
                          }
                        },
                        child: Text(
                          'تأكيد الحجز',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
