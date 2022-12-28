
import 'package:dreamwork/model/addToCartModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DbManager {
  DbManager._();
  static final DbManager db = DbManager._();
  static Database? _database;

  Future<Database> get database async => _database ??= await initDB();

  initDB() async {
    final database = await openDatabase(
      join(await getDatabasesPath(), "main.db"),
      version: 1,
      onCreate: (
        db,
        int version,
      ) async {
        await db.execute(
          "CREATE TABLE AddToCart(id INTEGER PRIMARY KEY autoincrement, "
          "productName TEXT, "
          "quantity INTEGER) ",
        );
      },
    );
    return database;
  }

  Future<void> insertAddToCart(AddToCart addToCart) async {

    final db = await database;
    await db.insert(
      'addToCart',
      addToCart.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("Added: " + addToCart.toString());
  }

  Future<List<AddToCart>> getAddToCart() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('addToCart');
    return List.generate(maps.length, (i) {
      return AddToCart(
        id: maps[i]['id'],
        productName: maps[i]['productName'],
        quantity: maps[i]['quantity'],
      );
    });
  }

  Future<void> updateAddToCart(AddToCart addToCart) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'addToCart',
      addToCart.toMap(),
      // Ensure that the Dog has a matching id.
      where: 'id = ?',
      // Pass the Dog's id as a whereArg to prevent SQL injection.
      whereArgs: [addToCart.id],

    );
    print("Updated" + addToCart.toString());
  }
}
