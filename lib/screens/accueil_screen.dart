import 'package:agency/widgets/background_image.dart';
import 'package:agency/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AccueilScreen extends StatefulWidget {
  const AccueilScreen({Key? key}) : super(key: key);
  @override
  _AccueilScreen createState() =>  _AccueilScreen();
}

class _AccueilScreen extends State<AccueilScreen> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  void register(BuildContext context) {
    Navigator.pushNamed(context, '/register');
  }

  void login(BuildContext context) {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Agence Virtuelle',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Bienvenue sur l\'application de gestion de votre agence',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,

                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                 SizedBox(
                  height: size.height * 0.2,
                ),  
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                  child: ButtonCustom(text: 'Accéder à mon agence', color: const Color(0xFF4169E1), onPressed:  () {
                        login(context);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
