import 'dart:html';

import 'package:conect/app/features_modules/one_to_one_chat/domain/providers/controller/message_notifier.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/providers/state/message_chat_state.dart';
import 'package:conect/app/features_modules/one_to_one_chat/domain/repo/message_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagingRepoProvider = Provider<MessagingRepo>(
  (ref) => MessagingRepo(),
);

final chatMessageProvider =
    StateNotifierProvider<ChatMessageStateNotifier, MessageChatState>(
        (ref) => ChatMessageStateNotifier(
              MessageChatState(),
            ));
// final MessagingRepoInstance = MessagingRepo();
