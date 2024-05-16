import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'package:hospital_managment_app/styles/palette.dart';

class CustomInkWell extends StatelessWidget {
  final String onTap;
  final String name;
  final TextStyle style;
  final IconData icon;

  const CustomInkWell(
      {required this.onTap,
      required this.style,
      required this.name,
      required this.icon,
      super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return InkWell(
      onTap: () {
        GoRouter.of(context).go(onTap);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xffDFDDDD).withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: palette.violet,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: style,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: palette.violet,
            ),
          ],
        ),
      ),
    );
  }
}
