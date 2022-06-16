import 'package:agency/widgets/background_image.dart';
import 'package:agency/widgets/connection_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class AuthentificationScreen extends StatefulWidget {
  const AuthentificationScreen({Key? key}) : super(key: key);
  @override
  _AuthentificationScreen createState() =>  _AuthentificationScreen();
}

class _AuthentificationScreen extends State<AuthentificationScreen> {
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
                const SizedBox(
                  height: 30,
                ),
                ConnectionButton(
                    text: 'Se connecter',
                    onPressed: () {
                      login(context);
                    }),
                const SizedBox(
                  height: 20,
                ),
                ConnectionButton(
                    text: 'S\'inscrire',
                    onPressed: () {
                      register(context);
                    }),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
