import 'package:flutter/material.dart';

class TextFormWirte extends StatelessWidget {
  final String? textcontent;
  final Function(String)? onChanged;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  const TextFormWirte(
      {super.key,
      this.keyboardType,
      this.controller,
      this.onChanged,
      this.validator,
      this.textcontent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            textcontent ?? '',
            style: TextStyle(color: Colors.grey[500]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              autocorrect: true,
              keyboardType: keyboardType,
              controller: controller,
              onChanged: onChanged,
              validator: validator,
              decoration: InputDecoration(
                fillColor: const Color.fromARGB(255, 56, 56, 56),
                filled: true,
                enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 102, 102, 102)),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40.0),
                  borderSide:
                      const BorderSide(color: Colors.greenAccent, width: 2),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              )),
        ),
      ],
    );
  }
}
