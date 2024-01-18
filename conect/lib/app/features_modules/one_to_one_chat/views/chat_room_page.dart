import 'package:conect/app/features_modules/chats/domain/models/user_model.dart';
import 'package:conect/app/features_modules/one_to_one_chat/widget/chat_room_body.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatelessWidget {
  const ChatRoomPage({super.key, required this.userModel});

  final UserModel userModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: Icon(Icons.abc),
        title: Text(userModel.username.toString()),
      ),
      body: ChatRoomPageBody(usermodel: userModel),
    );
    // return Card(
    //     child: ListTile(
    //   title: Text(userModel.username),
    //   subtitle: Text(userModel.email),
    //   onTap: () {
    //     context.goNamed(MyNamedRoutes.chatDetails, extra: userModel);
    //   },
    // ));
  }
}
