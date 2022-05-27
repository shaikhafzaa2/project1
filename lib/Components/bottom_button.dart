import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class bottom_button extends StatelessWidget {
  bottom_button({
    Key? key,
    required this.select,
    required this.screenWidth,
  }) : super(key: key);

  final List<int> select;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: StepProgressIndicator(
            roundedEdges: const Radius.circular(20),
            totalSteps: 3,
            currentStep: select.length,
            size: 50,
            padding: 0,
            selectedColor: Colors.blue,
            unselectedColor: Colors.grey,
          ),
        ),
      ),
      Positioned(
        top: 25,
        left: screenWidth * 0.4,
        child: Text(
          select.length == 0
              ? "Follow 3 topics"
              : select.length > 2
                  ? "  Continue"
                  : "Follow ${3 - select.length} more",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Fira Sans',
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      )
    ]);
  }
}
