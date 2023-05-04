import 'package:expense_tracker/chart/chart.dart';
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
      category: Category.work,
    ),
    Expense(
      title: 'Ooty',
      amount: 741.68,
      date: DateTime.now(),
      category: Category.travel,
    ),
  ];

  void _addExpense(Expense expense) {
    setState(() {
      _expenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final elementIndex = _expenses.indexOf(expense);

    setState(() {
      _expenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(
          seconds: 3,
        ),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _expenses.insert(elementIndex, expense);
            });
          },
        ),
        content: const Text('Expense deleted'),
      ),
    );
  }

  _showAddExpenseModal() {
    return showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpenss(addExpense: _addExpense),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    var listOfExpenses = const Center(
      child: Text(
        'No expense found',
      ),
    );

    if (_expenses.isNotEmpty) {
      listOfExpenses = Center(
        child: ExpensesList(
          expenses: _expenses,
          removeExpense: _removeExpense,
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expenses'),
          centerTitle: false,
          actions: [
            IconButton(
              onPressed: _showAddExpenseModal,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: width < 600
            ? (Column(
                children: [
                  Chart(expenses: _expenses),
                  Expanded(
                    child: listOfExpenses,
                  ),
                ],
              ))
            : (Row(
                children: [
                  Expanded(child: Chart(expenses: _expenses)),
                  Expanded(
                    child: listOfExpenses,
                  ),
                ],
              )),
      ),
    );
  }
}
