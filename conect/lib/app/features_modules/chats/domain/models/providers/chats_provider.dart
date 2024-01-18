import 'package:conect/app/features_modules/chats/repo/chat_rep.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final ChatRepoProvider = Provider((ref) => ChatsRepo());

final fetchUserProvider = FutureProvider((ref) => {
  final chatRepo = ref.watch(chatRepoProvider); 
  try {
    final userList = await chatRepo.fetchUsers();
    return useerList;
  }catch (e){
    throw e.toString();
  }
});