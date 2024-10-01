import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/active_patient_list.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

    Logger _log = Logger('patients_page.dart');


class PatientsPage extends StatelessWidget {
  const PatientsPage({super.key});
  

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();


    TextStyle specialityStle = TextStyle(
        color: palette.textFade, fontSize: 12, fontWeight: FontWeight.w500);
    TextStyle nameStyle = TextStyle(
        color: palette.textDark, fontSize: 16, fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .29),
        child: CustomAppBar(
          introText: "Hi,Welcome Back,",
          topSpacing: 0,
          radius: 20,
          horizontalSpacing: 14,
          widthFactor: .558,
          fontSize: 20,
          title: "Patients",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Active now",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: palette.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < activePatientList.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                              activePatientList[i]["image"].toString()),
                        ),
                        Positioned(
                          bottom: 4,
                          right: 4,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Current Patients",
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: palette.textDark,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: activePatientList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: size.width * 0.09),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context)
                          .go("/home/patient-details/single-patient/$index");
                    },
                    child: Container(
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
                              backgroundImage: AssetImage(
                                  activePatientList[index]["image"].toString()),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Zara Wilson",
                                style: nameStyle,
                              ),
                              Text(
                                "Click here to see your Activities .",
                                style: specialityStle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// This method will get all the active patients associatate with a doctor
List<Object> getactivePatientList() {
  return activePatientList;
}

/// This method will get all the current patients associatate with a doctor
List<Object> getCurrentPatients() {
  return activePatientList;
}

/// Implementation of the search method for patients
void handleSearch(String query) {
   _log.info("Searching for patients");
}