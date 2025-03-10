import 'dart:io';

import 'package:excel/excel.dart';
import 'package:julelotteri_frontend/services/sync_service.dart';
import 'package:sqlite3/sqlite3.dart';

class DatabaseService {
  static final db = sqlite3.open("lotteri.db");

  // Local DB constructor
  static void initialize() {
    db.execute('CREATE TABLE IF NOT EXISTS players ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT NOT NULL, '
        'number TEXT NOT NULL, '
        'won BOOL NOT NULL'
        ');');
    // Setup change log to log all changes to the local database marking them synced or not... if not synched then sync with the server when internet available.
    db.execute('CREATE TABLE IF NOT EXISTS change_log ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'operation TEXT, '
        'data TEXT, '
        'timestamp TEXT, '
        'synched BOOL'
        ');');
  }

  static bool addImportToDB(path) {
    var bytes = File(path).readAsBytesSync();
    var excel = Excel.decodeBytes(bytes);

    final stmt =
        db.prepare('INSERT INTO players (name, number, won) VALUES (?, ?, ?);');

    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        if (row.length >= 3) {
          var name = row[1]?.value.toString();
          var number = row[2]?.value.toString();
          if (name != null && number != null) {
            stmt.execute([name, number, 0]);
            db.execute(
              'INSERT INTO change_log (operation, data, timestamp, synched) VALUES (?, ?, ?, ?);',
              [
                'INSERT',
                '{"name": "$name", "number": "$number", "won": 0}',
                DateTime.now().toIso8601String(),
                0
              ],
            );
          }
        }
      }
    }
    stmt.dispose();

    SyncService.LocalChange();

    return true;
  }
}
