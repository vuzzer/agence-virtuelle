import 'dart:async';
import 'dart:math';

import 'package:agency/animation/fade_animation.dart';
import 'package:agency/models/custom_icon.dart';
import 'package:agency/models/service.dart';
import 'package:agency/screens/select_service_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartScreen extends StatefulWidget {
  static const routeName = '/start';
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartScreen> {
  final List<CustomIcon> services = [
    CustomIcon(name: 'Identification', icon: Icons.person ),
    CustomIcon(name: 'Remplacement\nSIM',icon: Icons.sim_card),
    CustomIcon(name: 'Moov Shop', icon: Icons.badge), //information commerciales
    CustomIcon(name: 'Initiation\nde requêtes', icon: Icons.contact_support),
    CustomIcon(name: 'Moov money',
      icon: Icons.swap_horiz), //transert d'argent
    CustomIcon(name: 'Moov SIM',
       icon: Icons.production_quantity_limits), //vente aux enchères
  ];

  int selectedService = 4;

  @override
  void initState() {
    // Randomly select from service list every 2 seconds
    Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        selectedService = Random().nextInt(services.length);
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 60.h,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          height: MediaQuery.of(context).size.height * 0.45,
          width: MediaQuery.of(context).size.width,
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 1.0,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemCount: services.length,
              itemBuilder: (BuildContext context, int index) {
                return FadeAnimation(
                    (1.0 + index) / 4,
                    serviceContainer(
                        services[index].icon, services[index].name, index));
              }),
        ),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80),
                  topRight: Radius.circular(80),
                )),
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Center(
                        child: Text(
                          'Un moyen simple, securisé et efficace pour prendre en main mes opérations dans une agence Moov',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10.h,
                ),
                FadeAnimation(
                    1.5,
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 30.sp),
                      child: Center(
                        child: Text(
                          'Nous mettons à votre dispositon des opérations d\'agence.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    )),
                  SizedBox(
                  height: 19.h,
                ),
                FadeAnimation(
                    1.5,
                    Padding(
                      padding: EdgeInsets.all(5.sp),
                      child: MaterialButton(
                        elevation: 0,
                        color: Colors.black,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SelectService(),
                            ),
                          );
                        },
                        height: 55,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: const Center(
                          child: Text(
                            'Demarrer',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
          ),
        )
      ],
    ));
  }

  serviceContainer(IconData icon, String name, int index) {
    return GestureDetector(
      onTap: () {},
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: selectedService == index ? Colors.white : Colors.grey.shade100,
          border: Border.all(
            color: selectedService == index
                ? Colors.blue.shade100
                : Colors.grey.withOpacity(0),
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Icon(icon, size: 20, color: const Color(0xFFF15412)),
              const SizedBox(
                height: 20,
              ),
              FittedBox(child: AutoSizeText(
                name,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 10),
              ))
            ]),
      ),
    );
  }
}
