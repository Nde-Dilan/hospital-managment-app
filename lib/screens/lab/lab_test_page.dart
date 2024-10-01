import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/appointment_history.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/lab_test.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';

class LabTesPage extends StatelessWidget {
  const LabTesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * .29),
        child:   CustomAppBar(
          topSpacing: 0,
          radius: 20,
          horizontalSpacing: 14,
          widthFactor: .558,
          fontSize: 20,
          title: "Lab Tests",
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          top: 114,
          positionedWidget: SearchInput(
            topSpacing: 90,
            placeholder: "Search here...", handleSearchAction:  (){},
          ),
          spacing: 0,
          bottomSpacing: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 1.0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: appointmentsHistoryList.length,
                itemBuilder: (context, index) {
                  //TODO: Get the appointment history data from the API and render it accordingly
                  return LabTest(
                    image: appointmentsHistoryList[index]["image"].toString(),
                    title: appointmentsHistoryList[index]["title"].toString(),
                    description: appointmentsHistoryList[index]["description"]
                        .toString(),
                    result:
                        appointmentsHistoryList[index]["results"]! as Widget,
                  );
                })
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 2,
      ),
    );
  }
}
