import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ChatRepository {
  final ChatService chatService;

  ChatRepository({this.chatService});

  Future<GroupPageData> getGroupsInClass(schoolId, classId, user) async {
    return await chatService.getGroupsInClass(schoolId, classId, user);
  }

  Future<List<UserModel>> getUserInGroups(schoolId, classId, groupId) async {
    return await chatService.getUserInGroups(schoolId, classId, groupId);
  }

  Future<void> saveChat(int senderId, int receiverId, String message) async {
    await chatService.saveChat(senderId, receiverId, message);
  }

  Future<Stream> getChatsFromDb(int senderId, int receiverId) async {
    return await chatService.fetchChatsFromDb(senderId, receiverId);
  }

}