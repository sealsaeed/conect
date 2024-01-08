import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    super.key,
    required this.controller,
    required this.MyFoucsNode,
    required this.myTextInputAction,
    required this.labelText,
    required this.prefIcon,
    this.suffexIcon,
    this.togglePassword,
    required this.obsecureText,
    required this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final FocusNode MyFoucsNode;
  final TextInputAction myTextInputAction;
  final String labelText;
  final Icon prefIcon;
  final Icon? suffexIcon;
  final Function()? togglePassword;
  final bool obsecureText;
  final String? Function(String?)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: MyFoucsNode,
      textInputAction: myTextInputAction,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: Text(labelText),
        prefixIcon: prefIcon,
        suffix: IconButton(
          onPressed: togglePassword,
          icon: suffexIcon ?? const SizedBox(),
        ),
      ),
      obscureText: obsecureText,
      validator: validator,
      onChanged: onChanged,
    );
  }
}
