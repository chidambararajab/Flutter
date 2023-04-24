import 'package:flutter/material.dart';
import 'package:the_widgets/every_widgets/about_list_tile.dart';
import 'package:the_widgets/every_widgets/fade_transition.dart';
import 'package:the_widgets/every_widgets/input_chip.dart';
import 'package:the_widgets/every_widgets/modal_barrier.dart';
import 'package:the_widgets/every_widgets/theme.dart';

import 'every_widgets/about_dialog.dart';

const Color darkBlue = Color(0xFF12202F);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: darkBlue),
      debugShowCheckedModeBanner: false,
      title: 'Every Flutter Widget',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Mapp'),
        ),
        //! Just change the Widget001 for the Widget you want.
        body: const Widget123(),
      ),
    );
  }
}
