import 'package:flutter/material.dart';
import 'package:hospital_managment_app/utils/notification_list.dart';
import 'package:hospital_managment_app/widgets/app_bar.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_notification.dart';
import 'package:hospital_managment_app/widgets/search_input.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

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
          title: "Notifications",
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          top: 114,
          positionedWidget: SearchInput(
            topSpacing: 90,
            placeholder: "Search here...", handleSearchAction: ( ){},
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
                itemCount: notificationList.length,
                itemBuilder: (context, index) {
                  return CustomNotifWidget(
                    date: notificationList[index]["date"].toString(),
                    details: notificationList[index]["details"].toString(),
                    icon: notificationList[index]["icon"].toString(),
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
