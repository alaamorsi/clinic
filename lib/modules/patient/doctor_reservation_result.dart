import 'package:flutter/material.dart';
import 'package:myclinic/layout/patient_layout/patient_layoyt.dart';
import 'package:myclinic/modules/patient/doctors_list_screen.dart';
import 'package:myclinic/shared/components/components.dart';

class DoctorReservationResult extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'نتيجة الحجز',
          style: TextStyle(fontSize: 24.0),
        ),
        leading: IconButton(onPressed: () {
          navigateAndFinish(context, PatientLayout());
        }, icon: Icon(Icons.arrow_back_rounded),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              height: screenHeight / 2,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      width: double.infinity,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                          'اسم المريض : علاء مرسي فتحي مرسي', style: TextStyle(
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      width: 150.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('العمر : 21 عام', style: TextStyle(
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      width: 250.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Text('2023 / 10 / 1',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Spacer(),
                            Text('-',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                            Spacer(),
                            Text('موعد الحجز : الجمعة',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      width: 150.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('دورك : 3', style: TextStyle(
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    SizedBox(height: 10.0,),
                    Container(
                      alignment: AlignmentDirectional.centerEnd,
                      width: 150.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text('كشف', style: TextStyle(
                            fontWeight: FontWeight.bold),),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Center(
                        child: Container(
                          width: 200.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent[400],
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: Colors.black
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('✔ تم الحجز بنجاح',
                                style: TextStyle(fontSize: 20.0,),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
