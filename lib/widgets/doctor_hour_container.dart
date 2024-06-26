import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';

class DoctorHourContainer extends StatelessWidget {
  final int index;
  final List doctorHours;
  final int centerIndex;
  final Palette palette;

  const DoctorHourContainer({
    super.key,
    required this.index,
    required this.doctorHours,
    required this.centerIndex,
    required this.palette,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.33333;
    final double height = MediaQuery.of(context).size.height * 0.0576;
    final double borderRadius = width * 0.189;
    final bool isCenter = index == centerIndex;

    final Color color = isCenter ? palette.violet : Colors.white;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.only(top: 8.0, bottom: 8),
        decoration: BoxDecoration(
          color: color.withOpacity(isCenter ? 1.0 : 0.2),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            doctorHours[index]["hour"].toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isCenter ? Colors.white : palette.textDark,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
