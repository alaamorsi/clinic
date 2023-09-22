// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myclinic/modules/patient_modules/notifications.dart';

Color defaultColor = Color.fromRGBO(14, 213, 213, 15);
double iconSize = 25;

//used for all buttons in login
Widget firstButton({
  double width = double.infinity,
  double height = 50,
  bool isUpperCase = true,
  double radius = 20.0,
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
          style: TextStyle(color: Colors.white, fontSize: 20.0),
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
  navigateWidget = PatientNotificationsScreen,
})
=>AppBar(
  title: Text(title, style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 28.0),),
  actions: [
    IconButton(
        onPressed: (){
          navigateTo(context, navigateWidget());
        },
        icon: Icon(icon,color: Colors.grey,size: iconSize,)
    ),
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
  navigateWidget = PatientNotificationsScreen,
})
=>AppBar(
  leading: IconButton(onPressed: (){
    Navigator.pop(context);
  }, icon: Icon(icon),iconSize:iconSize,color: Colors.black),
  title: Text(title, style: TextStyle(color: Colors.black, fontSize: 26.0),),
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
  Color color = Colors.white,
  required String? Function(String? val)? validate,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
  void Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      cursorColor: backGroundColor,
      textAlign: TextAlign.end,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      validator: validate,
      style: TextStyle(fontSize: 20,color: color),
      decoration: InputDecoration(
          hintText: label,
          hintStyle: TextStyle(color: color , fontSize: 20),
          prefixIcon: Icon(
            prefixIcon,
            color: color,
            size: iconSize,
          ),
          suffixIcon: suffixIcon != null
              ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffixIcon,color: color,
            ),
          ) : null,
        filled: true,
        fillColor: backGroundColor,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
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