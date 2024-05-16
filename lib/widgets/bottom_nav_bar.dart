import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_bottom_button.dart';
import 'package:provider/provider.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int currentTab = 0;
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Container(
      height: 90,
      /*decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                blurRadius: 1,
                offset: Offset(1, 1),
                spreadRadius: 1)
          ],
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),*/
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
                });
              },
              isActive: currentTab == 1 ? true : false,
            )),
            CustomMaterialButton(
              icon: Icons.calendar_month_outlined,
              onPressed: () {
                setState(() {
                  currentTab = 2;
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
