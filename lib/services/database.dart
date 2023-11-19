import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../models/game.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentsDirectory.path, 'games.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE games(
  id INTEGER PRIMARY KEY,
  game_title TEXT,
  release_date TEXT,
  platform INTEGER,
  region_id INTEGER,
  country_id INTEGER,
  developers TEXT
)
''');
  }

  Future<List<Game>> getGames() async {
    Database db = await instance.database;
    var games = await db.query('games', orderBy: 'game_title');
    List<Game> gamesList = games.isNotEmpty
        ? games.map((value) => Game.fromJson(value)).toList()
        : [];
    return gamesList;
  }

  Future<int> add(Game game) async {
    Database db = await instance.database;
    return await db.insert('games', game.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('games', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Game game) async {
    Database db = await instance.database;
    return await db
        .update('games', game.toMap(), where: 'id = ?', whereArgs: [game.id]);
  }
}
