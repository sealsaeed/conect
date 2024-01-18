// ignore_for_file: public_member_api_docs, sort_constructors_first
class MessageChatState {
  final bool isloading;
  final String message;
  final Object error;

  MessageChatState({
    required this.isloading,
    required this.message,
    required this.error,
  });

  MessageChatState copyWith({
    bool? isloading,
    String? message,
    Object? error,
  }) {
    return MessageChatState(
      isloading: isloading ?? this.isloading,
      message: message ?? this.message,
      error: error ?? this.error,
    );
  }
}
