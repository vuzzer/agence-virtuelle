import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
              child: Container(
        child: Column(children: <Widget>[
          Container(
            decoration: const  BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/happy.png'))),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text('Se connecter à'),
          const SizedBox(
            height: 5,
          ),
          const Text(
            'Agence virtuelle',
            style: const TextStyle(color: Color(0xFFF15412)),
          ),
          const SizedBox(
            height: 15,
          ),
        ]),
      ))),
    );
  }
}
