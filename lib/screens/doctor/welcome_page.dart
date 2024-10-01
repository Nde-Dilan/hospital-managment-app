import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/notifiers/Is_doctor_notifier.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class WelcomeDoctor extends StatelessWidget {
  const WelcomeDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.welcomeBack,
      body: Stack(children: [
        Positioned(
            right: size.width * 0.05,
            top: size.width * 0.185,
            child: Image.asset("assets/images/doctor-femme.png"))
      ]),
      bottomSheet: Container(
        height: size.width,
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                textAlign: TextAlign.center,
                'More Comfortable healthcare system',
                style: TextStyle(
                  color: palette.textDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(height: size.width * 0.019),
            Text(
              textAlign: TextAlign.center,
              'Book an appointment with doctor. Chat with doctor via appointment letter and get consultationt.',
              style: TextStyle(
                color: palette.textFade,
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: size.width * 0.039),
            CustomButton(
                text: "Sing In As Doctor",
                radius: 15,
                onTap: () {
                   const isDoctor = true;
                Provider.of<IsDoctorNotifier>(context,listen:false).setIsDoctor(isDoctor);

                  GoRouter.of(context).go("/auth");
                }),
            SizedBox(height: size.width * 0.082509),
            CustomButton(
              text: "Sing In As Patient",
              radius: 15,
              onTap: () {
                const isDoctor = false;
                Provider.of<IsDoctorNotifier>(context,listen:false).setIsDoctor(isDoctor);

                GoRouter.of(context).go("/auth");
              },
            ),
          ],
        ),
      ),
    );
  }
}
