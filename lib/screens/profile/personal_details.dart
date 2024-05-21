import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatelessWidget {
  const PersonalDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    const verticalSpacing = 9.0;
    const fontSize = 29.0;
    const topSpacing = 25.0;
    const radius = 20.0;
    const String name = "Jonh Doe William";

    return Scaffold(
      body: ResponsiveScreen(
        squarishMainArea: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: topSpacing),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: palette.violet,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(radius),
                    bottomRight: Radius.circular(radius)),
              ),
            ),
            Positioned(
                // top: 44,
                child: Container(
              margin: const EdgeInsets.only(top: 34.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: palette.trueWhite,
                        // border: Border.all(width: 4, color: palette.violet),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 30,
                        color: palette.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: verticalSpacing,
                  ),
                  const Text(
                    "Edit Personal details",
                    style: TextStyle(fontSize: 18),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).go('/notifications');
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.35,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: const Padding(
                            padding: EdgeInsets.all(0.0),
                            child: Image(
                                image: AssetImage(
                                    'assets/icons/notification.png'))),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        GoRouter.of(context).go('/home/profile');
                      },
                      child: Container(
                        // width: MediaQuery.of(context).size.width * 0.235,
                        decoration: const BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Image(
                              width: 55,
                              image: AssetImage('assets/icons/account.png')),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
            Positioned(
                top: 105,
                child: Container(
                  margin: const EdgeInsets.all(18),
                  child: Column(
                    children: [
                      const Text("Edit your details,"),
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: palette.textDark,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
        rectangularMenuArea: const Column(
          children: [
            Text("Hello"),
            CustomButton(
              text: "Save Changes",
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 3,
      ),
    );
  }
}
