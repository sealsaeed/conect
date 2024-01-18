import 'package:conect/app/features_modules/chats/domain/models/user_model.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/helper/image_picker_buttomsheet.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/models/message_details.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/providers/message_provider.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/repo/message_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatRoomPageBody extends ConsumerStatefulWidget {
  const ChatRoomPageBody({super.key, required this.usermodel});
  final UserModel usermodel;
  @override
  ConsumerState<ChatRoomPageBody> createState() => _ChatRoomPageBodyState();
}

class _ChatRoomPageBodyState extends ConsumerState<ChatRoomPageBody>
    with PickAnImageBottomSheet {
  final _sendMessageController = TextEditingController();

  @override
  void dispose() {
    _sendMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messageRepo = ref.watch(messagingRepoProvider);
    final currentUserId = FirebaseAuth.instance.currentUser!.uid;
    final messageState = ref.watch(chatMessageProvider);
    final messageController = ref.read(chatMessageProvider.notifier);
    return Column(
      children: [
        Expanded(
          child: StreamBuilder(
            stream: MessagingRepo().getAllMessage(
                senderId: FirebaseAuth.instance.currentUser!.uid,
                reciverId: widget.usermodel.username),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }
              final List<Message> messageList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: messageList.length,
                itemBuilder: (context, index) {
                  return Text(messageList[index].message.toString());
                },
              );
            },
          ),
        ),
        Visibility(
          visible: messageState.isloading,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Row(
            children: [IconButton(onPressed: () {}, icon: Icon(Icons.abc))],
          ),
        )
      ],
    );
  }
}
