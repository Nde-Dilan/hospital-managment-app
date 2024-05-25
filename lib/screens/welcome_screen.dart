import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hospital_managment_app/widgets/custom_scaffold.dart';
import 'package:logging/logging.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';

Logger _log = Logger('welcome_screen.dart');

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      _log.info("Going to login screen in 4 seconds");
      // Navigate to login screen after the delay

      GoRouter.of(context).go("/auth");

      _log.info("What's happening after 4 seconds");
    });
  }

  @override
  Widget build(BuildContext context) {
    return const CustomScaffold();
  }
}
