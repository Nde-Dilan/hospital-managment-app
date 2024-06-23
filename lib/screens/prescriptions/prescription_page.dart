import 'package:flutter/material.dart';
import 'package:hospital_managment_app/screens/prescriptions/medication.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:hospital_managment_app/widgets/custom_switch.dart';
import 'package:provider/provider.dart';

class PrescriptionPage extends StatelessWidget {
  const PrescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    TextStyle headerStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: palette.textDark);
    TextStyle detailStyle = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w400, color: palette.textFade);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .29),
        child: const CustomAppBar(
          topSpacing: 0,
          radius: 20,
          horizontalSpacing: 14,
          widthFactor: .558,
          fontSize: 20,
          title: "Prescription & Medication ",
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
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: size.width * 0.019248,
                vertical: size.width * 0.019),
            padding: EdgeInsets.all(size.width * .009),
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Adjust color and opacity
                    blurRadius: 4.0, // Set blur radius to 4
                    offset: const Offset(0, 4),
                  ),
                ],
                color: palette.trueWhite,
                borderRadius: BorderRadius.circular(9)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/icons/reminder-bell.png"),
                SizedBox(
                  width: size.width * 0.019,
                ),
                SizedBox(
                  height: size.height * 0.109109349785,
                  width: size.width * 0.56429109888888,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        textAlign: TextAlign.start,
                        "Set reminder for all",
                        style: headerStyle,
                      ),
                      Text(
                        textAlign: TextAlign.start,
                        "View the best according to Time and Date mentioned",
                        style: detailStyle,
                      ),
                    ],
                  ),
                ),
                const SwitchWidget()
              ],
            ),
          ),
          SizedBox(height: size.width*.009,),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey
                        .withOpacity(0.5), // Adjust color and opacity
                    blurRadius: 4.0, // Set blur radius to 4
                    offset: const Offset(0, 4),
                  ),
                ],
                color: palette.trueWhite,
                borderRadius: BorderRadius.circular(9)),

                child: const MedicationWidget(name: 'Ocysius',),
            
          )
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(page: 2,),
    );
  }
}
