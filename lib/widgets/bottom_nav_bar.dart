import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/widgets/custom_bottom_button.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int page;
  const CustomBottomNavBar({super.key, required this.page});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
      int currentTab = widget.page;

    return SizedBox(
      height: 90,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: CustomMaterialButton(
                icon: Icons.home_outlined,
                onPressed: () {
                  setState(() {
                    currentTab = 0;
                    GoRouter.of(context).go("/home");
                  });
                },
                isActive: currentTab == 0 ? true : false,
              ),
            ),
            Expanded(
                child: CustomMaterialButton(
              icon: Icons.watch_later_outlined,
              onPressed: () {
                setState(() {
                  currentTab = 1;
                  GoRouter.of(context).go("/home/");
                });
              },
              isActive: currentTab == 1 ? true : false,
            )),
            CustomMaterialButton(
              icon: Icons.calendar_month_outlined,
              onPressed: () {
                setState(() {
                  currentTab = 2;
                  GoRouter.of(context).go("/home/appointments/current-appointment");
                });
              },
              isActive: currentTab == 2 ? true : false,
            ),
            Expanded(
                child: CustomMaterialButton(
              icon: Icons.account_circle_outlined,
              onPressed: () {
                setState(() {
                  currentTab = 3;
                  GoRouter.of(context).go('/home/profile');
                });
              },
              isActive: currentTab == 3 ? true : false,
            )),
          ],
        ),
      ),
    );
  }
}
