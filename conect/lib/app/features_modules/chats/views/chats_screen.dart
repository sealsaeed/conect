import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.translate.chats),
      ),
      body: Center(
          child: Column(
            final userList = ref.watch(fetchUserProvider); 
        children: [
          Text(context.translate.chats),
          SizedBox(height: context.screenHeight * 0.03,),
        ],
      )),
    );
  }
}
