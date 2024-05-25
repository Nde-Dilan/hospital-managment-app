import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';


class CustomStack extends StatelessWidget {
  final double topSpacing;
  final double radius;
  final String? name;
  final double verticalSpacing;
  final double fontSize;
  const CustomStack({super.key, required this.topSpacing, required this.radius, required this.verticalSpacing,  this.name, required this.fontSize});

  @override
  Widget build(BuildContext context) {
        final palette = context.watch<Palette>();

    return Stack(
      children: [
        Container(
          margin:  EdgeInsets.only(top: topSpacing),
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: palette.violet,
            borderRadius:  BorderRadius.only(
                bottomLeft: Radius.circular(radius),
                bottomRight: Radius.circular(radius)),
          ),
        ),
        Positioned(
            // top: 44,
            child: Container(
          margin: const EdgeInsets.only(top: 34.0),
          child: Row(
            children: [
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
                width: verticalSpacing,
              ),
              const Text(
                "Edit Personal details",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).go('/notifications');
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: const Padding(
                        padding: EdgeInsets.all(0.0),
                        child: Image(
                            image:
                                AssetImage('assets/icons/notification.png'))),
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
                      padding: EdgeInsets.all(12.0),
                      child: Image(
                          width: 55,
                          image: AssetImage('assets/icons/account.png')),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )),
        
        Positioned(
            top: 105,
            child: Container(
              margin: const EdgeInsets.all(18),
              child: Column(
                children: [
                  const Text("Edit your details,"),
                  Text(
                    "name",
                    style: TextStyle(
                      fontSize: fontSize,
                      color: palette.textDark,
                    ),
                  )
                ],
              ),
            ))
      ],
    );
  }
}
