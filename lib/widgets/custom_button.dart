import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hospital_managment_app/styles/palette.dart';

class CustomButton extends StatelessWidget {
      final String text;

  const CustomButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return InkWell(
      child: Container(
        alignment: Alignment.center,
        width: 145,
        height: 45,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: palette.violet,
          border: Border.all(width: 4, color: palette.violet),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: palette.trueWhite, fontSize: 15),
        ),
      ),
    );
  }
}
