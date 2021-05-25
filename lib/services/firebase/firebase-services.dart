import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsapp/models/users/user-model.dart';
import 'package:dsapp/services/push_notification_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseService {
  Future<void> saveChat(int senderId, int receiverId, String message,
      Map<String, dynamic> data) async {
    String chatId = getChatId(senderId, receiverId);
    var documentRef = FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection(chatId)
        .doc(Timestamp.now().millisecondsSinceEpoch.toString());

    return FirebaseFirestore.instance.runTransaction((transaction) async {
      transaction.set(documentRef, {
        'from': senderId,
        'to': receiverId,
        'message': message,
        'timestamp': FieldValue.serverTimestamp()
      });
    }).then((value) async {
      await PushNotificationService().sendAndRetrieveMessage(data);
      print("SaveChat successful");
      //Send push notification
    }).catchError((onError) {
      print("SaveChat an error occurred");
      print(onError);
    });
  }

  String getChatId(int senderId, int receiverId) {
    if (senderId < receiverId) {
      return "${senderId.toString()}_${receiverId.toString()}";
    } else {
      return "${receiverId.toString()}_${senderId.toString()}";
    }
  }

  Stream<QuerySnapshot> fetchChatsFromDb(int senderId, int receiverId) {
    String chatId = getChatId(senderId, receiverId);

    return FirebaseFirestore.instance
        .collection('messages')
        .doc(chatId)
        .collection(chatId)
        .orderBy('timestamp', descending: true)
        .limit(100)
        .snapshots();
  }

  Future<void> loginWithWithToken(UserModel userModel, String pushToken) async {
    try {
      User firebaseUser = (await FirebaseAuth.instance
              .signInWithCustomToken(userModel.customFBToken))
          .user;

      if (firebaseUser != null) {
        print("FirebaseAuth  signInWithCustomToken successful");
      }
    } catch (e) {
      print("FirebaseAuth  Unable to signInWithCustomToken");
    }
  }
}
