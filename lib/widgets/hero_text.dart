import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';


class HeroText extends StatelessWidget {
  const HeroText({super.key});


  @override
  Widget build(BuildContext context) {
        final palette = context.watch<Palette>();


  const String name ="John Doe William";
    return  Row(children: [
       Column(
         children: [
          const Text("Hi,Welcome Back, \n",style: TextStyle(fontSize:14 ),),
          Text(name,style: TextStyle(color: palette.textDark),),
         ],
      ),
      Row(children: [
        Container(),
        Container(),
      ],)
    ],);
  }
}