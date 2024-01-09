import 'package:conect/app/config/router/routes.dart';
import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/auth/domain/providers/auth_providers.dart';
import 'package:conect/app/features_modules/auth/widgets/my_forms_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.read(authControllerProvider.notifier);
    final formProvider = ref.watch(authFormController);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 182, 57, 231),
        automaticallyImplyLeading: false,
        title: Text(
          context.translate.register,
          style:
              context.textTheme.headlineMedium?.copyWith(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyFromFields(formkey: formkey),
              SizedBox(height: context.screenHeight * 0.04),
              ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState?.validate() == true) {
                      authController.register(
                          email: formProvider.email,
                          username: formProvider.userName,
                          password: formProvider.password);
                    }
                  },
                  child: Text(context.translate.register)),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextButton(
                    onPressed: () {
                      authController.GoogleSign();
                    },
                    child: Text(
                      context.translate.googleSign,
                      style: context.textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.red),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
// import 'package:conect/app/core/extentions/build_context_extention.dart';
// import 'package:conect/app/features_modules/auth/widgets/my_forms_widget.dart';
// import 'package:flutter/material.dart';

// class RegisterScreen extends StatelessWidget {
//   RegisterScreen({super.key});

//   final formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           context.translate.register,
//           style: context.theme.textTheme.titleMedium?.copyWith(
//             color: Colors.white,
//           ),
//         ),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           MyFromFields(formkey: formKey),
//           const SizedBox(
//             height: 12,
//           ),
// 					ElevatedButton(
// onPressed: (){},
// 				child: Text(context.translate.register)						
// ),
//  const SizedBox(
//             height: 12,
//           ),
// TextButton(
// onPressed: () {},
// child: Text(context.translate.googleLogin)
// ),
// 				],
//       ),
//     );
//   }
// }
