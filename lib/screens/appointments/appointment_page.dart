import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/Is_doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/models/doctor.dart';
import 'package:hospital_managment_app/utils/doctor_stats.dart';
import 'package:hospital_managment_app/models/patient.dart';
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

    Patient patient = Patient(
      age: "15",
      gender: "male",
      email: 'doe@gmail.com',
      name: 'John Doe',
      image: '',
      location: 'Yaoundé',
      phoneNumber: '694525931',
      password: '123456789',
    );
    //Instead just get the rest of info using what the current user have, get the extra info from firebase 
    Doctor doctor = context.watch<DoctorNotifier>().getDoctor();

    User user = context.watch<UserNotifier>().getUser();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .29),
        child: CustomAppBar(
          topSpacing: 0,
          radius: 20,
          horizontalSpacing: 14,
          widthFactor: .558,
          fontSize: 20,
          title: user.role == 'DOCTOR' ? "My Biography " : "My Appointments",
          introText: "Your Biography,",
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          top: 114,
          positionedWidget: SearchInput(
            topSpacing: 90,
            placeholder: "Search here...",
            handleSearchAction: () {},
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
                      user.image,
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
                          user.name,
                          style: nameStyle,
                        ),
                        Text(
                          "${doctor.speciality} | ${doctor.location}",
                          style: specialityStle,
                        ),
                      ],
                    ),
                    Text(
                      "⭐ ${doctor.rating} (${doctor.review} reviews)",
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
