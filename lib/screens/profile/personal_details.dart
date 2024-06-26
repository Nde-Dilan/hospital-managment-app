import 'package:flutter/material.dart';
import 'package:hospital_managment_app/models/user.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/bottom_nav_bar.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:hospital_managment_app/widgets/custom_stack.dart';
import 'package:hospital_managment_app/widgets/custom_text_form_field.dart';
import 'package:hospital_managment_app/widgets/responsive_screen.dart';
// import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class PersonalDetails extends StatefulWidget {
  const PersonalDetails({super.key});

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  // static final _log = Logger('personal_details.dart');

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController usernameTextController = TextEditingController();

  final TextEditingController passwordTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<Palette>();
    final Size size = MediaQuery.of(context).size;

    const fontSize = 29.0;
    double textSize = size.width * 0.049;
    const radius = 20.0;
    final User user = context.watch<UserNotifier>().getUser();

    String name = user.name;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ResponsiveScreen(
        squarishMainArea: CustomStack(
            accountBtn: const Text(""),
            notifBtn: const Text(""),
            topSpacing: 0,
            radius: radius,
            horizontalSpacing: 2,
            fontSize: textSize,
            title: "Edit Personal details",
            mainAxisAlignment: MainAxisAlignment.start,
            positionedWidget: Container(
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
            ),
            top: 105,
            spacing: 2,
            bottomSpacing: 10),
        rectangularMenuArea: Padding(
          padding: EdgeInsets.all(size.width * 0.019),
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
                          fontSize: textSize),
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
                          fontSize: textSize),
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
                          fontSize: textSize),
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
                          fontSize: textSize),
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
                        width: 145,
                        radius: 14,
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
