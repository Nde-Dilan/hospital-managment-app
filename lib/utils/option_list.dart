import 'package:flutter/material.dart';

final optionList = [
  {
    "name": "Appointments History",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.person_outline,  
  },
  {
    "name": "Edit Personal Details",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.person_outline,  
  },
  {
    "name": "Payment Method",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.person_outline,  
  },
  {
    "name": "Appearance",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.app_settings_alt_sharp,  
  },
  {
    "name": "Notifications",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.notifications_outlined,  
  },
  {
    "name": "Help",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.person_outline,  
  },
  {
    "name": "Logout",
    "onTap": "/home",
    "style": const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color(0xff000000)),
    "icon": Icons.logout,  
  },
  
];

/**
 * {
 *  name:"",
 *  onTap:"",
 *  style:Widget,
 *  icon:Widget,
 * }
 * 
 * CustomInkWell(
                    name: "Edit Personal Details",
                    onTap: "/home",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: palette.textDark),
                    icon: Icons.person_outline,
                  );
 * 
 */