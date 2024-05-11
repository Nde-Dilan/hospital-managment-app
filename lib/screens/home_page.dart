import 'package:flutter/material.dart';
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
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    _log.info("screenWidth is:  $screenWidth");
    _log.info("screenHeight is:  $screenHeight");

    return Scaffold(
        backgroundColor: palette.trueWhite,
        body: ResponsiveScreen(
          // mainAreaProminence: 0.24,

          squarishMainArea: Stack(
            // alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                width: 100,
                decoration: BoxDecoration(
                    shape: BoxShape.rectangle, color: palette.violet),
              ),
              Container(
                // width: MediaQuery.of(context).size.width * 0.25,
                // height: 121,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Color.fromARGB(31, 255, 255, 255)),
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: SvgPicture.asset("assets/images/doctor-woman.svg"),
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
                            name: "Lab Test",
                            path: "assets/icons/lab-test.svg"),
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
        ));
  }
}
