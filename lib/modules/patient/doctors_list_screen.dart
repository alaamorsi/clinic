import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:myclinic/layout/patient_layout/cubit/cubit.dart';
import 'package:myclinic/layout/patient_layout/cubit/states.dart';
import 'package:myclinic/modules/patient/doctor_reservation_details_screen.dart';
import 'package:myclinic/shared/components/components.dart';

class DoctorsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientCubit, PatientStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                ConditionalBuilder(
                  condition: true,
                  builder: (context) => ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => buildDoctorItem(context),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount: 15),
                  fallback: (context) =>
                      Center(child: CircularProgressIndicator()),
                ),
              ],
            ),
          );
        });
  }

  Widget buildDoctorItem(context) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: InkWell(
          highlightColor: Colors.tealAccent,
          onTap: () {
            navigateTo(context, DoctorReservationDetailsScreen());
          },
          child: Container(
            width: double.infinity,
            height: 250.0,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(20.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 150.0,
                  height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25.0),
                          bottomLeft: Radius.circular(25.0)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/clinic.jpg'),
                      )),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // الاسم
                        Expanded(
                            child: Text(
                          'د. جميل جمال ابو الجمل',
                          style: TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.right,
                        )),
                        // التخصص
                        Expanded(
                            child: Text(
                          'أخصائي: بطنه',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.right,
                        )),
                        // الخبرة
                        Expanded(
                            child: Text(
                              'خبرة: 10 سنوات',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.right,
                            )),
                        // المكان
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    'الفيوم - سيلا - امام المدينة',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ],
                                crossAxisAlignment: CrossAxisAlignment.end,
                              ),
                            ),
                            Icon(Icons.location_on_sharp),
                          ],
                        )),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
