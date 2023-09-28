// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/modules/doctor_modules/notifications.dart';
import 'package:myclinic/modules/patient_modules/notifications.dart';

Color defaultColor = Color.fromRGBO(14, 213, 213, 15);
double iconSize = 30;

//used for all buttons in login
Widget firstButton({
  double width = double.infinity,
  double height = 60,
  bool isUpperCase = true,
  double radius = 10.0,
  required function,
  required String text,
}) =>
    Container(
      width: width,
      height: height,
      child: TextButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black)),
        color: defaultColor,
        borderRadius: BorderRadius.circular(
          radius,
        ),
      ),
    );

////////////////////////////////////////////
PreferredSizeWidget appBarWithIcon({
  required BuildContext context,
  required String title,
  IconData icon = Icons.notifications,
  bool patient = true,
}) =>
    AppBar(
      title: Text(
        title,
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 28.0),
      ),
      actions: [
        IconButton(
            onPressed: () {
              navigateTo(
                  context,
                  patient
                      ? PatientNotificationsScreen()
                      : DoctorNotificationsScreen());
            },
            icon: Icon(
              icon,
              color: Colors.grey,
              size: iconSize,
            )),
      ],
      centerTitle: true,
      elevation: 5.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );

////////////////////////////////////////////
PreferredSizeWidget appBarWithArrowBack({
  required BuildContext context,
  required String title,
  IconData icon = Icons.arrow_back,
}) =>
    AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(icon),
          iconSize: iconSize,
          color: Colors.black),
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 30.0),
      ),
      centerTitle: true,
      elevation: 0.0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
      ),
    );

/////////////////////////////////////////////////////
//default text form field
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  Function(String val)? onChanged,
  bool isPassword = false,
  Color backGroundColor = const Color.fromRGBO(14, 213, 213, 15),
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
  void Function()? suffixPressed,
  bool isClickable = true,
}) =>
    Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        obscureText: isPassword,
        enabled: isClickable,
        cursorColor: Colors.white,
        textAlign: TextAlign.end,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        validator: validate,
        style: TextStyle(color: Colors.white,fontSize: 22),
        decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(color: Colors.white, fontSize: 25),
            prefixIcon: Icon(
              prefixIcon,
              color: Colors.white,
              size: 40,
            ),
            suffixIcon: suffixIcon != null
                ? IconButton(
                    onPressed: suffixPressed,
                    icon: Icon(
                      suffixIcon,
                    ),
                  )
                : null,
            border: InputBorder.none),
      ),
    );

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (Route<dynamic> rout) => false,
    );

void showToast({
  required String text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

// enum
enum ToastStates { SUCCESS, ERROR, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;

  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }

  return color;
}

Widget dataLabel(String title,String data)
=>Container(
  height: 50.0,
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          constraints: BoxConstraints(maxWidth: 190.0),
          child: Text(data,style: TextStyle(fontSize: 16,color: Colors.black),overflow:TextOverflow.ellipsis,),
        ),
        Text(' : $title',style: TextStyle(fontSize: 16,color: Colors.black)),
      ]
    ),
  ),
  decoration: BoxDecoration(
    border: Border(
        top: BorderSide(color: Colors.grey),
        bottom: BorderSide(color: Colors.grey),
        right: BorderSide(color: Colors.grey),
        left: BorderSide(color: Colors.grey)),
    borderRadius: BorderRadius.circular(5.0),
  ),
);

Widget ReservedCard(String number,String name, String age)=>Container(
  height: 150.0,width: double.infinity,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(color: Colors.grey)
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
    child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children:[
            Spacer(),
            dataLabel('رقم', '$number'),
            Spacer()
          ]),
          SizedBox(height: 10.0,),
          Row(mainAxisAlignment: MainAxisAlignment.end,children:[
            dataLabel('العمر', '$age'),
            SizedBox(width: 10.0,),
            dataLabel('اسم المريض', '$name'),
          ]
          ),
        ]
    ),
  ),
);

Widget label(String text)
=>Container(
  height: 50.0,
  child: Padding(
    padding: const EdgeInsets.all(5.0),
    child: Text(text,style: TextStyle(fontSize: 16,color: Colors.black)),
  ),
  decoration: BoxDecoration(
    border: Border(
        top: BorderSide(color: Colors.grey),
        bottom: BorderSide(color: Colors.grey),
        right: BorderSide(color: Colors.grey),
        left: BorderSide(color: Colors.grey)),
    borderRadius: BorderRadius.circular(5.0),
  ),
);

Widget formFieldWithoutIcons({
  required TextEditingController controller,
  required TextInputType type,
  void Function(String)? onSubmit,
  Function(String val)? onChanged,
  Color backGroundColor = Colors.white,
  required String? Function(String? val)? validate,
  bool isClickable = true,
}) => Container(
      decoration: BoxDecoration(
        color: backGroundColor,
        border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
            right: BorderSide(color: Colors.black),
            left: BorderSide(color: Colors.black)),
        borderRadius: BorderRadius.circular(5),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: type,
        enabled: isClickable,
        cursorColor: Colors.white,
        textAlign: TextAlign.end,
        onFieldSubmitted: onSubmit,
        onChanged: onChanged,
        validator: validate,
        style: TextStyle(color: Colors.white,fontSize: 22),
        decoration: InputDecoration(border: InputBorder.none),),);
