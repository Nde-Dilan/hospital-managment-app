import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.topSpacing,
      required this.radius,
      this.goTo,
      this.top,
      this.left,
      this.width,
      this.height,
      required this.title,
      this.name,
      required this.horizontalSpacing,
      required this.fontSize,
      required this.spacing,
      required this.bottomSpacing,
      this.notifBtn,
      this.accountBtn,
      required this.positionedWidget,
      required this.mainAxisAlignment,
      this.widthFactor = .7, this.containerHeight});

  /// Spacing from the top of the phone to the stack
  final double topSpacing;
  final double radius;

  /// Where to go when we click on back button(or icon )
  final String? goTo;

  /// Values for the positionned element
  final double? top;
  final double? left;
  final double? width;
  final double widthFactor;
  final double? height;
  final double? containerHeight;

  /// Title after the back icon
  final String title;

  /// Name of the client if the page needs it
  final String? name;

  /// Spacing between back button and [title]
  final double horizontalSpacing;

  /// Fontsize of [title]
  final double fontSize;

  /// Spacing between back button and the phone's border
  final double spacing;

  /// Spacing between [positionedWidget]  and the bottom of the stack
  final double bottomSpacing;

  ///Icon of any notification button
  final Widget? notifBtn;

  ///Icon of any account button
  final Widget? accountBtn;

  final Widget positionedWidget;
  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: topSpacing),
          height: containerHeight ?? (MediaQuery.of(context).size.height * 0.25) + bottomSpacing,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: palette.violet,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius)),
          ),
        ),
        Positioned(
          top: 15,
          right: 45,
          child: InkWell(
            onTap: () {
              GoRouter.of(context).go('/home/notifications');
            },
            child: Container(
              margin: const EdgeInsets.only(top: 10.0),
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
              ),
              child: const Image(
                  image: AssetImage('assets/icons/notification.png')),
            ),
          ),
        ),
        const Positioned(
            top: 85,
            left: 22,
            child: Column(
              children: [
                Text(
                  "View Appointments,",
                  style: TextStyle(fontSize: 14, color: Color(0xffF3F0F0)),
                ),
                Text(
                  "John Doe William",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ],
            )),
        Positioned(
            // bottom: -4,
            child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            SizedBox(
              width: spacing,
            ),
            InkWell(
              onTap: () {
                goTo == null
                    ? GoRouter.of(context).pop()
                    : GoRouter.of(context).go(goTo!);
              },
              child: Container(
                padding: const EdgeInsets.all(8),
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
            SizedBox(
              width: size.width * widthFactor,
              child: Text(
                title,
                style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).go('/home/profile');
                },
                child: Container(
                  // width: MediaQuery.of(context).size.width * 0.235,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(2.0),
                    child: Image(
                        width: 55,
                        image: AssetImage('assets/icons/account.png')),
                  ),
                ),
              ),
            ),
          ],
        )),
        Positioned(
          top: top,
          left: left,
          width: width,
          height: height,
          child: positionedWidget,
        ),
      ],
    );
  }
}
