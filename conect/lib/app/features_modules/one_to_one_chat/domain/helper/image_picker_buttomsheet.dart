import 'package:conect/app/config/theme/mycolors.dart';
import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/providers/message_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// i use the properties of the class without having an instance of it or iheritance
mixin PickAnImageBottomSheet {
  Future showOptions(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) => Consumer(builder: (context, ref, child) {
              final chatMessageProv = ref.read(chatMessageProvider.notifier);
              return SizedBox(
                  height: context.screenHeight * 0.3,
                  width: context.screenWidth,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Text(
                          context.translate.photoGallery,
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: MyColors.secondary_500),
                        ),
                        onTap: () {
                          context.pop();
                          //getImageFromGallery();
                        },
                      ),
                      GestureDetector(
                        child: Text(
                          context.translate.cameraImage,
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: MyColors.secondary_500),
                        ),
                        onTap: () {
                          context.pop();
                          //getImageFromCamera();
                        },
                      ),
                      GestureDetector(
                        child: Text(
                          context.translate.cancel,
                          style: context.textTheme.titleSmall
                              ?.copyWith(color: MyColors.primary_500),
                        ),
                        onTap: () {
                          context.pop();
                          chatMessageProv.cancel();
                          //cancel();
                        },
                      ),
                    ],
                  ));
            }));
  }
}
