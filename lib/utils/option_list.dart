import 'package:flutter/material.dart';

const double fontSize = 18;
final optionList = [
  {
    "name": "Appointments History",
    "onTap": "/home",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.history,
  },
  {
    "name": "Edit Personal Details",
    "onTap": "/home/profile/personal-details",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.person_outline,
  },
  {
    "name": "Payment Method",
    "onTap": "/home/payment",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.payment,
  },
  {
    "name": "Appearance",
    "onTap": "/home",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.settings,
  },
  {
    "name": "Notifications",
    "onTap": "/home",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.notifications_outlined,
  },
  {
    "name": "Help",
    "onTap": "/hhh",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.help_center,
  },
  {
    "name": "Logout",
    "onTap": "/",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.logout,
  },
];

final editImageOptionList = [
  {
    "name": "Select from Gallery",
    "onTap": "/home",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.grid_on_rounded,
  },
  {
    "name": "Take a Picture",
    "onTap": "/home",
    "style": const TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w600,
        color: Color(0xff000000)),
    "icon": Icons.camera_enhance,
  },
];
