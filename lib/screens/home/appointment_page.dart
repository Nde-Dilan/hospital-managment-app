import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/doctor.dart';
import 'package:hospital_managment_app/utils/doctor_stats.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:provider/provider.dart';

class Appointmentpage extends StatelessWidget {
  const Appointmentpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    Doctor doctor = Doctor(
        name: 'Dr. Aman Wins',
        speciality: 'Cardiologists',
        location: 'Mars Hospital',
        image: 'assets/images/doctor-placeholder-appointment.png',
        rating: '5.0 (332 reviews)',
        experience: '11+',
        about:
            'Dr. Carly Angel is the top most immunologists specialist in Crist Hospital in London, UK. She achived several awards for her wonderful contribution Read More. . . ');

    return Scaffold(
      appBar: PreferredSize(
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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .013,
                ),
                Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * .058),
                    child: Image.asset(
                      doctor.image,
                    )),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          doctor.name,
                          style: TextStyle(
                              color: palette.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "${doctor.speciality} | ${doctor.location}",
                          style: TextStyle(
                              color: palette.textFade,
                              fontSize: 12,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    Text(
                      "⭐ ${doctor.rating}",
                      style: TextStyle(
                          color: palette.textDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ListView.builder(
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Image.asset(doctorStats[index]["image"]!),
                            Text(doctorStats[index]["number"]!),
                            Text(doctorStats[index]["name"]!),
                          ],
                        );
                      },
                      itemCount: 4,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
