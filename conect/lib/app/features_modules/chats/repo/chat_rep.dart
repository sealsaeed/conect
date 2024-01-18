import 'package:cloud_firestore/cloud_firestore.dart';

class ChatRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<List<User>> fetchUsers() async {
    try {
      QuerySnapshot querySnapshot = await _firebaseFirestore.collection('users').get();
      list<UserModel> userList = querySnapshot.docs.map((e) => UserModel.fromMap(e.data()as Map<String, dynamic>.tolist();
      return userList;
    } catch (e) {
      throw e.toString();
    }
  }
}
