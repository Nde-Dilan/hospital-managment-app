import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/category.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:hospital_managment_app/widgets/hero_text.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.isDoctor});
  final bool isDoctor;

  static final _log = Logger('main.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    const double radius = 30.0;
    const double smallRadius = 18.0;
    final double screenWidth = MediaQuery.of(context).size.width;

    _log.info(
        "Painting the top and bottom layout with a value of IsDoctor set to $isDoctor");
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
                const Positioned(
                    top: 108,
                    child: SearchInput(
                        placeholder: "Search here...", leftSpacing: 57)),
                const Positioned(top: 5, child: HeroText()),
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
                          name: isDoctor ? "Your Appointments" : "Appointments",
                          path: "assets/icons/appointments.svg",
                          goTo: "/home/appointements"),
                      Category(
                          name: isDoctor ? "Patients Lab Test" : "Lab Test",
                          path: "assets/icons/lab-test.svg",
                          goTo: "/home/lab-test"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: isDoctor ? "Your Biography" : "Payment",
                          path: isDoctor
                              ? "assets/icons/bio.svg"
                              : "assets/icons/payment.svg",
                          goTo: "/home/payment"),
                      Category(
                          name: isDoctor
                              ? "Diagnostics &\n Treatment"
                              : "Prescriptions \n & Medication",
                          path: isDoctor
                              ? "assets/icons/health.svg"
                              : "assets/icons/prescription.svg",
                          goTo: "/home/prescription"),
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
