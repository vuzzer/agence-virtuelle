import 'dart:io';

import 'package:agency/animation/FadeAnimation.dart';
import 'package:agency/providers/identification.provider.dart';
import 'package:agency/screens/date_time_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:image_picker/image_picker.dart';

class IdentificationScreen extends StatefulWidget {
  IdentificationScreen({Key? key}) : super(key: key);

  @override
  State<IdentificationScreen> createState() => _IdentificationScreenState();
}

class _IdentificationScreenState extends State<IdentificationScreen> {
  int _activeStepIndex = 3;

  TextEditingController telController =
      TextEditingController(text: "010101001");
  TextEditingController telSecondaireController =
      TextEditingController(text: "0102020220");
  TextEditingController typeIDController = TextEditingController(text: "1");
  TextEditingController numeroIDController =
      TextEditingController(text: "19AV5619");
  TextEditingController lieuDelivranceIDController =
      TextEditingController(text: "Poy");
  TextEditingController emissionIDController =
      TextEditingController(text: "2020-06-06");
  TextEditingController expirationIDController =
      TextEditingController(text: "2023-06-06");
  TextEditingController civiliteController =
      TextEditingController(text: "Monsieur");
  TextEditingController nomController = TextEditingController(text: "Jonathan");
  TextEditingController prenomsController =
      TextEditingController(text: "Dieke");
  TextEditingController lieuNaissanceController =
      TextEditingController(text: "Treichville");
  TextEditingController dateNaissanceController =
      TextEditingController(text: "2000-12-23");
  TextEditingController professionController =
      TextEditingController(text: "Ingénieur développeur");
  TextEditingController adresseGeoController =
      TextEditingController(text: "Poy");
  TextEditingController nationaliteController =
      TextEditingController(text: "Ivoirienne");
  // TextEditingController photoIDController = TextEditingController();
  // TextEditingController photoRequerantController = TextEditingController();
  File photoRequerant = File("ok") , imageID = File("ok");

  final List<Map<String, dynamic>> _civiliteItems = [
    {
      'value': "Monsieur",
      'label': 'Monsieur',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': "Madame",
      'label': 'Madame',
    },
  ];
  final List<Map<String, dynamic>> _typeIDItems = [
    {
      'value': 1,
      'label': 'Passeport',
      // 'icon': Icon(Icons.stop),
    },
    {
      'value': 2,
      'label': 'Permis',
    },
    {
      'value': 3,
      'label': 'Attestation',
    },
    {
      'value': 4,
      'label': 'CNI',
    },
  ];

  List<Step> stepList() => [
        //carte SIM
        Step(
          state: _activeStepIndex <= 0 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 0,
          title: const Text('SIM'),
          content: Container(
            child: Column(
              children: [
                TextField(
                  controller: telController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'N° de tel.',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: telSecondaireController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'N° de tel. secondaire',
                  ),
                ),
              ],
            ),
          ),
        ),
        //Pièce d'identité
        Step(
          state: _activeStepIndex <= 1 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 1,
          title: const Text('ID'),
          content: Container(
            child: Column(
              children: [
                const SizedBox(
                  height: 8,
                ),
                SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'Attestation',
                  // icon: Icon(Icons.format_shapes),
                  labelText: 'Type de pièce',
                  items: _typeIDItems,
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      typeIDController.text = val;
                    });
                  },
                  onSaved: (val) => print(val),
                ),
                // TextField(
                //   controller: typeIDController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Type de pièce ',
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: numeroIDController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'N° de pièce',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: lieuDelivranceIDController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lieu de délivrance ',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InputDatePickerFormField(
                  lastDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(
                      days: 3700)), //Entre la date courante et dix ans avant
                  fieldLabelText: 'Date émission',
                ),
                // TextField(
                //   controller: emissionIDController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Date émission ',
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),
                InputDatePickerFormField(
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(const Duration(
                      days: 3700)), //Entre la date courante et 10 ans après
                  fieldLabelText: 'Date expiration',
                ),
                // TextField(
                //   controller: expirationIDController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Date expiration ',
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ),
        //Infos Personnelles
        Step(
          state: _activeStepIndex <= 2 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 2,
          title: const Text('Perso.'),
          content: Container(
            child: Column(
              children: [
                SelectFormField(
                  type: SelectFormFieldType.dropdown, // or can be dialog
                  initialValue: 'Monsieur',
                  // icon: Icon(Icons.format_shapes),
                  labelText: 'Civilité',
                  items: _civiliteItems,
                  onChanged: (val) {
                    print(val);
                    setState(() {
                      civiliteController.text = val;
                    });
                  },
                  onSaved: (val) => print(val),
                ),
                TextField(
                  controller: nomController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nom de famille',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: prenomsController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Prénom(s)',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: lieuNaissanceController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Lieu de naissance',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                InputDatePickerFormField(
                  lastDate: DateTime.now(),
                  firstDate: DateTime.now()
                      .subtract(const Duration(days: 36500)), //100 ans maximum
                  fieldLabelText: 'Date de naissance',
                ),
                // TextField(
                //   controller: dateNaissanceController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Date de naissance',
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: professionController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Profession',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: adresseGeoController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Adresse géographique',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  controller: nationaliteController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nationalité',
                  ),
                ),
              ],
            ),
          ),
        ),
        //photos
        Step(
          state: _activeStepIndex <= 3 ? StepState.editing : StepState.complete,
          isActive: _activeStepIndex >= 3,
          title: const Text('Photos'),
          content: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ButtonStyle(),
                  onPressed: () {
                    _showImageSource(context, false);
                  },
                  child: Text("Images de l' ID"),
                ),
                ElevatedButton(
                  onPressed: () {
                     _showImageSource(context, true);
                  },
                  child: Text("Photo réquérant"),
                ),
                // TextField(
                //   controller: photoIDController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Photo pièce d\'identité ',
                //   ),
                // ),
                const SizedBox(
                  height: 8,
                ),
                // TextField(
                //   controller: photoRequerantController,
                //   decoration: const InputDecoration(
                //     border: OutlineInputBorder(),
                //     labelText: 'Photo du réquérant',
                //   ),
                // ),
              ],
            ),
          ),
        ),
        //OK
        Step(
          state: StepState.complete,
          isActive: _activeStepIndex >= 4,
          title: const Text('OK'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Attention, si vous confirmez avoir saisi les bonnes données, vous pouvez soumettre la requête pour traitement',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
              Text(
                'Sinon vous pouvez en ajouter ou les modifier.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red.shade400,
                ),
              ),
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Identification de carte SIM')),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[ 
          ];
        },
        body: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Stepper(
            type: StepperType.horizontal,
            currentStep: _activeStepIndex,
            steps: stepList(),
            onStepContinue: () {
              if (_activeStepIndex < (stepList().length - 1)) {
                setState(() {
                  _activeStepIndex += 1;
                });
              } else {
                print('Submited');
                _soumettreIdentification();
              }
            },
            onStepCancel: () {
              if (_activeStepIndex == 0) {
                return;
              }

              setState(() {
                _activeStepIndex -= 1;
              });
            },
            onStepTapped: (int index) {
              setState(() {
                _activeStepIndex = index;
              });
            },
            controlsBuilder: (context, ControlsDetails controls) {
              final isLastStep = _activeStepIndex == stepList().length - 1;
              return Container(
                margin: const EdgeInsets.only(right: 10, left: 10, top: 20),
                child: Row(
                  children: [
                    if (_activeStepIndex > 0)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: controls.onStepCancel,
                          child: const Text('Retour'),
                        ),
                      ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controls.onStepContinue,
                        child: (isLastStep)
                            ? const Text('Soumettre')
                            : const Text('Suivant'),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  /// Get from gallery
  _getFromGallery(bool requerant) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
;
    if (requerant) {
      photoRequerant = File(image!.path);
    } else {
      imageID = File(image!.path);
    }
  }

  /// Get from Camera
  _getFromCamera(bool requerant) async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    print("Vue image : ---> " + image!.path.toString());
    if (requerant) {
      photoRequerant = File(image.path);
    } else {
      imageID = File(image.path);
    }
    print("image ID : ---> " + imageID.path);
  }

  Future<ImageSource?> _showImageSource(
      BuildContext context, bool requerant) async {
    if (Platform.isIOS) {
      return showCupertinoModalPopup(
          context: context,
          builder: (context) {
            return CupertinoActionSheet(actions: [
              CupertinoActionSheetAction(
                onPressed: () => _getFromCamera(requerant),
                child: Text("Camera"),
              ),
              CupertinoActionSheetAction(
                onPressed: () => _getFromGallery(requerant),
                child: Text("Gallerie"),
              ),
            ]);
          });
    } else {
      return showModalBottomSheet(
          context: context,
          builder: (context) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                  onTap: () => _getFromCamera(requerant),
                ),
                ListTile(
                  leading: Icon(Icons.image),
                  title: Text("Gallerie"),
                  onTap: () => _getFromGallery(requerant),
                ),
              ],
            );
          });
    }
  }

  _soumettreIdentification() {
    IdentificationProvider id = IdentificationProvider();
    id.soumettreIdentification(
        telController.text,
        telSecondaireController.text,
        typeIDController.text,
        numeroIDController.text,
        lieuDelivranceIDController.text,
        emissionIDController.text,
        expirationIDController.text,
        civiliteController.text,
        nomController.text,
        prenomsController.text,
        lieuNaissanceController.text,
        dateNaissanceController.text,
        professionController.text,
        adresseGeoController.text,
        nationaliteController.text,
        imageID,
        photoRequerant);
  }

//
}
