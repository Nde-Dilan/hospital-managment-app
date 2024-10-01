import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hospital_managment_app/notifiers/Is_doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/screens/auth/auth_service.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:hospital_managment_app/screens/auth/signup_screen.dart';
import 'package:hospital_managment_app/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/utils/methods.dart';

import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

Logger _log = Logger('signin_screen.dart');

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool _obscurePassword = true;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  
  @override
  Widget build(BuildContext context) {
    final bool isDoctor = context.watch<IsDoctorNotifier>().isDoctor;

    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();
    AuthService authService = AuthService();

    return Scaffold(
        body: Transform(
          transform: Matrix4.rotationZ(pi / 2),
          child: Container(
              decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
              alignment: Alignment.center,
              repeat: ImageRepeat.noRepeat,
            ),
          )),
        ),
        bottomSheet: SingleChildScrollView(
          child: Container(
              height: size.height * 0.89,
              padding: const EdgeInsets.all(16.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Form(
                key: _formSignInKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top welcome text
                    const Center(
                      child: Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF7B61FF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 50.0),

                    // Email label and text field
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),

                    // Password label and text field with visibility toggle
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black45,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      obscuringCharacter: '*',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Password';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Password',
                        hintStyle: const TextStyle(color: Colors.black26),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black12),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: palette.violet,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 25.0),

                    // Remember me and Forgot password row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          child: Text(
                            'Forget password?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: lightColorScheme.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),

                    // Sign in button
                    SizedBox(height: size.width * 0.082509),
                    CustomButton(
                      text: "Sign In ",
                      radius: 15,
                      onTap: () async {
                        if (_formSignInKey.currentState!.validate()) {
                          final UserCredential? userCredential =
                              await authService.signIn((error) {
                            showErrorDialog(context, 'Sign In Error', error);
                          }, _emailController.text, _passwordController.text);
                          if (userCredential != null) {
                            _log.info("Got you user");

                            //Take a look at the usercredential object, check if the user signing in is a doc or a patient and create a new user we will be using throughout the app

                            if (!context.mounted) return;

                            Provider.of<UserNotifier>(context,
                                listen: false);
                            context
                                .watch<UserNotifier>()
                                .createUserFromFirebase(userCredential.user,isDoctor);
                            GoRouter.of(context).go("/home");
                          } else {}
                        }
                      },
                    ),
                    SizedBox(height: size.width * 0.082509),

                    // Sign in with divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.7,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '  OR  ',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.7,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25.0),

                    // Social media logos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Brand(Brands.facebook),
                        InkWell(
                            onTap: () async {
                              final UserCredential? userCredential =
                                  await authService.signInWithGoogle((error) {
                                showErrorDialog(
                                    context, 'Sign In Error', error);
                              });

                              if (userCredential != null) {
                                _log.info("Got you user, you are in now!");

                                if (!context.mounted) return;
                                GoRouter.of(context).go("/home");
                              } else {}
                            },
                            child: Brand(Brands.google)),
                      ],
                    ),
                    const SizedBox(height: 25.0),

                    // Don't have an account
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account? ',
                          style: TextStyle(color: Colors.black45),
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).go("/auth/sign-up");
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF7B61FF),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              )),
        ));
  }
}
