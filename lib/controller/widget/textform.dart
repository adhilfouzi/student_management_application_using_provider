import 'package:flutter/material.dart';

class TextFormWirte extends StatelessWidget {
  final String textcontent;
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
      required this.textcontent});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            textcontent,
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
          ),
        ),
      ],
    );
  }
}
