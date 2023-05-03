import 'package:flutter/material.dart';

class NewExpenss extends StatefulWidget {
  const NewExpenss({super.key});

  @override
  State<NewExpenss> createState() => _NewExpenssState();
}

class _NewExpenssState extends State<NewExpenss> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

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
          TextField(
            controller: _amountController,
            decoration: const InputDecoration(
              label: Text('Amount'),
            ),
            keyboardType: TextInputType.number,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Submit'),
              ),
              ElevatedButton(
                onPressed: () {
                  _amountController.text = '';
                  _titleController.text = '';
                },
                child: const Text('Reset'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
