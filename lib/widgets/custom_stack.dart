import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class CustomStack extends StatelessWidget {
  /// Spacing from the top to the stack
  final double topSpacing;
  final double radius;
  final String title;
  final String? name;
  final double horizontalSpacing;
  final double fontSize;
  final double spacing;
  final Widget? notifBtn;
  final Widget? accountBtn;
  final Widget positionedWidget;
  final MainAxisAlignment mainAxisAlignment;
  const CustomStack(
      {super.key,
      required this.topSpacing,
      required this.radius,
      required this.horizontalSpacing,
      this.name,
      required this.fontSize,
      required this.title,
      this.notifBtn,
      this.accountBtn,
      required this.mainAxisAlignment,
      required this.positionedWidget,
      required this.spacing});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: topSpacing),
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: palette.violet,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius)),
          ),
        ),
        Positioned(
            // top: 44,
            child: Container(
          margin: const EdgeInsets.only(top: 34.0),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              SizedBox(
                width: spacing,
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pop();
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: palette.trueWhite,
                    // border: Border.all(width: 4, color: palette.violet),
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_sharp,
                    size: 30,
                    color: palette.textDark,
                  ),
                ),
              ),
              SizedBox(
                width: horizontalSpacing,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )),
        Positioned(
          top: 105,
          child: positionedWidget,
        )
      ],
    );
  }
}
