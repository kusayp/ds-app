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
}