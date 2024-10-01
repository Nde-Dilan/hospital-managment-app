import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_switch.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class MedicationWidget extends StatefulWidget {
  const MedicationWidget(
      {super.key,
      required this.name,
      required this.dailyDose,
      required this.startTime,
      required this.endTime});
  final String name;
  final String dailyDose;
  final String startTime;
  final String endTime;

  @override
  State<MedicationWidget> createState() => _MedicationWidgetState();
}

class _MedicationWidgetState extends State<MedicationWidget> {
  static final _log = Logger('medication.dart');

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final Size size = MediaQuery.of(context).size;

    TextStyle headerStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: palette.textDark);
    TextStyle detailStyle = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400, color: palette.textDark);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              size.width * 0.019,
            ),
            topRight: Radius.circular(
              size.width * 0.019,
            ),
            bottomLeft: Radius.circular(
              size.width * 0.0319,
            ),
            bottomRight: Radius.circular(
              size.width * 0.0319,
            )),
        border: Border(
            top: BorderSide(color: palette.violet, width: 0.50),
            right: BorderSide(color: palette.violet, width: 0.50),
            left: BorderSide(color: palette.violet, width: 0.50),
            bottom:
                BorderSide(color: palette.violet, width: size.width * 0.0429)),
      ),
      width: size.width * 0.94,
      margin: EdgeInsets.only(top: size.width * .029),
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.049, vertical: size.width * 0.049),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  Image.asset("assets/icons/capsule.png"),
                  SizedBox(width: size.width * .059),
                  Text(
                    widget.name,
                    style: headerStyle,
                  )
                ],
              ),
              SizedBox(width: size.width * .2959),
              const Expanded(child: SwitchWidget())
            ],
          ),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.repeat),
              SizedBox(width: size.width * .0235692959),
              Text(
                widget.dailyDose,
                style: detailStyle,
              ),
              SizedBox(width: size.width * .2959),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Icon(Icons.settings_backup_restore_rounded),
              Text(
                "Morning",
                style: detailStyle,
              ),
              SizedBox(width: size.width * .2959),
              Text(
                widget.startTime,
                style: detailStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: size.width * .057892959),
              Text(
                "Evening",
                style: detailStyle,
              ),
              SizedBox(width: size.width * .2959),
              Text(
                widget.endTime,
                style: detailStyle,
              ),
            ],
          ),
          SizedBox(
            height: size.width * 0.019,
          ),
          Row(
            children: [
              const Icon(Icons.calendar_month_outlined),
              SizedBox(width: size.width * .0235692959),
              Text(
                "Everyday",
                style: detailStyle,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ongoing Treatments",
                style: detailStyle,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      _log.info("Editing an ongoing teatments");
                    },
                    child: Image.asset("assets/icons/edit.png"),
                  ),
                  SizedBox(width: size.width * .04235692959),
                  InkWell(
                    onTap: () {
                      _log.info("Deleting an ongoing teatments");
                    },
                    child: Image.asset("assets/icons/delete.png"),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
