import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class CongratsPage extends StatelessWidget {
  const CongratsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();
    TextStyle style1 = TextStyle(
      color: palette.congrasColor,
      fontWeight: FontWeight.bold,
      fontSize: 35,
    );
    TextStyle style2 = TextStyle(
      color: palette.textDark,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return Scaffold(
      backgroundColor: palette.trueWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: size.width * 0.39,
          ),
          const SizedBox(
            child: Image(image: AssetImage('assets/images/congrats-check.png')),
          ),
          SizedBox(
            height: size.width * 0.19,
          ),
          Text(
            "Congratulations",
            style: style1,
          ),
          SizedBox(
            height: size.width * 0.05,
          ),
          Text(
            "Your payment is Successfull",
            style: style2,
          ),
          SizedBox(
            height: size.width * 0.39,
          ),
          Container(
            height: 44,
            padding: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              children: [
                Expanded(
                  child: CustomButton(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    text: "Continue to Appointments", radius: 28,
                    // width: 300,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
