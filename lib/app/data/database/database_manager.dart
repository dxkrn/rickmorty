import 'dart:convert';

import 'package:rickmorty/app/models/character_model.dart';
import 'package:rickmorty/widgets/snackbar.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseManager {
  Database? _database;

  Future openDb() async {
    _database = await openDatabase(
        join(await getDatabasesPath(), "database.db"),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute(
        "CREATE TABLE favorite (id INTEGER PRIMARY KEY, character TEXT)",
      );
    });
    return _database;
  }

  Future<void> insertCharacter(Character character) async {
    await openDb();

    Map<String, dynamic> characterData = {
      'id': character.id,
      'character': jsonEncode(character.toJson()),
    };
    await _database?.insert('favorite', characterData);
    CustomSnackbar.show(
        'Added to Favorite❤️', '${character.name} added to Favorite!');
  }

  Future<List<Character>> getCharacters() async {
    await openDb();
    final List<Character> characters = [];

    final List<Map<String, dynamic>> charactersDataRaw =
        await _database!.rawQuery('SELECT * FROM favorite ORDER BY id DESC');

    for (var char in charactersDataRaw) {
      characters.add(Character.fromJson(jsonDecode(char['character'])));
    }

    return characters;
  }

  Future<void> deleteCharacter(Character character) async {
    await openDb();
    await _database!
        .delete('favorite', where: "id = ?", whereArgs: [character.id]);
    CustomSnackbar.show(
        'Removed from Favorite💔', '${character.name} removed from Favorite!');
  }
}
