// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import '../../modules/patient_modules/notifications.dart';

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
  navigateWidget = PatientNotificationsScreen,
}) =>
    AppBar(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
      ),
      actions: [
        IconButton(
            onPressed: () {
              navigateTo(context, navigateWidget());
            },
            icon: Icon(icon)),
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
Widget appBarWithArrowBack({
  required BuildContext context,
  String? title,
  IconData icon = Icons.arrow_back,
  navigateWidget = PatientNotificationsScreen,
}) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(icon),
          iconSize: iconSize,
        ),
        if (title != null)
          Text(
            title,
            style: TextStyle(
              fontSize: 30,
            ),
          )
      ],
    );

/////////////////////////////////////////////////////
//default text form field
Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function? onSubmit,
  Function? onChange,
  bool isPassword = false,
  Color backGroundColor = const Color.fromRGBO(14, 213, 213, 15),
  required Function validate,
  required String label,
  required IconData prefixIcon,
  IconData? suffixIcon,
  Function? suffixPressed,
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
        onFieldSubmitted: (v) {
          if (onSubmit != null) {
            onSubmit(v);
          } else {
            null;
          }
        },
        onChanged: (v) {
          if (onChange != null) {
            onChange();
          } else {
            null;
          }
        },
        validator: (v) {
          validate(v);
          return null;
        },
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
                    onPressed: () {
                      if (suffixPressed != null) {
                        suffixPressed();
                      } else {
                        null;
                      }
                    },
                    icon: Icon(suffixIcon),
                    color: Colors.white,
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
