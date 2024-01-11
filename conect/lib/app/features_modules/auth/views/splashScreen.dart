import 'package:conect/app/config/router/named_routes.dart';
import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/auth/domain/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final checkIfAuth = ref.watch(checkIFauthinticated);

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
      ),
    );
    //   body: Center(
    //     child: checkIFauthinticated.when(data: (data) {
    //       if(data.value.uid != null){
    //         GoRouter.of(context).goNamed(MyNamedRoutes.chats);
    //       }else{
    //         GoRouter.of(context).goNamed(MyNamedRoutes.register);
    //       }
    //       return SizedBox();
    //     },
    //     loading: ()=> Center(child: CircularProgressIndicator(),),
    //     error: (error, StackTrace) => Center(
    //       child: Text(error.toString()),
    //     )
    //     ),
    //   ),
    // );
  }
}
