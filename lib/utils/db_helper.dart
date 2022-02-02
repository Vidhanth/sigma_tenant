import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sigma_tenant/models/space.dart';

class DBHelper {
  DBHelper._privateConsstructor();
  static final DBHelper instance = DBHelper._privateConsstructor();

  static const _fileName = 'spaces_list.db';
  static const _tableName = 'spaces';
  static const spaceId = 'id';
  static const spaceDesc = 'desc';
  static const spaceMeta = 'meta';
  static const spaceName = 'name';
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    String path = await getDatabasesPath();
    return await openDatabase(
      join(path, _fileName),
      version: 1,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      create table $_tableName (
        $spaceId text primary key,
        $spaceName text,
        $spaceMeta text,
        $spaceDesc text
      )
    ''');
  }

  Future<List<Space>> loadSpaces() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> spaceListRaw = await db.query(_tableName);
    List<Space> spaceList = [];
    for (var space in spaceListRaw) {
      Space newSpace = Space(
        id: space[spaceId],
        displayName: space[spaceName],
        description: space[spaceDesc],
        meta: space[spaceMeta],
      );
      spaceList.add(newSpace);
    }
    return spaceList;
  }

  Future<void> saveSpaces(List<Space> spaces) async {
    Database db = await instance.database;
    await db.execute('delete from $_tableName');
    for (Space space in spaces) {
      await db.insert(_tableName, {
        spaceId: space.id,
        spaceName: space.displayName,
        spaceDesc: space.description,
        spaceMeta: space.meta,
      });
    }
  }
}
