import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/utils/option_list.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_inkwell.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:hospital_managment_app/styles/palette.dart';

class EditImagePage extends StatelessWidget {
  const EditImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final User user = context.watch<UserNotifier>().getUser();

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
          squarishMainArea: CircleAvatar(
            radius: 50.0,
            backgroundImage: AssetImage(user.image),
          ),
          rectangularMenuArea: Column(
            children: [
              CustomInkWell(
                 editImage: true,
                gallery:ImageSource.gallery,
                name: editImageOptionList[0]["name"].toString(),
                onTap: editImageOptionList[0]["onTap"].toString(),
                style: editImageOptionList[0]["style"] as TextStyle,
                icon: editImageOptionList[0]["icon"] as IconData,
              ),
              CustomInkWell(
                editImage: true,
                gallery:ImageSource.camera,
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
