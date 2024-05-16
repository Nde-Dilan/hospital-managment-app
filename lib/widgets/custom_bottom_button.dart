import 'package:flutter/material.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class CustomMaterialButton extends StatefulWidget {
  final Function()? onPressed;
  final bool isActive;
  final IconData icon;
  const CustomMaterialButton(
      {super.key,
      required this.onPressed,
      required this.isActive,
      required this.icon});

  @override
  State<CustomMaterialButton> createState() => _CustomMaterialButtonState();
}

class _CustomMaterialButtonState extends State<CustomMaterialButton> {
  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return MaterialButton(
      highlightColor: palette.trueWhite,
      splashColor: palette.trueWhite,
      onPressed: widget.onPressed,
      child: Container(
        decoration: widget.isActive
            ? BoxDecoration(
                color: palette.violet,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(9),
                    bottomRight: Radius.circular(9),
                    topLeft: Radius.circular(9),
                    topRight: Radius.circular(9)),
              )
            : null,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Icon(widget.icon, color: widget.isActive ? palette.trueWhite : null),
        ),
      ),
    );
  }
}
