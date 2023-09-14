import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Center(child: TextButton(onPressed: (){
          Container(
            color: Colors.red,
            width: double.infinity,
            child: Text('حجزتلك ناااااااااااو',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),
          );
        },child: Text('احجزلي نااااااااااو',style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),),)),
      ),
    );
  }
}