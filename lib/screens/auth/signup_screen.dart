import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/models/doctor.dart';
import 'package:hospital_managment_app/notifiers/Is_doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/doctor_notifier.dart';
import 'package:hospital_managment_app/notifiers/patient_notifier.dart';
import 'package:hospital_managment_app/notifiers/user_notifier.dart';
import 'package:hospital_managment_app/screens/auth/auth_service.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/utils/methods.dart';
import 'package:hospital_managment_app/widgets/custom_button.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

Logger _log = Logger('signup_screen.dart');

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  final TextEditingController _phonenumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  AuthService authService = AuthService();

  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final palette = context.watch<Palette>();

    final bool isDoctor = context.watch<IsDoctorNotifier>().isDoctor;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formSignupKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top "Get Started" text
                  const Center(
                    child: Text(
                      'Create New Account',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF7B61FF),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40.0),

                  // Full name label and text field
                  const Text(
                    'Full Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: _fullNameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your full name',
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
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
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
                  SizedBox(height: size.width * 0.0419),

                  // Mobile number label and text field
                  const Text(
                    'Mobile Number',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  TextFormField(
                    controller: _phonenumberController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your mobile number',
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
                  SizedBox(height: size.width * 0.0072509),

                  // Password label and text field with visibility toggle
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black45,
                    ),
                  ),
                  SizedBox(height: size.width * 0.0082509),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    obscuringCharacter: '*',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
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
                  // Sign up button
                  SizedBox(height: size.width * 0.082509),
                  CustomButton(
                    text: "Sign Up ",
                    radius: 15,
                    onTap: () async {
                      if (_formSignupKey.currentState!.validate()) {
                        final UserCredential? userCredential = await authService
                            .signUp((error) {
                          showErrorDialog(context, 'Sign Up Error', error);
                        },
                                _fullNameController.text,
                                _emailController.text,
                                _passwordController.text,
                                _phonenumberController.text);
                        if (userCredential != null) {
                          _log.info("Got you user for sign up");
                          if (!context.mounted) return;
                          //Take a look at the usercredential object, check if the user signing in is a doc or a patient and create a new user we will be using throughout the app
                          Provider.of<UserNotifier>(context,
                                listen: false);
                            context
                                .watch<UserNotifier>()
                                .createUserFromFirebase(userCredential.user,isDoctor);
                          GoRouter.of(context).go("/home");
                        } else {
                           _log.info("User credentials was null");
                        }
                      }
                    },
                  ),
                  SizedBox(height: size.width * 0.082509),
                  // Sign up with divider
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
                  SizedBox(height: size.width * 0.082509),

                  // Sign up social media logos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () async {
                            final UserCredential? userCredential =
                                await authService.signInWithGoogle((error) {
                              showErrorDialog(context, 'Sign In Error', error);
                            });

                            if (userCredential != null) {
                              _log.info("User registered with Google Okay!");

                              if (!context.mounted) return;
                              GoRouter.of(context).go("/home");
                            } else {}
                          },
                          child: Brand(Brands.google)),
                      Brand(Brands.facebook),
                    ],
                  ),
                  SizedBox(height: size.width * 0.082509),

                  // Already have an account
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account? ',
                        style: TextStyle(color: Colors.black45),
                      ),
                      GestureDetector(
                        onTap: () {
                          GoRouter.of(context).go("/auth");
                        },
                        child: const Text(
                          'Sign in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF7B61FF),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
