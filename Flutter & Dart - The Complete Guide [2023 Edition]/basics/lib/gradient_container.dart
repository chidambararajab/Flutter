import 'package:flutter/material.dart';
import 'package:basics/styled_text.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.colors});

  /**
   * Here the point is we can add multiple constructors and make the widgets more customizable.
   * We can call like GradientContainer.orange() as a widget as well to show the orange as a colors.
   */ ///
  // GradientContainer.orange({super.key})
  //     : colors = [
  //         Colors.deepOrange,
  //         Colors.deepOrangeAccent,
  //       ];

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: StyledText('New Data'),
      ),
    );
  }
}
