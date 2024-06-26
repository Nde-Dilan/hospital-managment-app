import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/Is_doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:hospital_managment_app/widgets/custom_inkwell.dart';
import 'package:hospital_managment_app/utils/option_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final style = TextStyle(
        color: palette.textDark, fontSize: 19, fontWeight: FontWeight.bold);
    final User user = context.watch<UserNotifier>().getUser();
    final bool isDoctor = context.watch<IsDoctorNotifier>().isDoctor;

    String name = user.name;
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
      backgroundColor: palette.trueWhite,
      body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Stack(
          children: [
            CircleAvatar(
              radius: 70.0,
              backgroundImage: AssetImage(
                  user.image),
            ),
            Positioned(
                bottom: 20,
                right: 0,
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).go("/home/profile/edit-image");
                  },
                  child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: palette.violet,
                        border: Border.all(width: 4, color: palette.violet),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.edit,
                        size: 15,
                        color: palette.textDark,
                      )),
                ))
          ],
        ),
        Text(
          name,
          style: style,
        ),
        const SizedBox(
          height: 8.0,
        ),
        ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 1.0),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: optionList.length,
            itemBuilder: (context, index) {
              if (isDoctor && index == 2) {
                return const SizedBox.shrink();
              } else {
                return CustomInkWell(
                  name: optionList[index]["name"].toString(),
                  onTap: optionList[index]["onTap"].toString(),
                  style: optionList[index]["style"] as TextStyle,
                  icon: optionList[index]["icon"] as IconData,
                );
              }
            }),
      ])),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 3,
      ),
    );
  }
}
