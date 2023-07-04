
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constants2.dart';

class Helper {
  Helper._instance();
  static final Helper helper = Helper._instance();
  Future<String> _getDbPath() async {
    String dbPath = await getDatabasesPath();
    String noteDbPath = join(dbPath, DB_NAME);
    return noteDbPath;
  }

  Future<Database> createNoteDb() async {
    String path = await _getDbPath();
    return openDatabase(
      path,
      version: DB_VERSION,
      onCreate: (db, version) => _createTable(db),singleInstance: true,
    );
  }

  _createTable(Database db) {
    try {
      String sql =
          'create table $TABLE_NAME($COL_ID integer primary key autoincrement,$COL_TEXT text,$COL_DATE text,$COL_UPDATE_DATE text)';
      print(sql);
      db.execute(sql);
    }catch(e){
      print('Invalide');
    }
  }
}
