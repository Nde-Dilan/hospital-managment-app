import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/Is_doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/patient_notifier.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/category.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:hospital_managment_app/widgets/hero_text.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final _log = Logger('home_page.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    User user = context.watch<UserNotifier>().getUser();
     
    const double radius = 30.0;
    const double smallRadius = 18.0;
    final double screenWidth = MediaQuery.of(context).size.width;

    _log.info(
        "Painting the top and bottom layout with a value of ROLE set to ${user.role}");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: palette.trueWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: AlignmentDirectional.topCenter,
              children: [
                Container(
                  width: screenWidth,
                  height: 290,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: palette.violet,
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(radius),
                        bottomRight: Radius.circular(radius)),
                  ),
                ),
                Positioned(
                  // bottom: -20.50,
                  top: 200.50,
                  child: Container(
                    width: screenWidth * 0.85,
                    height: 121,
                    decoration: BoxDecoration(
                      color: palette.darkViolet,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(smallRadius)),
                      border: Border.all(
                        color: palette.darkViolet,
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.only(
                        left: 1.0,
                        top: 7,
                        bottom: 4,
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Medical Center",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 26),
                                ),
                                Text(
                                  " Our Healthcare portal has \n incorporated notifications so that \n Clinics and its team do not miss \n any update or change.",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Image(
                                image: AssetImage(
                                    'assets/images/doctor-woman-looking.png')),
                          ]),
                    ),
                  ),
                ),
                  Positioned(
                    top: 108,
                    child: SearchInput(
                        placeholder: "Search here...", leftSpacing: 57, handleSearchAction:  (){},)),
                Positioned(
                    top: 5,
                    child: HeroText(
                      name: user.name,
                    )),
              ],
            ),
            const SizedBox(
              height: 28,
            ),
            Container(
              padding: const EdgeInsets.all(30),
              color: palette.trueWhite,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: user.role == "DOCTOR" ? "Your Appointments" : "Appointments",
                          path: "assets/icons/appointments.svg",
                          goTo: "/home/appointments"),
                      Category(
                          name: user.role == "DOCTOR" ? "Patients Lab Test" : "Lab Test",
                          path: "assets/icons/lab-test.svg",
                          goTo: user.role == "DOCTOR"
                              ? "/home/patient-details"
                              : "/home/lab-test"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: user.role == "DOCTOR" ? "Your Biography" : "Payment",
                          path: user.role == "DOCTOR"
                              ? "assets/icons/bio.svg"
                              : "assets/icons/payment.svg",
                          goTo: user.role == "DOCTOR"
                              ? "/home/appointments/my-appointment"
                              : "/home/payment"),
                      Category(
                          name: user.role == "DOCTOR"
                              ? "Diagnostics &\n Treatment"
                              : "Prescriptions \n & Medication",
                          path: user.role == "DOCTOR"
                              ? "assets/icons/health.svg"
                              : "assets/icons/prescription.svg",
                          goTo: "/home/prescriptions"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "History",
                          path: "assets/icons/history.svg",
                          goTo: "/home/appointments/appointment-history"),
                      Category(
                          name: "Downloads",
                          path: "assets/icons/downloads.svg",
                          goTo: "/home/downloads"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 0,
      ),
    );
  }
}
