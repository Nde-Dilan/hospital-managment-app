import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
import 'package:provider/provider.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final palette = context.watch<Palette>();

    return  Scaffold(
       backgroundColor: palette.violet,
      body: ResponsiveScreen(
        mainAreaProminence: 0.45,
        squarishMainArea: Container(),
        rectangularMenuArea: Container(),
      )
    );
  }
}
