import 'package:agency/providers/service_provider.dart';
import 'package:agency/screens/onboarding_screen.dart';
import 'package:agency/screens/select_service_screen.dart';
import 'package:agency/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'screens/accueil_screen.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ServiceProvider()),
    Provider(create: (context) => const StartScreen()),
    Provider(create: (context) => const SelectService()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, _) {
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
        home: const AccueilScreen(),
        routes: {
          OnBoardingScreen.routeName:(context) => const OnBoardingScreen()
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case "/start":
              return MaterialPageRoute(builder: (_) => const StartScreen());
            default:
              return null;
          }
        },
      );
    });
  }
}
