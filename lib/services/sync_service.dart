import 'package:julelotteri_frontend/services/database_service.dart';
import 'package:sqlite3/sqlite3.dart';

class SyncService {
  static void LocalChange() async {
    // Get unsynched changes from local Database
    final unSynchedChanges = await getUnsynchedChanges();
    print(unSynchedChanges);
    // Send gRPC call containing a list of unsynched changes with unique IDs so no duplicates

    // Handle response and mark them synched
  }

  static void ServerChange() {
    // recieve gRPC call and run the synchronization with the two databases
  }

  static Future<List<Map<String, dynamic>>> getUnsynchedChanges() async {
    return Future(() {
      // Fetch database entries thats not synched
      final ResultSet result = DatabaseService.db.select(
        "SELECT * FROM change_log WHERE synched = 0;",
      );

      // Map them to dart types
      List<Map<String, dynamic>> changes = [];
      for (final row in result) {
        changes.add({
          "id": row["id"],
          "operation": row["operation"],
          "data": row["data"],
          "timestamp": row["timestamp"],
          "synched": row["synched"],
        });
      }

      return changes;
    });
  }
}
