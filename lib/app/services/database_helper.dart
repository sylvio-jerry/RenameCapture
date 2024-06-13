import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../models/image_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "images.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE IF NOT EXISTS Images (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, path TEXT)");
      },
    );
  }

  Future<void> insertImage(ImageModel image) async {
    final db = await database;
    await db!.insert(
      'Images',
      image.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<ImageModel>> getImages() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db!.query('Images');

    return List.generate(maps.length, (i) {
      return ImageModel(
        id: maps[i]['id'],
        name: maps[i]['name'],
        path: maps[i]['path'],
      );
    });
  }
}
