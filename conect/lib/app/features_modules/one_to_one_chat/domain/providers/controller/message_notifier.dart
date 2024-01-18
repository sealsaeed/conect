import 'dart:html';

import 'package:conect/app/features_modules/one_to_one_chat/domain/providers/state/message_chat_state.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/repo/message_repo.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class ChatMessageStateNotifier extends StateNotifier<MessageChatState> {
  ChatMessageStateNotifier(super.state);

  final MessagingRepo _messagingRepo = MessagingRepo();
  final picker = ImagePicker();

  Future<void> sendMessage(
      {required String senderId,
      required String receiverId,
      required String message}) async {
    try {
      state = state.copyWith(isloading: true);
      await _messagingRepo.sendMessage(
          senderId: senderId, reciverId: receiverId, message: message);
      state = state.copyWith(isloading: false, message: "");
    } catch (e) {
      state = state.copyWith(isloading: false, error: e.toString());
    }
  }

  Future upLoadFile({
    required File file,
    required String senderId,
    required String recieverId,
  }) async {
    final fileName = basename(file.path);
    final destination = 'files/$fileName';
    try {
      final refrence = FirebaseStorage.instance.ref(destination);
      refrence.putFile(file).then((recivedFile) async {
        final downloadURL = await recivedFile.ref.getDownloadURL();

        await sendMessage(
            senderId: senderId, receiverId: recieverId, message: downloadURL);
      });
    } catch (e) {
      state = state.copyWith(isloading: false, error: e.toString());
    }
  }

  Future getImageFromGallery({
    required String senderId,
    required String reciverId,
  }) async {
    try {
      state = state.copyWith(isloading: false);
      XFile? pickedFile = await picker.pickMedia();
      if (pickedFile != null) {
        upLoadFile(
            file: File(pickedFile.path),
            senderId: senderId,
            recieverId: recieverId);
      }
    } catch (e) {
      state = state.copyWith(error: e.toString(), isloading: false);
    }
  }

// postional argument
  // Future getImageFromCamera(String senderId, String reciverId)
  Future getImageFromCamera({
    required String senderId,
    required String reciverId,
  }) async {
    try {
      state = state.copyWith(isloading: false);
      XFile? pickedFile = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 480,
        maxWidth: 640,
        imageQuality: 50,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString(), isloading: false);
    }
  }

  cancel() {
    state = state.copyWith(message: "", isloading: false);
  }
}
