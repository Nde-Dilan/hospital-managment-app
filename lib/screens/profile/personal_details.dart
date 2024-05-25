import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:hospital_managment_app/widgets/custom_text_form_field.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  static final _log = Logger('personal_details.dart');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    const verticalSpacing = 9.0;
    const fontSize = 29.0;
    const topSpacing = 25.0;
    const radius = 20.0;
    const String name = "Jonh Doe William";

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ResponsiveScreen(
        squarishMainArea: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: topSpacing),
              height: MediaQuery.of(context).size.height * 0.25,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: palette.violet,
                borderRadius: const BorderRadius.only(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(50)),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_sharp,
                        size: 30,
                        color: palette.textDark,
                      ),
                    ),
                  ),
                  const SizedBox(
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
                                image: AssetImage(
                                    'assets/icons/notification.png'))),
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
                        name,
                        style: TextStyle(
                          fontSize: fontSize,
                          color: palette.textDark,
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
        rectangularMenuArea: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Change Username",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: palette.textDark,
                          fontSize: 18),
                    ),
                    CustomTextFormField(
                      obscureText: false,
                      icon: null,
                      errorMessage: 'Please enter New Name',
                      hintText: 'Enter New Name',
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Text(
                      "Change Password",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: palette.textDark,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFormField(
                            obscureText: true,
                            icon: Icons.visibility_off_rounded,
                            errorMessage: 'Please enter Old Password',
                            hintText: 'Old Password',
                          ),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        Expanded(
                          child: CustomTextFormField(
                            obscureText: true,
                            icon: Icons.remove_red_eye,
                            errorMessage: 'Please enter New Password',
                            hintText: 'New Password',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      "Change Your Phone Number",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: palette.textDark,
                          fontSize: 18),
                    ),
                    CustomTextFormField(
                      obscureText: false,
                      icon: null,
                      prefixIcon: Icons.phone_android,
                      errorMessage: 'Please Enter Phone Number',
                      hintText: '+237 694 52 59 31',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    Text(
                      "Change Your Email Address",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: palette.textDark,
                          fontSize: 18),
                    ),
                    CustomTextFormField(
                      obscureText: false,
                      icon: null,
                      prefixIcon: Icons.mail,
                      errorMessage: 'Please Enter Valid Email',
                      hintText: 'john@gmail.com',
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    const Center(
                      child: CustomButton(
                        text: "Save Changes",
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(
        page: 3,
      ),
    );
  }
}
