import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myclinic/firebase_options.dart';

void main() async{
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: TextButton(onPressed: (){},child: Text('احجزلي نااااااااااو',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),)),
      ),
    );
  }
}