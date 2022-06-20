import 'package:agency/screens/start_screen.dart';
import 'package:agency/widgets/background_image.dart';
import 'package:agency/widgets/button_custom.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

  void _accueil(BuildContext context) {
    Navigator.pushNamed(context, StartScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: <Widget>[
        const BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body:  Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  child:  AutoSizeText(
                  'Agence Virtuelle',
                  style: TextStyle(
                    fontSize: 40.r,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                fit: BoxFit.contain,
                ),
               
                SizedBox(
                  height: 120.h,
                ),
                FittedBox(
                  child: AutoSizeText(
                  'Bienvenue sur l\'application\nde gestion de votre agence',
                  style: TextStyle(
                    fontSize: 25.r,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                ),
                fit: BoxFit.contain
                )
                ,
                 SizedBox(
                  height: 20.h,
                ),  
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.12),
                  child: ButtonCustom(text: 'Accéder à mon agence', color: const Color(0xFF4169E1), onPressed:  () {
                        _accueil(context);
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
      
      ],
    );
  }
}
