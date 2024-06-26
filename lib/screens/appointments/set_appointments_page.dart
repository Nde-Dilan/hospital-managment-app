import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/doctor_hours.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/calendar_widget.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class SetAppointmentPage extends StatelessWidget {
  const SetAppointmentPage(
      {super.key,
      required this.name,
      required this.speciality,
      required this.rating});

  final String name;
  final String speciality;
  final String rating;

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
    TextStyle detailStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400, color: palette.textDark);

    TextStyle titleStyle = TextStyle(
        fontSize: 36, fontWeight: FontWeight.w900, color: palette.textDark);
    int centerIndex = (doctorHours.length / 2).floor();

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * .05893,
        centerTitle: true,
        title: Text(
          "Detail Doctor",
          style: titleStyle,
        ),
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(
                left: size.width * .02149, bottom: size.width * .010149),
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
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios_new_sharp,
              size: 30,
              color: palette.textDark,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: size.width * .01358, vertical: size.width * .058),
              padding: EdgeInsets.symmetric(horizontal: size.width * .058),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * .0058,
                        vertical: size.width * .0058),
                    width: size.width * 0.29302,
                    height: size.width * 0.2186,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(size.width * .06042)),
                      color: palette.doctorBack,
                    ),
                    child: Image.asset("assets/images/doctor-profile.png"),
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: nameStyle,
                        ),
                        Text(
                          speciality,
                          style: specialityStle,
                        ),
                        Text("⭐ $rating", style: ratingStyle),
                      ])
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Biography",
                      style: specialityStle,
                    ),
                    Text(
                        "Dr. Jenny Wilson (Implantologist),  is a Dentist in America, she has 20 years of...  Read More",
                        style: specialityStle),
                  ]),
            ),
            CalendarWidget(size: size),
            SizedBox(
              height: size.width * 0.009,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Time",
                  style: TextStyle(
                      color: palette.textDark,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < doctorHours.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: palette.darkViolet.withOpacity(
                            _calculateOpacity(centerIndex, i),
                          ),
                          borderRadius:
                              BorderRadius.circular(size.width * 0.089),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            doctorHours[i]["hour"].toString(),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Container(
              width: size.width * 0.93023,
              height: size.height * 0.12992096652,
              decoration: BoxDecoration(
                color: palette.trueWhite,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Appointment history", style: nameStyle),
                    Expanded(
                      child: Text(
                        "View recent appointments from the following dates",
                        style: detailStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.width * 0.009,
            ),
            CustomButton(
              width: size.width * 0.65,
              onTap: () {
                GoRouter.of(context).pop();
              },
              text: "Set Appointment", radius: 28,
              // width: 300,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 1,
      ),
    );
  }

  double _calculateOpacity(int centerIndex, int currentIndex) {
    int distanceFromCenter = (centerIndex - currentIndex).abs();
    // Adjust the divisor to control the rate of fading
    return 1.0 - (distanceFromCenter * 0.1);
  }
}


/**
 * 
 * ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        //TODO: Get the appointment data from the API by hour and render it accordingly
                        return SizedBox(
                          width: size.width * 0.029302,
                          height: size.width * 0.02186,
                          child: Badge(
                              backgroundColor: palette.badge,
                              label: Text(
                                "10:00AM",
                              )),
                        );
                      }),
 */