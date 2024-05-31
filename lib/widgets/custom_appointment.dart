import 'package:flutter/material.dart';

class AppointmentItem extends StatelessWidget {
  final String drImage;
  final String dotsImage;
  final String label;
  final String name;
  final String specialization;

  const AppointmentItem(
      {super.key,
      required this.drImage,
      required this.label,
      required this.name,
      required this.specialization, required this.dotsImage});

  @override
  Widget build(BuildContext context) {
    const TextStyle nameStyle = TextStyle();
    const TextStyle specializationStyle = TextStyle();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
           BoxShadow(
                color: Colors.grey.withOpacity(.4),
                blurRadius: 54,
                spreadRadius: 0.0,
              ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 18.0,right: 18,top: 8,bottom: 8),
        child: Row(
          children: [
            Image(
              image: AssetImage(drImage),
            ),
            Column(
              children: [
                Badge(
                    label: Text(
                  label,
                  style: nameStyle,
                )),
                Text(name),
                Text(
                  specialization,
                  style: specializationStyle,
                ),
              ],
            ),
            Image(
              image: AssetImage(dotsImage),
            ),
          ],
        ),
      ),
    );
  }
}
