import 'package:dsapp/models/models.dart';
import 'package:dsapp/services/services.dart';

class ChatRepository {
  final ChatService chatService;

  ChatRepository({this.chatService});

  Future<GroupPageData> getGroupsInClass(schoolId, classId) async {
    return await chatService.getGroupsInClass(schoolId, classId);
  }

  Future<List<UserModel>> getUserInGroups(schoolId, classId, groupId) async {
    return await chatService.getUserInGroups(schoolId, classId, groupId);
  }

  Future<void> saveChat(token, ChatModel chatModel, data) async {
    await chatService.saveChat(token, chatModel, data);
  }

  Future<List<ChatModel>> getChatsFromDb(int toOrFrom) async {
    return await chatService.fetchChatsFromDb(toOrFrom);
  }

}