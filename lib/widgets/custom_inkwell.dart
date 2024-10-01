import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/screens/auth/auth_service.dart';
import 'package:hospital_managment_app/utils/methods.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

import 'package:hospital_managment_app/styles/palette.dart';


Logger _log = Logger('custom_inkwell.dart');

class CustomInkWell extends StatelessWidget {
  final String onTap;
  final String name;
  final bool? editImage;
  final ImageSource? gallery;
  final TextStyle style;
  final IconData icon;

  const CustomInkWell(
      {required this.onTap,
      required this.style,
      required this.name,
      required this.icon,
      super.key,
      this.editImage,
      this.gallery});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final User user = context.watch<UserNotifier>().getUser();

    AuthService authService = AuthService();

    return InkWell(
      onTap: () {
        if (name == "Logout") {
          authService.signOut();
        }
        if (editImage != null && editImage == true && gallery != null) {
          getImage(gallery!);
          return;
        }

        GoRouter.of(context).go(onTap);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
            color: const Color(0xffDFDDDD).withOpacity(0.2),
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
              color: palette.violet,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: style,
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 30,
              color: palette.violet,
            ),
          ],
        ),
      ),
    );
  }
}


Future<void> getImage(ImageSource source) async {
  final picker = ImagePicker();
  final image = await picker.pickImage(source: source);

  if (image != null) {
    // Handle the picked image (e.g., display, upload)
    final imageFile = File(image.path);


    _log.info("Image selected, ${imageFile.path}");
  
  } else {
    // Handle canceled pick operation (optional)
    _log.info('User canceled image selection');
  }
}