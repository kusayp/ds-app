import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/firebase/firebase-services.dart';
import 'package:dsapp/services/services.dart';

class ChatRepository {
  final ChatService chatService;
  final FirebaseService firebaseService;

  ChatRepository({this.chatService, this.firebaseService});

  Future<GroupPageData> getGroupsInClass(schoolId, classId, user) async {
    return await chatService.getGroupsInClass(schoolId, classId, user);
  }

  Future<List<UserModel>> getUserInGroups(schoolId, classId, groupId) async {
    return await chatService.getUserInGroups(schoolId, classId, groupId);
  }

  Future<void> saveChat(int senderId, int receiverId, String message, Map<String, dynamic> data) async {
    await firebaseService.saveChat(senderId, receiverId, message, data);
  }

  Stream<QuerySnapshot> getChatsFromDb(int senderId, int receiverId)  {
    return  firebaseService.fetchChatsFromDb(senderId, receiverId);
  }

}