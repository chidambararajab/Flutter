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

  DateTime _selectedDate = DateTime.now();

  void _showCurrentDateCalender() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final lastDate = now;

    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: lastDate);

    setState(() {
      _selectedDate = pickedDate as DateTime;
    });
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
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  _amountController.text = '';
                  _titleController.text = '';
                  Navigator.pop(context);
                },
                child: const Text('Close'),
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
