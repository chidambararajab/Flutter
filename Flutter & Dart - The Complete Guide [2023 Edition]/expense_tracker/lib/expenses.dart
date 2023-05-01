import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/modal/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpenseState();
  }
}

class _ExpenseState extends State<Expenses> {
  final List<Expense> _expenses = [
    Expense(
      title: 'Course',
      amount: 360.00,
      date: DateTime.now(),
      category: Category.stydies,
    ),
    Expense(
      title: 'Ooty',
      amount: 7431.68,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('Graph'),
            Expanded(
              child: ExpensesList(
                expenses: _expenses,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
