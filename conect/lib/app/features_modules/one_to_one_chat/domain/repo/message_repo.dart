import 'dart:html';
import 'dart:js_interop';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/models/message_details.dart';
import 'package:uuid/uuid.dart';

class MessagingRepo {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String senderId,
    required String reciverId,
    required String message,
  }) async {
    try {
      final chatRoomId = _getChatRoomId(senderId, reciverId);

      DocumentReference messageRef = _firebaseFirestore
          .collection('chat_rooms')
          .doc(chatRoomId)
          .collection('messages')
          .doc(DateTime.now().millisecondsSinceEpoch.toString());

      Message chatMessage = Message(
        messageId: const Uuid().v4(),
        senderId: senderId,
        receiverId: reciverId,
        message: message,
        timestamp: DateTime.now(),
      );
      await messageRef.set(chatMessage.toMap());
    } catch (e) {
      throw e.toString();
    }
  }

  _getChatRoomId(String senderId, String reciverId) {
    return senderId.hashCode <= reciverId.hashCode
        ? '$senderId-$reciverId'
        : '$reciverId-$senderId';
  }

  Stream<List<Message>> getAllMessage({
    required String senderId,
    required String reciverId,
  }) {
    final chatRoomId = _getChatRoomId(senderId, reciverId);
    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        _firebaseFirestore
            .collection('chat_rooms')
            .doc(chatRoomId)
            .collection('messages')
            .limit(50)
            .orderBy('timeStamp', descending: true)
            //image from windows bring me all data inside this collection
            .snapshots();

    return snapshot.map(
      (querySnapshot) => querySnapshot.docs.map(
        (document) {
          final data = document.data();

          DateTime dateTime = data['timeStamp'] is int
              ? DateTime.fromMillisecondsSinceEpoch(data['timeStamp'])
              : data['timeStamp'] as DateTime;
          return Message(
              messageId: document.id,
              senderId: data['senderId'],
              receiverId: data['reciverId'],
              message: data['message'],
              timestamp: dateTime);
        },
      ).toList(),
    );
  }
}
