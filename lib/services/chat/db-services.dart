// import 'package:dsapp/models/models.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// class DBServices {
//   Future<Database> openDb() async {
//     return openDatabase(
//       // Set the path to the database. Note: Using the `join` function from the
//       // `path` package is best practice to ensure the path is correctly
//       // constructed for each platform.
//       join(await getDatabasesPath(), 'chat.db'),
//       onCreate: (db, version) {
//         // Run the CREATE TABLE statement on the database.
//         return db.execute(
//           "CREATE TABLE chats(id INTEGER PRIMARY KEY, toOrFrom INTEGER, direction INTEGER, title TEXT, message TEXT, timeStamp INTEGER)",
//         );
//       },
//       // Set the version. This executes the onCreate function and provides a
//       // path to perform database upgrades and downgrades.
//       version: 1,
//     );
//   }
//
//   Future<void> insertChat(ChatModel chat) async {
//     // Get a reference to the database.
//     final Database db = await openDb();
//
//     // Insert the ChatModel into the correct table. You might also specify the
//     // `conflictAlgorithm` to use in case the same ChatModel is inserted twice.
//     //
//     // In this case, replace any previous data.
//     await db.insert(
//       'chats',
//       chat.toJson(),
//       conflictAlgorithm: ConflictAlgorithm.replace,
//     );
//   }
//
//   Future<List<ChatModel>> getChatsFromDb(int toOrFrom) async {
//     // Get a reference to the database.
//     final Database db = await openDb();
//
//     // Query the table for all The Chats.
//     final List<Map<String, dynamic>> maps = await db.query('chats', where: '"toOrFrom" = ?', whereArgs: [toOrFrom], orderBy: "id DESC");
//
//     // Convert the List<Map<String, dynamic> into a List<ChatModel>.
//     List<ChatModel> chats = maps != null ? maps.map((e) => ChatModel.fromJson(e)).toList() : [];
//     return chats;
//   }
// }
