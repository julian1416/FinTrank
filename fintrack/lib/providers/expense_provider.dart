import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../database/db_helper.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Future<void> loadExpenses() async {
    _expenses = await DBHelper.getExpenses();
    notifyListeners();
  }

  Future<void> addExpense(Expense expense) async {
    await DBHelper.insertExpense(expense);
    _expenses.add(expense);
    notifyListeners();
  }
}
