import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        color: Colors.amber,
        height: context.screenHeight * 0.3,
        width: MediaQuery.of(context).size.width * 0.2,
        child: Center(child: Text(context.translate.login)),
      ),
    ));
  }
}
