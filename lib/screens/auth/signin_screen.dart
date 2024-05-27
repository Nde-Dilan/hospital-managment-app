import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:hospital_managment_app/screens/auth/signup_screen.dart';
import 'package:hospital_managment_app/theme/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formSignInKey = GlobalKey<FormState>();
  bool rememberPassword = true;
  bool _obscurePassword = true; // Variable to toggle password visibility

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formSignInKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top welcome text
                  const Center(
                    child: Text(
                      'Welcome',
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

                  // Remember me and Forgot password row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberPassword,
                            onChanged: (bool? value) {
                              setState(() {
                                rememberPassword = value!;
                              });
                            },
                            activeColor: lightColorScheme.primary,
                          ),
                          const Text(
                            'Remember me',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF7B61FF), // Button background color
                      ),
                      onPressed: () {
                        if (_formSignInKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }
                      },
                      child: const Text('Sign in'),
                    ),
                  ),
                  const SizedBox(height: 25.0),

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
                          'Sign in with',
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
                      Logo(Logos.facebook_f),
                      Logo(Logos.google),
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (e) => const SignUpScreen()),
                          );
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
            ),
          ),
        ),
      ),
    );
  }
}
