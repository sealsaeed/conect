import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/auth/domain/helper/auth_validators.dart';
import 'package:conect/app/features_modules/auth/domain/providers/auth_providers.dart';
import 'package:conect/app/features_modules/auth/widgets/my_textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyFromFields extends ConsumerStatefulWidget {
  MyFromFields({super.key, required this.formkey});

  final GlobalKey<FormState> formkey;

  @override
  ConsumerState<MyFromFields> createState() => _MyFromFieldsState();
}

final _authvalidators = AuthValidators();

class _MyFromFieldsState extends ConsumerState<MyFromFields> {
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
    final formProvider = ref.watch(authFormController);
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
                onChanged: (value) {
                  if (value != null) {
                    formProvider.setEmailField(value);
                  }
                  return null;
                },
                validator: (value) {
                  return _authvalidators.emailValidator(value);
                },
              ),
              SizedBox(height: context.screenHeight * 0.03),
              MyTextFormField(
                controller: userNameController,
                MyFoucsNode: userNameNode,
                myTextInputAction: TextInputAction.next,
                labelText: context.translate.username,
                prefIcon: const Icon(Icons.person),
                obsecureText: false,
                onChanged: (value) {
                  if (value != null) {
                    formProvider.setUserNameField(value);
                  }
                  return null;
                },
                validator: (input) => _authvalidators.userNameValidator(input),
              ),
              SizedBox(height: context.screenHeight * 0.03),
              MyTextFormField(
                controller: passwordController,
                MyFoucsNode: passwordNode,
                myTextInputAction: TextInputAction.done,
                labelText: context.translate.password,
                prefIcon: const Icon(Icons.password),
                obsecureText:
                    formProvider.togglePassword == false ? true : false,
                onChanged: (value) {
                  if (value != null) {
                    formProvider.setPasswordField(value);
                  }
                  return null;
                },
                validator: (input) => _authvalidators.passwordVlidator(input),
                togglePassword: () {
                  formProvider.togglePasswordIcon();
                },
                suffexIcon: Icon(
                  formProvider.togglePassword
                      ? Icons.remove_red_eye_outlined
                      : Icons.remove_red_eye_rounded,
                ),
              ),
            ],
          ),
        ));
  }
}
