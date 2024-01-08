import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/auth/domain/helper/auth_validators.dart';
import 'package:conect/app/features_modules/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';

class MyFromFields extends StatefulWidget {
  const MyFromFields({super.key, required this.formkey});

  final GlobalKey<FormState> formkey;

  @override
  State<MyFromFields> createState() => _MyFromFieldsState();
}

final _authvalidators = AuthValidators();

class _MyFromFieldsState extends State<MyFromFields> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  final FocusNode emailNode = FocusNode();
  final FocusNode passwordNode = FocusNode();
  final FocusNode userNameNode = FocusNode();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    emailNode.dispose();
    passwordNode.dispose();
    userNameNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: widget.formkey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              MyTextFormField(
                controller: emailController,
                MyFoucsNode: emailNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.email,
                prefIcon: const Icon(Icons.email),
                obsecureText: false,
                onChanged: null,
                validator: (value) {
                  return _authvalidators.emailValidator(value);
                },
              ),
              SizedBox(height: context.screenHeight * 0.05),
              MyTextFormField(
                controller: userNameController,
                MyFoucsNode: userNameNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.username,
                prefIcon: const Icon(Icons.person),
                obsecureText: false,
                onChanged: null,
                validator: (input) => _authvalidators.userNameValidator(input),
              ),
              SizedBox(height: context.screenHeight * 0.05),
              MyTextFormField(
                controller: passwordController,
                MyFoucsNode: passwordNode,
                myTextInputAction: TextInputAction.done,
                labelText: context.translate.password,
                prefIcon: const Icon(Icons.password),
                obsecureText: false,
                onChanged: null,
                validator: (input) => _authvalidators.passwordVlidator(input),
              )
            ],
          ),
        ));
  }
}
