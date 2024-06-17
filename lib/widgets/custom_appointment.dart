import 'package:flutter/material.dart';

class AppointmentItem extends StatelessWidget {
  final String drImage;
  final String dotsImage;
  final String label;
  final Color badgeColor;
  final String name;
  final String specialization;

  const AppointmentItem(
      {super.key,
      required this.drImage,
      required this.label,
      required this.badgeColor,
      required this.name,
      required this.specialization,
      required this.dotsImage});

  @override
  Widget build(BuildContext context) {
    const TextStyle nameStyle = TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    const TextStyle specializationStyle =
        TextStyle(color: Color(0xff797979), fontSize: 14);
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color(0xffD8E0FF).withOpacity(.4)),
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
        padding:
            const EdgeInsets.only(left: 18.0, right: 18, top: 8, bottom: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(drImage),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Badge(
                      backgroundColor: badgeColor,
                      label: Text(
                        label,
                      )),
                  Text(
                    name,
                    style: nameStyle,
                  ),
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
      ),
    );
  }
}
