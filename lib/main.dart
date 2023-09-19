import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:myclinic/firebase_options.dart';
import 'package:myclinic/shared/components/components.dart';

void main() async{
  // بيتأكد ان كل حاجه هنا في الميثود خلصت و بعدين يتفح الابلكيشن
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

TextEditingController v = TextEditingController();
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: defaultFormField(
                controller: v,
                type: TextInputType.text,
                validate: (){},
                label: 'الأسم',
                prefixIcon: Icons.person,),
          ),
        ),
      ),
    );
  }
}