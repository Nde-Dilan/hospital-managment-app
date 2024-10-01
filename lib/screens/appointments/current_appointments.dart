import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_appointment.dart';
import 'package:hospital_managment_app/utils/current_appointments_list.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class CurrentAppointmentsPage extends StatelessWidget {
  const CurrentAppointmentsPage({super.key});

  static final _log = Logger('search_input.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    const double radius = 20;
    const double topSpacing = 15;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppBar(
              topSpacing: 0,
              top: 114,
              radius: radius,
              horizontalSpacing: 14,
              fontSize: 20,
              title: "Current Appointments",
              mainAxisAlignment: MainAxisAlignment.center,
              positionedWidget: SearchInput(
                topSpacing: 90,
                placeholder: "Search here...",
                handleSearchAction: (value) {
                  _log.info("Searching foe appointments");
                },
              ),
              spacing: 0,
              bottomSpacing: 0,
              toPadding: 20,
            ),
            const SizedBox(
              height: topSpacing,
            ),
            ListView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 1.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: currentAppointmentsList.length,
                itemBuilder: (context, index) {
                  //TODO: Get the appointment data from the API by hour and render it accordingly
                  return GestureDetector(
                    onTap: () {
                      GoRouter.of(context)
                          .go('/home/appointments/my-appointment');
                    },
                    child: AppointmentItem(
                      name: currentAppointmentsList[index]["name"].toString(),
                      drImage:
                          currentAppointmentsList[index]["drImage"].toString(),
                      label: currentAppointmentsList[index]["label"].toString(),
                      specialization: currentAppointmentsList[index]
                              ["specialization"]
                          .toString(),
                      dotsImage: currentAppointmentsList[index]["dotsImage"]
                          .toString(),
                      badgeColor: palette.badge,
                    ),
                  );
                }),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 2,
      ),
    );
  }
}

List<Object> getCurrentAppointmentList() {
  return currentAppointmentsList;
}

List<Object> searchCurrentAppointment(String query) {
  return currentAppointmentsList;
}
