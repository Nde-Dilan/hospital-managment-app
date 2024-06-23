import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_switch.dart';
import 'package:provider/provider.dart';

class MedicationWidget extends StatefulWidget {
  const MedicationWidget({super.key, required this.name});
  final String name;

  @override
  State<MedicationWidget> createState() => _MedicationWidgetState();
}

class _MedicationWidgetState extends State<MedicationWidget> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final Size size = MediaQuery.of(context).size;

    TextStyle headerStyle = TextStyle(
        fontSize: 20, fontWeight: FontWeight.w500, color: palette.textDark);
    return Column(
      children: [
        Row(
          children: [
            Row(
              children: [
                Image.asset("assets/icons/capsule.png"),
                Text(
                  widget.name,
                  style: headerStyle,
                )
              ],
            ),
            const SwitchWidget()
          ],
        ),
        const Row(
          children: [
            Icon(Icons.repeat),
            Text("Two times Daily"),
          ],
        ),
        const Row(
          children: [
            Icon(Icons.settings_backup_restore_rounded),
            Text("Morning"),
            Text("08:00AM"),
          ],
        ),
        const Row(
          children: [
            Text("Evening"),
            Text("09:00PM"),
          ],
        ),
        SizedBox(
          height: size.width * 0.019,
        ),
         const Row(
          children: [
            Icon(Icons.calendar_month_outlined),
            Text("Everyday"),
          ],
        ),
      ],
    );
  }
}
