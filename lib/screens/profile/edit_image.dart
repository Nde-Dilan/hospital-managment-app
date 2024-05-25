import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/utils/option_list.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_inkwell.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
import 'package:provider/provider.dart';
import 'package:hospital_managment_app/styles/palette.dart';

class EditImagePage extends StatelessWidget {
  const EditImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();

    return Scaffold(
      backgroundColor: palette.trueWhite,
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
          'Edit Image',
          style: TextStyle(
              color: palette.violet, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: ResponsiveScreen(
          squarishMainArea: Image.asset(
            "assets/icons/account-big.png",
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          rectangularMenuArea: Column(
            children: [
              CustomInkWell(
                name: editImageOptionList[0]["name"].toString(),
                onTap: editImageOptionList[0]["onTap"].toString(),
                style: editImageOptionList[0]["style"] as TextStyle,
                icon: editImageOptionList[0]["icon"] as IconData,
              ),
              CustomInkWell(
                name: editImageOptionList[1]["name"].toString(),
                onTap: editImageOptionList[1]["onTap"].toString(),
                style: editImageOptionList[1]["style"] as TextStyle,
                icon: editImageOptionList[1]["icon"] as IconData,
              ),
            ],
          )),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 3,
      ),
    );
  }
}
