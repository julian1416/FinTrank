import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final Expense expense;

  ExpenseTile({required this.expense});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(expense.description),
      subtitle: Text('${expense.amount.toStringAsFixed(2)} USD'),
      trailing: Text('${expense.date.day}/${expense.date.month}/${expense.date.year}'),
    );
  }
}
