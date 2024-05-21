import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:hospital_managment_app/styles/palette.dart';

class EditImagePage extends StatelessWidget {
  const EditImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: palette.trueWhite,
        leading: InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 30,
            color: palette.textDark,
          ),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
              color: palette.violet, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      // body: ResponsiveScreen(squarishMainArea: Text(), rectangularMenuArea: rectangularMenuArea),
    );
  }
}
