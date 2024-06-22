import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:provider/provider.dart';


class AppointmentHistoryPage extends StatelessWidget {
  const AppointmentHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
     final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    return 
    Scaffold(
      appBar:PreferredSize(
        preferredSize: Size.fromHeight(size.height * .29),
        child: const CustomAppBar(
          topSpacing: 0,
          radius: 20,
          horizontalSpacing: 14,
          widthFactor: .558,
          fontSize: 20,
          title: "My Appointments",
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          top: 114,
          positionedWidget: SearchInput(
            topSpacing: 90,
            placeholder: "Search here...",
          ),
          spacing: 0,
          bottomSpacing: 0,
        ),
      ), 
      
    );
  }
}