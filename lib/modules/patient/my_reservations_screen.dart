import 'package:flutter/material.dart';
import 'package:myclinic/shared/components/components.dart';

class MyReservationsScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ListView.separated(
                shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context , index )=> buildReservationsItems(),
                  separatorBuilder: (context , index ) => SizedBox(height: 10.0,),
                  itemCount: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buildReservationsItems() => Container(
    width: double.infinity,
    height: 250.0,
    decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
            color: Colors.black
        )
    ),
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text('اسم المريض : علاء مرسي فتحي مرسي',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          Text('عيادة الدكتور : جميل جمال ابو الجمل ( بطنه )',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          Text('نوع الحجز : كشف',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          Text('المعاد : يوم السبت - 2023 / 10 / 1',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          Text('دورك : 13',style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
          Spacer(),
          Center(
            child: Container(
                width: 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextButton(onPressed: (){}, child: Text('إلغاء الحجز',style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold),))),
          )
        ],
      ),
    ),
  );
}
