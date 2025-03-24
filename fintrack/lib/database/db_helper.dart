import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/expense.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'expenses.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expenses(id INTEGER PRIMARY KEY AUTOINCREMENT, description TEXT, amount REAL, date TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertExpense(Expense expense) async {
    final db = await DBHelper.database();
    await db.insert('expenses', expense.toMap());
  }

  static Future<List<Expense>> getExpenses() async {
    final db = await DBHelper.database();
    final List<Map<String, dynamic>> data = await db.query('expenses');
    return data.map((e) => Expense.fromMap(e)).toList();
  }
}
