import 'package:agency/screens/verification_screen.dart';
import 'package:agency/widgets/button_custom.dart';
import 'package:agency/widgets/phone_number_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = "/login";
  const LoginScreen({Key? key}) : super(key: key);

  void push(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => VerificationScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Se connecter')),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 200,
                    width: 200,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/images/happy.png'))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Text(
                    'Se connecter à',
                    style: Theme.of(context).textTheme.headline6,
                  )),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    'Agence virtuelle',
                    style: TextStyle(color: Color(0xFFF15412), fontSize: 30),
                  ),
                  const SizedBox(
                    height: 66,
                  ),
                  PhoneNumberField(),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonCustom(
                    text: "Demande OPT",
                    color: Colors.black,
                    onPressed: () {
                      push(context);
                    },
                  ),
                ]),
          ),
        )));
  }
}
