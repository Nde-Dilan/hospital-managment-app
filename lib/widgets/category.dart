import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:provider/provider.dart';

class Category extends StatelessWidget {
  final String name;
  final String path;
  final String goTo;
  const Category({
    required this.path,
    required this.name,
    required this.goTo,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    const double margin = 1.9;
    const double padding = 9;
    const double imgTextH = 9;

    return Opacity(
      opacity: 1,
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).go(goTo);
        },
        child: Card(
            margin: const EdgeInsets.all(margin),
            color: palette.category,
            child: Padding(
              padding: const EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    // height: 121,
                    decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: SvgPicture.asset(path),
                    ),
                  ),
                  const SizedBox(
                    height: imgTextH,
                  ),
                  Text(name,
                      style: TextStyle(
                          fontSize: 12,
                          color: palette.textDark,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            )),
      ),
    );
  }
}
