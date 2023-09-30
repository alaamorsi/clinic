import 'package:flutter/material.dart';

import '../../shared/components/components.dart';

class PatientNotificationsScreen extends StatelessWidget {
  const PatientNotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar:appBarWithArrowBack(context: context, title: 'الاِشعارات'),
    );
  }
}
