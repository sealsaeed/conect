import 'package:conect/app/core/extentions/build_context_extention.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/helper/image_picker_buttomsheet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// stateful widget
class _MessagingBodyViewState extends ConsumerState<MessagingBodyView>
    with PickAnImageBottomSheet {
  Widget _buildMessageInput(
      BuildContext context, String userId, MessagingRepository messagingRepo) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () => showOptions(context),
              icon: const Icon(Icons.add_a_photo)),
          Expanded(
            child: TextField(
              controller: _sendMessageController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type your message',
                hintStyle: context.textTheme.bodySmall,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              try {
                await messagingRepo
                    .sendMessage(
                  senderId: FirebaseAuth.instance.currentUser!.uid,
                  receiverId: userId,
                  message: _sendMessageController.text,
                )
                    .whenComplete(() {
                  _sendMessageController.clear();
                });
              } catch (e) {
                WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                  context.showSnackbar(
                    'Error sending message: $e',
                  );
                });
              }
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
