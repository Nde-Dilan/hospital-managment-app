import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/doctor.dart';
import 'package:hospital_managment_app/utils/doctor_stats.dart';
import 'package:hospital_managment_app/utils/patient.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:provider/provider.dart';

class Appointmentpage extends StatelessWidget {
  const Appointmentpage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();
    TextStyle ratingStyle = TextStyle(
        color: palette.textDark, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle specialityStle = TextStyle(
        color: palette.textFade, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle nameStyle = TextStyle(
        color: palette.textDark, fontSize: 16, fontWeight: FontWeight.w600);

    Patient patient = Patient(name: 'John Doe', age: "15", gender: "male");
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
                SizedBox(
                  height: size.height * .013,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          style: nameStyle,
                        ),
                        Text(
                          "${doctor.speciality} | ${doctor.location}",
                          style: specialityStle,
                        ),
                      ],
                    ),
                    Text(
                      "⭐ ${doctor.rating}",
                      style: ratingStyle,
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .018,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    for (var item in doctorStats)
                      Column(
                        children: [
                          Image.asset(item["image"].toString()),
                          Text(item["number"].toString(),
                              style: TextStyle(
                                  color: palette.textDark,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500)),
                          Text(item["title"].toString(),
                              style: TextStyle(
                                  color: palette.textFade,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                        ],
                      ),
                  ],
                ),
                SizedBox(
                  height: size.height * .015,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About Me',
                          style: TextStyle(
                              color: palette.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: size.height * .009,
                      ),
                      Text(doctor.about,
                          style: TextStyle(
                              color: palette.textFade,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('Patient Information',
                          style: TextStyle(
                              color: palette.textDark,
                              fontSize: 16,
                              fontWeight: FontWeight.w600)),
                      SizedBox(
                        height: size.height * .009,
                      ),
                      Text(patient.getPatientInformation(),
                          style: TextStyle(
                              color: palette.textFade,
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 2,
      ),
    );
  }
}
