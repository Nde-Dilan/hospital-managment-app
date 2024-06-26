import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_managment_app/screens/appointments/current_appointments.dart';
import 'package:hospital_managment_app/screens/appointments/set_appointments_page.dart';
import 'package:hospital_managment_app/screens/auth/signin_screen.dart';
import 'package:hospital_managment_app/screens/auth/signup_screen.dart';
import 'package:hospital_managment_app/screens/doctor/welcome_page.dart';
import 'package:hospital_managment_app/screens/lab/lab_results_page.dart';
import 'package:hospital_managment_app/screens/lab/lab_test_page.dart';
import 'package:hospital_managment_app/screens/appointments/appointments.dart';
import 'package:hospital_managment_app/screens/appointments/appointment_page.dart';
import 'package:hospital_managment_app/screens/notifications/notification_page.dart';
import 'package:hospital_managment_app/screens/payment/congrats.dart';
import 'package:hospital_managment_app/screens/payment/payment_method.dart';
import 'package:hospital_managment_app/screens/payment/payment_with_page.dart';
import 'package:hospital_managment_app/screens/home/home_page.dart';
import 'package:hospital_managment_app/screens/prescriptions/prescription_page.dart';
import 'package:hospital_managment_app/screens/profile/edit_image.dart';
import 'package:hospital_managment_app/screens/profile/personal_details.dart';
import 'package:hospital_managment_app/screens/profile/profile.dart';
import 'package:hospital_managment_app/screens/welcome_screen.dart';
import 'package:hospital_managment_app/styles/palette.dart';
import 'package:hospital_managment_app/wrapper/app_lifecycle.dart';

//Since using print() will reduce the app's performance we can use this
import 'package:logging/logging.dart';

//Containing a set of constant value helping us to do cross platform stuff and more
import 'package:flutter/foundation.dart';

//To create routes within our application
import 'package:go_router/go_router.dart';

//To manage state within the app
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
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
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.top],
  );
  runApp(const MyApp());
}

Logger _log = Logger('main.dart');

class MyApp extends StatelessWidget {
  //This contains all the routes of our app (atleast what we are using now)
  static final _router = GoRouter(routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const WelcomeDoctor(),
    ),
    GoRoute(
        path: '/auth',
        builder: (BuildContext context, GoRouterState state) =>
            const SignInScreen(),
        routes: [
          GoRoute(
            path: 'sign-in',
            builder: (BuildContext context, GoRouterState state) =>
                const SignInScreen(),
          ),
          GoRoute(
            path: 'forgot-password',
            builder: (context, state) => const SignUpScreen(),
          ),
        ]),
    GoRoute(
        path: "/home/:isDoctor",
        builder: (BuildContext context, GoRouterState state){

          _log.info("This is the value of extra: ${state.pathParameters['isDoctor']}");

    
          final bool isDoctor = bool.parse(state.pathParameters['isDoctor']!);
            return  HomePage(isDoctor:isDoctor);
        },
        routes: [
          GoRoute(
            path: "set-appointment",
            builder: (BuildContext context, GoRouterState state) =>
                const SetAppointmentPage(
              name: 'Dr. Jenny Wilson',
              speciality: 'Dental Surgeon',
              rating: '4.8',
            ),
          ),
          GoRoute(
            path: "notifications",
            builder: (BuildContext context, GoRouterState state) =>
                const NotificationPage(),
          ),
          GoRoute(
              path: 'profile',
              builder: (BuildContext context, GoRouterState state) =>
                  const ProfileScreen(),
              routes: [
                GoRoute(
                  path: 'personal-details',
                  builder: (BuildContext context, GoRouterState state) =>
                      const PersonalDetails(),
                ),
                GoRoute(
                  path: 'edit-image',
                  builder: (BuildContext context, GoRouterState state) =>
                      const EditImagePage(),
                ),
              ]),
          GoRoute(
              path: 'appointments',
              builder: (BuildContext context, GoRouterState state) =>
                  const AppointmentsPage(),
              routes: [
                GoRoute(
                  path: 'current-appointment',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CurrentAppointmentsPage(),
                ),
                GoRoute(
                  path: 'my-appointment',
                  builder: (BuildContext context, GoRouterState state) =>
                      const Appointmentpage(),
                ),
                GoRoute(
                  path: 'appointment-history',
                  builder: (BuildContext context, GoRouterState state) =>
                      const Appointmentpage(),
                ),
              ]),
          GoRoute(
            path: 'lab-test',
            builder: (context, state) => const LabTesPage(),
          ),
          GoRoute(
              path: 'payment',
              builder: (context, state) => const PaymentMethodPage(),
              routes: [
                GoRoute(
                  path: 'mtn',
                  builder: (BuildContext context, GoRouterState state) =>
                      const PaymentWith(
                    operator: 'MTN',
                    isMTNFirst: true,
                    image: "assets/images/mtn-mobile-money.png",
                  ),
                ),
                GoRoute(
                  path: 'orange',
                  builder: (BuildContext context, GoRouterState state) =>
                      const PaymentWith(
                    operator: 'Orange',
                    isMTNFirst: false,
                    image: "assets/images/orange-money.png",
                  ),
                ),
                GoRoute(
                  path: 'congrats',
                  builder: (BuildContext context, GoRouterState state) =>
                      const CongratsPage(),
                ),
              ]),
          GoRoute(
            path: 'prescriptions',
            builder: (context, state) => const PrescriptionPage(),
          ),
          GoRoute(
            path: 'history',
            builder: (context, state) => const AppointmentsPage(),
          ),
          GoRoute(
            path: 'downloads',
            builder: (context, state) => const AppointmentsPage(),
          ),
        ]),
  ]);

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AppLifecycleObserver(
      child: MultiProvider(
        providers: [
          /// ChangeNotifierProvider(create: (_) => Counter()),
          ///
          /// Providing the palette to the whole application. To access it, just use
          /// final palette = context.watch<Palette>();
          Provider(
            create: (context) => Palette(),
          ),
        ],
        child: Builder(builder: (context) {
          final palette = context.watch<Palette>();
          return MaterialApp.router(
            title: 'Flutter Demo',
            theme: ThemeData.from(
              colorScheme: ColorScheme.fromSeed(
                seedColor: palette.darkViolet,
                background: palette.backgroundMain,
              ),
              textTheme: TextTheme(
                bodyMedium: TextStyle(
                  color: palette.trueWhite,
                ),
              ),
            ),
            routerConfig: _router,
            debugShowCheckedModeBanner: false,
          );
        }),
      ),
    );
  }
}
