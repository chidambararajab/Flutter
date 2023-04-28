import 'package:adv_basics/numer_circle.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.data});

  final List<Map<String, Object>> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: data
              .map(
                (item) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NumberCircle(
                        condition:
                            item['correct_answer'] == item['selected_answer'],
                        stringNumb:
                            ((item['question_index'] as int) + 1).toString()),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item['question'] as String),
                          const SizedBox(height: 10),
                          Text(item['correct_answer'] as String),
                          Text(item['selected_answer'] as String),
                        ],
                      ),
                    )
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
