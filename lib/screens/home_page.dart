import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/category.dart';
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

    _log.info("screenWidth is:  $screenWidth");
    _log.info("screenHeight is:  $screenHeight");

    return Scaffold(
      backgroundColor: palette.trueWhite,
      body: ResponsiveScreen(
        // mainAreaProminence: 0.24,

        squarishMainArea: Stack(
          //  overflow: Overflow.visible,
          // fit: StackFit.expand,
          clipBehavior: Clip.none,
          alignment: AlignmentDirectional.topCenter,
          children: [
            
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              // color: palette.violet,
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
              // top: 270,
              // left: 250,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 121,
                decoration: BoxDecoration(
                  color: palette.darkViolet,
                  borderRadius:
                      const BorderRadius.all(Radius.circular(smallRadius)),
                  border: Border.all(
                    color: palette.darkViolet,
                    // width: 1.0,
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
          ],
        ),

        rectangularMenuArea: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final size = constraints.biggest;
            final padding = EdgeInsets.all(size.shortestSide / 30);

            _log.info("screenWidth with LayoutBuilder is:  ${size.width}");
            _log.info("screenHeight with LayoutBuilder is:  ${size.height}");

            return Container(
              padding: padding,
              color: palette.trueWhite,
              child: const Column(
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "Appointments",
                          path: "assets/icons/appointments.svg"),
                      Category(
                          name: "Lab Test", path: "assets/icons/lab-test.svg"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "Payment", path: "assets/icons/payment.svg"),
                      Category(
                          name: "Prescriptions \n & Medication",
                          path: "assets/icons/prescription.svg"),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Category(
                          name: "History", path: "assets/icons/history.svg"),
                      Category(
                          name: "Downloads",
                          path: "assets/icons/downloads.svg"),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
