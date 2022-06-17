import 'package:agency/providers/identification.provider.dart';
import 'package:agency/providers/notif.provider.dart';
import 'package:agency/screens/identification_screen.dart';
import 'package:agency/screens/login_screen.dart';
import 'package:agency/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'package:provider/provider.dart';


import 'screens/accueil_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers : [
        ChangeNotifierProvider(create: (context) {
          return IdentificationProvider();
        }),
        ChangeNotifierProvider(create: (context) {
          return NotifProvider();
        }),
      ], 
      child: ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agence Virtuelle',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              bodyText2: const TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline6: const TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
        ),
        // home: IdentificationScreen(),
        home: const AccueilScreen(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/login":
              return MaterialPageRoute(builder: (_) => const StartScreen());
            case "/identification":
              return MaterialPageRoute(builder: (_) => IdentificationScreen());

            default:
              return null;
          }
        },
      );
    }),
    ); 
  }
}
