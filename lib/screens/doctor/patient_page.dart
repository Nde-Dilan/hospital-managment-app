import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/models/patient.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/doctor_hours.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:hospital_managment_app/widgets/doctor_hour_container.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

//TODO: When possible try to refactor this code, it's not okay like that

class PatientPage extends StatelessWidget {
  const PatientPage({super.key, required this.id});
  final int id;

  static final _log = Logger('home_page.dart');

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    Patient patient = Patient(
      age: "15",
      gender: "male",
      email: 'doe@gmail.com',
      name: 'John Doe',
      medicalHistory:
          'This is the first admission for this 56 year old woman America, she has 20 years of...  Read More',
      image: '',
      location: 'Yaoundé',
      phoneNumber: '694525931',
      password: '123456789',
    );

    TextStyle titleStyle = TextStyle(
        fontSize: 36, fontWeight: FontWeight.w900, color: palette.textDark);
    TextStyle specialityStle = TextStyle(
        color: palette.textFade,
        fontSize: size.width * 0.036,
        fontWeight: FontWeight.w500);
    TextStyle nameStyle = TextStyle(
        color: palette.textDark,
        fontSize: size.width * 0.06,
        fontWeight: FontWeight.w600);
    _log.info("message from PatientPage with id: $id");
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * .05893,
        centerTitle: true,
        title: Text(
          "Patients Details ",
          style: titleStyle.merge(TextStyle(color: palette.violet)),
        ),
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Container(
            margin: EdgeInsets.only(
                left: size.width * .02149, bottom: size.width * .010149),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Adjust color and opacity
                blurRadius: 4.0, // Set blur radius to 4
                offset: const Offset(0, 4),
              ),
            ], color: palette.violet, borderRadius: BorderRadius.circular(9)),
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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: palette.backgroundMain,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(patient.image == ''
                                ? 'assets/images/profile-picture.png'
                                : patient.image),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              patient.name,
                              style: nameStyle,
                            ),
                            Expanded(
                              child: Text(
                                patient.getPatientInformation(),
                                style: specialityStle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Medical History",
                        style: specialityStle.merge(
                          TextStyle(
                            fontSize: size.width * 0.06,
                          ),
                        )),
                    SizedBox(
                      height: size.width * 0.009,
                    ),
                    Text(
                        patient.medicalHistory == ''
                            ? "No medical history"
                            : patient.medicalHistory,
                        style: specialityStle),
                  ]),
            ),
            SizedBox(
              height: size.width * 0.019,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Current Appointments ",
                        style: specialityStle.merge(
                          TextStyle(
                            fontSize: size.width * 0.06,
                          ),
                        )),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0;
                              i < patient.currentAppointments.length;
                              i++)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: size.width * 0.33333,
                                height: size.height * 0.0676,
                                padding:
                                    const EdgeInsets.only(top: 8.0, bottom: 8),
                                decoration: BoxDecoration(
                                  color: palette.trueWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(
                                          0.5), // Adjust color and opacity
                                      blurRadius: 4.0, // Set blur radius to 4
                                      offset: const Offset(0, 11),
                                    ),
                                  ],
                                  border: Border.all(
                                    color: palette.trueWhite,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    patient.currentAppointments[i].toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: palette.textFade,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.029,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          textAlign: TextAlign.start,
                          "Appointment Dates",
                          style: nameStyle,
                        ),
                        SizedBox(
                          height: size.width * 0.019,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              for (int i = 0;
                                  i < patient.appointmentsDate.length;
                                  i++)
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: size.width * 0.133333,
                                    height: size.height * 0.0876,
                                    padding: const EdgeInsets.only(
                                        top: 8.0, bottom: 8),
                                    decoration: BoxDecoration(
                                      color: palette.trueWhite,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(
                                              0.5), // Adjust color and opacity
                                          blurRadius:
                                              4.0, // Set blur radius to 4
                                          offset: const Offset(0, 11),
                                        ),
                                      ],
                                      border: Border.all(
                                        color: palette.trueWhite,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(9),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            patient.appointmentsDate[i]["date"]
                                                .toString(),
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: palette.textDark,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            patient.appointmentsDate[i]["day"]
                                                .toString(),
                                            style: nameStyle.merge(TextStyle(
                                                color: palette.textFade,
                                                fontSize: 9)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
            SizedBox(
              height: size.width * 0.019,
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
                children: [
                  for (int i = 0; i < doctorHours.length; i++)
                    DoctorHourContainer(
                      index: i,
                      doctorHours: doctorHours,
                      centerIndex: doctorHours.length ~/ 2,
                      palette: palette, // Calculate center index
                    ),
                ],
              ),
            ),
            SizedBox(
              height: size.width * 0.029,
            ),
            CustomButton(
              width: size.width * 0.65,
              onTap: () {
                GoRouter.of(context).pop();
              },
              text: "View Appointments details", radius: 28,
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
}
