import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:hospital_managment_app/screens/auth/signin_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formSignupKey = GlobalKey<FormState>();
  bool agreePersonalData = true;
  bool _obscurePassword = true; // Variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(height: 25.0),

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
                          _obscurePassword ? Icons.visibility_off : Icons.visibility,
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

                  // I agree to the processing of personal data checkbox
                  Row(
                    children: [
                      Checkbox(
                        value: agreePersonalData,
                        onChanged: (bool? value) {
                          setState(() {
                            agreePersonalData = value!;
                          });
                        },
                        activeColor: const Color(0xFF7B61FF),
                      ),
                      const Text(
                        'I agree to the processing of ',
                        style: TextStyle(color: Colors.black45),
                      ),
                   const   Text(
                        'personal data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF7B61FF),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 25.0),

                  // Sign up button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B61FF), // Button background color
                      ),
                      onPressed: () {
                        if (_formSignupKey.currentState!.validate() && agreePersonalData) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        } else if (!agreePersonalData) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Please agree to the processing of personal data')),
                          );
                        }
                      },
                      child: const Text('Sign up'),
                    ),
                  ),
                  const SizedBox(height: 30.0),

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
                          'Sign up with',
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
                  const SizedBox(height: 30.0),

                  // Sign up social media logos
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Logo(Logos.facebook_f),
                      Logo(Logos.google),
                    ],
                  ),
                  const SizedBox(height: 25.0),

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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (e) => const SignInScreen()),
                          );
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
