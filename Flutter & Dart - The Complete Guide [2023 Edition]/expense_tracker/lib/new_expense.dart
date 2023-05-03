import 'package:expense_tracker/modal/expense.dart';
import 'package:flutter/material.dart';

class NewExpenss extends StatefulWidget {
  const NewExpenss({super.key});

  @override
  State<NewExpenss> createState() => _NewExpenssState();
}

class _NewExpenssState extends State<NewExpenss> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  Category? _selectedDropdownValue;

  DateTime _selectedDate = DateTime.now();

  void _showCurrentDateCalender() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate as DateTime;
    });
  }

  void _addNewExpense() {
    final titleValidation = _titleController.text.trim().isEmpty;
    final amountValidation = double.tryParse(_amountController.text);

    if (titleValidation ||
        amountValidation == null ||
        amountValidation <= 0 ||
        _selectedDropdownValue == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Title'),
          content: const Text(
              'Please make sure a valid title, amount and date is added'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Okay'))
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            maxLength: 50,
            controller: _titleController,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
            keyboardType: TextInputType.text,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(formater.format(_selectedDate)),
                  IconButton(
                    onPressed: _showCurrentDateCalender,
                    icon: const Icon(
                      Icons.calendar_month,
                    ),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              DropdownButton(
                  value: _selectedDropdownValue,
                  items: Category.values
                      .map(
                        (category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _selectedDropdownValue = value;
                    });
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  _amountController.text = '';
                  _titleController.text = '';
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              ElevatedButton(
                onPressed: _addNewExpense,
                child: const Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
