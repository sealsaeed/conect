import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/auth/widgets/my_forms_widget.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(context.translate.register),
      ),
      body: Column(
        children: [MyFromFields(formkey: formkey)],
      ),
    );
  }
}
