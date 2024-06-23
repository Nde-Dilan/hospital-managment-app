import 'package:flutter/material.dart';

import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';
import 'package:logging/logging.dart';

class CustomNotifWidget extends StatelessWidget {
  final String icon;
  final String date;
  final String details;

  static final _log = Logger('custom_notification.dart');

  const CustomNotifWidget(
      {super.key,
      required this.date,
      required this.details,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    const double fontSize = 18;
    final palette = context.watch<Palette>();
    TextStyle dateStyle = TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: palette.textDark);
    TextStyle detailStyle = TextStyle(
        fontSize: 12, fontWeight: FontWeight.w300, color: palette.textFade);

    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width * 0.2016,
      width: size.width * .97,
      padding: EdgeInsets.symmetric(
          horizontal: size.width * .01, vertical: size.width * .0021),
      margin: EdgeInsets.only(
        top: size.width * .021,
        bottom: size.width * .03592,
      ),
      decoration: BoxDecoration(
          color: palette.backFade,
          border: Border.all(color: palette.trueWhite, width: 0),
          borderRadius:
              BorderRadius.all(Radius.circular(size.width * .026042))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(icon),
            ],
          ),
          SizedBox(
            width: size.width * 0.045,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                date,
                style: dateStyle,
              ),
              Text(
                details,
                style: detailStyle,
              ),
            ],
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                _log.info("Open a modal with details about the notification");
              },
              child: Text(
                "See details",
                style: TextStyle(
                    color: palette.textDark, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
