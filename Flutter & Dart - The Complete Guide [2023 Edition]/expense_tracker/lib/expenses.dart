import 'package:expense_tracker/expenses_list.dart';
import 'package:expense_tracker/modal/expense.dart';
import 'package:expense_tracker/new_expense.dart';
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

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  _showAddExpenseModal() {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenss(addExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: _showAddExpenseModal,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
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
