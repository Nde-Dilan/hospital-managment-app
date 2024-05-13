import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
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
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: palette.trueWhite,
          leading: GestureDetector(
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
                color: palette.violet,
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: palette.trueWhite,
        body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Stack(
                children: [
                  Image.asset(
                    "assets/icons/account-big.png",
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                      bottom: 20,
                      right: 0,
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
                          )))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "John Doe William",
                style: style,
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  shrinkWrap: true,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: optionList.length,
                  itemBuilder: (context, index) {
                    return CustomInkWell(
                      name: optionList[index]["name"].toString(),
                      onTap: optionList[index]["onTop"].toString(),
                      style: optionList[index]["style"] as TextStyle,
                      icon: optionList[index]["icon"] as IconData,
                    );
                  }),
              /*ListView(
                shrinkWrap: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  CustomInkWell(
                    name: "Edit Personal Details",
                    onTap: "/home",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: palette.textDark),
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInkWell(
                    name: "Edit Personal Details",
                    onTap: "/home",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: palette.textDark),
                    icon: Icons.person_outline,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomInkWell(
                    name: "Edit Personal Details",
                    onTap: "/home",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: palette.textDark),
                    icon: Icons.person_outline,
                  ),
                ],
              )*/
            ])));
  }
}
