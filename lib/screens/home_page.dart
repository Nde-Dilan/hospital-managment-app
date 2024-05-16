import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/category.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:hospital_managment_app/widgets/hero_text.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final _log = Logger('main.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    const double radius = 30.0;
    const double smallRadius = 18.0;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    _log.info("Painting the top and bottom layout");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: palette.trueWhite,
      body: ResponsiveScreen(
        squarishMainArea: Stack(
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            Container(
              width: screenWidth,
              height: screenHeight / 2.5,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: palette.violet,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius)),
              ),
            ),
            Positioned(
              bottom: -2.0,
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
                                  fontWeight: FontWeight.bold, fontSize: 26),
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
            const Positioned(top: 108, child: SearchInput()),
            const Positioned(top: 5, child: HeroText()),
          ],
        ),
        rectangularMenuArea: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final size = constraints.biggest;
            final padding = EdgeInsets.all(size.shortestSide / 30);
            return Container(
              padding: padding,
              color: palette.trueWhite,
              child: const Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "Appointments",
                          path: "assets/icons/appointments.svg",
                          goTo: "/home/appointements"),
                      Category(
                          name: "Lab Test",
                          path: "assets/icons/lab-test.svg",
                          goTo: "/home/lab-test"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "Payment",
                          path: "assets/icons/payment.svg",
                          goTo: "/home/payment"),
                      Category(
                          name: "Prescriptions \n & Medication",
                          path: "assets/icons/prescription.svg",
                          goTo: "/home/prescription"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "History",
                          path: "assets/icons/history.svg",
                          goTo: "/home/history"),
                      Category(
                          name: "Downloads",
                          path: "assets/icons/downloads.svg",
                          goTo: "/home/downloads"),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
           BottomNavigationBarItem(icon: Icon(Icons.recent_actors_outlined),label: "recent"),
           BottomNavigationBarItem(icon: Icon(Icons.account_balance),label: "Account"),
          ],
      ),
    );
  }
}
