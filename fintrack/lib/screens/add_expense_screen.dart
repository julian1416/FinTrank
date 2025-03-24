import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
import '../models/expense.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _descriptionController = TextEditingController();
  final _amountController = TextEditingController();

  void _saveExpense() {
    final description = _descriptionController.text;
    final amount = double.tryParse(_amountController.text) ?? 0;

    if (description.isEmpty || amount <= 0) return;

    Provider.of<ExpenseProvider>(context, listen: false).addExpense(
      Expense(description: description, amount: amount, date: DateTime.now()),
    );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Agregar Gasto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Descripción'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Monto'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Guardar'),
              onPressed: _saveExpense,
            ),
          ],
        ),
      ),
    );
  }
}
