import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_managment_app/screens/home/appointements.dart';
import 'package:hospital_managment_app/screens/home_page.dart';
import 'package:hospital_managment_app/screens/landing_page.dart';
import 'package:hospital_managment_app/screens/auth/sign_in.dart';
import 'package:hospital_managment_app/screens/auth/sign_up.dart';

//Since using print() will reduce the app's performance we can use this
import 'package:logging/logging.dart';

//Containing a set of constant value helping us to do cross platform stuff and more
import 'package:flutter/foundation.dart';

//To create routes within our application
import 'package:go_router/go_router.dart';

void main() {
  if (kDebugMode) {
    // Log more when in debug mode.
    Logger.root.level = Level.FINE;
  }

  // Subscribe to log messages.
  Logger.root.onRecord.listen((record) {
    final message = '${record.level.name}: ${record.time}: '
        '${record.loggerName}: '
        '${record.message}';

    debugPrint(message);
  });

  _log.info('Going full screen');
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );
  runApp(const MyApp());
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  static final _router = GoRouter(routes: <RouteBase>[
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const LandingPage(),
        routes: [
          GoRoute(
            path: 'sing-in',
            builder: (BuildContext context, GoRouterState state) =>
                const SignInPage(),
          ),
          GoRoute(
            path: 'sing-up',
            builder: (context, state) => const SignUpPage(),
          ),
          GoRoute(
            path: 'forgot-password',
            builder: (context, state) => const SignUpPage(),
          ),
          
        ]),
    GoRoute(
        path: "/home",
        builder: (BuildContext context, GoRouterState state) =>
            const HomePage(),
        routes: [
          GoRoute(
            path: 'appointements',
            builder: (BuildContext context, GoRouterState state) =>
                const AppointementsPage(),
          ),
          GoRoute(
            path: 'lab_test',
            builder: (context, state) => const AppointementsPage(),
          ),
          GoRoute(
            path: 'payment',
            builder: (context, state) => const AppointementsPage(),
          ),
          GoRoute(
            path: 'prescriptions',
            builder: (context, state) => const AppointementsPage(),
          ),
          GoRoute(
            path: 'history',
            builder: (context, state) => const AppointementsPage(),
          ),
          GoRoute(
            path: 'downloads',
            builder: (context, state) => const AppointementsPage(),
          ),
        ]),
  ]);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          primaryColor: Colors.deepPurple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Poppins'),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
