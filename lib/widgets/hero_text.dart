import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class HeroText extends StatelessWidget {
  const HeroText({super.key, required this.name});

      final String name ;


  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            const Text(
              "Hi,Welcome Back, ",
              style: TextStyle(fontSize: 14),
            ),
            Text(
              name,
              style: TextStyle(
                  color: palette.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go('/home/notifications');
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Image(
                        image: AssetImage('assets/icons/notification.png'))),
              ),
            ),
            GestureDetector(
              onTap: () {
                GoRouter.of(context).go('/home/profile');
              },
              child: Container(
                // width: MediaQuery.of(context).size.width * 0.235,
                decoration: const BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Image(
                      width: 55, image: AssetImage('assets/icons/account.png')),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
