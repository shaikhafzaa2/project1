import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:project1/Components/topic_card.dart';

import 'package:step_progress_indicator/step_progress_indicator.dart';

import 'Components/bottom_button.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int current_step = 1;

  int selected = 0;
  List<int> select = [];

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(screenWidth * 0.1002,
                  screenHeight * 0.0502, screenWidth * 0.1002, 0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: CircularStepProgressIndicator(
                      // padding: 0,
                      padding: 0.4,
                      selectedColor: Colors.blue,
                      totalSteps: 4,
                      currentStep: current_step,
                      width: 40,
                      height: 40,
                      circularDirection: CircularDirection.counterclockwise,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  Text('Step ${current_step.toString()} of 4'),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text(
                    'Follow 3 topics',
                    style: TextStyle(
                      fontFamily: 'Fira Sans',
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.02,
                  ),
                  const Text(
                    "Then we'll build a custom feed for you",
                    style: TextStyle(
                      fontFamily: 'Fira Sans',
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: screenHeight * 0.05,
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              childAspectRatio: 5 / 3,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 30),
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return TopicCard(
                          select: select,
                          index: index,
                          onPressed: () {
                            setState(() {
                              select.length < 3
                                  ? select.contains(index)
                                      ? select.remove(index)
                                      : select.add(index)
                                  : select.remove(index);
                            });
                          },
                        );
                      }),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: bottom_button(
          select: select,
          screenWidth: screenWidth,
        ));
  }
}
