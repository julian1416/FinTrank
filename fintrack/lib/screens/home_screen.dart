import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../widgets/expense_tile.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenses = Provider.of<ExpenseProvider>(context).expenses;

    return Scaffold(
      appBar: AppBar(title: Text('Gestor de Finanzas')),
      body: ListView.builder(
        itemCount: expenses.length,
        itemBuilder: (context, index) => ExpenseTile(expense: expenses[index]),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddExpenseScreen()),
        ),
      ),
    );
  }
}
