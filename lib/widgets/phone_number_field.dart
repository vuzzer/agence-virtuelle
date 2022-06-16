import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberField extends StatelessWidget {
  PhoneNumberField({Key? key}) : super(key: key);
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.01),
        child: Stack(
          children: [
            InternationalPhoneNumberInput(
              onInputChanged: (PhoneNumber number) {
                print(number.phoneNumber);
              },
              onInputValidated: (bool value) {
                print(value);
              },
              selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              
                      useEmoji: true,
              ),
              initialValue: PhoneNumber(isoCode: 'CI'),
              ignoreBlank: false,
              autoValidateMode: AutovalidateMode.disabled,
              selectorTextStyle: const TextStyle(color: Colors.black),
              textFieldController: controller,
              
              formatInput: false,
              maxLength: 9,
              keyboardType: const TextInputType.numberWithOptions(
                  signed: true, decimal: true),
              cursorColor: Colors.black,
              inputDecoration: InputDecoration(
                contentPadding: const EdgeInsets.only(bottom: 15, left: 0),
                border: InputBorder.none,
                hintText: 'Numéro de téléphone',
                hintStyle: TextStyle(color: Colors.grey.shade500, fontSize: 16),
              ),
              onSaved: (PhoneNumber number) {
                print('On Saved: $number');
              },
            ),
            Positioned(
              left: 90,
              top: 8,
              bottom: 8,
              child: Container(
                height: 40,
                width: 1,
                color: Colors.black.withOpacity(0.13),
              ),
            )
          ],
        ));
  }
}
