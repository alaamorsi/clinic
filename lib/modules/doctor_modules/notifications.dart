import 'package:flutter/material.dart';
import 'package:myclinic/shared/components/components.dart';

class DoctorNotificationsScreen extends StatelessWidget {
  const DoctorNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWithArrowBack(context: context, title: 'الأشعارات'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Container(),
        ),
      ),
    );
  }
}
