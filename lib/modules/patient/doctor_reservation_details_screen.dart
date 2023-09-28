import 'package:flutter/material.dart';
import 'package:myclinic/modules/patient/doctor_reservation_screen.dart';
import 'package:myclinic/shared/components/components.dart';

class DoctorReservationDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Stack(
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 400.0),
                      child: Image(
                        image: AssetImage('assets/clinic.jpg'),
                        width: double.infinity,
                        height: screenHeight / 2,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: screenHeight / 2 + 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(50.0),
                            topLeft: Radius.circular(50.0),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'د. جميل جمال ابو الجمل',
                              style: TextStyle(
                                  fontSize: 14.0, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              'أخصائي: بطنه',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              'خبرة: 10 سنوات',
                              style: TextStyle(
                                fontSize: 14.0,
                              ),
                              textAlign: TextAlign.right,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        'الفيوم - سيلا - امام المدينة',
                                        style: TextStyle(
                                          fontSize: 14.0,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ],
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                  ),
                                ),
                                Icon(Icons.location_on_sharp),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'مواعيد العمل',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: screenWidth / 2.3,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        'من : 6 مساءً - حتى : 12 صباحاً',
                                        style: TextStyle(fontSize: 12.0),
                                        textAlign: TextAlign.right,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'أيام العمل',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Container(
                                      width: screenWidth / 2.7,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        'من : الأحد - إلي : الخميس',
                                        style: TextStyle(fontSize: 12.0),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'الأسعار',
                                  style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      width: screenWidth / 2.7,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        'الإعادة : 50 جـ',
                                        style: TextStyle(fontSize: 12.0),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.0,
                                    ),
                                    Spacer(),
                                    Container(
                                      width: screenWidth / 2.7,
                                      height: 30.0,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: Text(
                                        'الكشف : 100 جـ',
                                        style: TextStyle(fontSize: 12.0),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(25.0),
                                  color: Colors.tealAccent),
                              child: TextButton(
                                onPressed: () {
                                  navigateTo(context, DoctorReservationScreen());
                                },
                                child: Text(
                                  'احجز الآن',
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
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      size: 40.0,
                    ),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
