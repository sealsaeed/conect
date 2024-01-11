import 'package:conect/app/config/router/named_routes.dart';
import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: GestureDetector(
        onTap: () {
          context.pushNamed(MyNamedRoutes.register);
        },
        child: Container(
          color: Colors.amber,
          height: context.screenHeight * 0.2,
          width: context.screenWidth * 0.3,
          child: Center(child: Text(context.translate.login)),
        ),
      ),
    ));
  }
}
