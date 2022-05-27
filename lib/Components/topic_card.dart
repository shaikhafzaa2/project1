import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class TopicCard extends StatefulWidget {
  TopicCard(
      {Key? key,
      required this.select,
      required this.index,
      required this.onPressed})
      : super(key: key);

  final select;
  final index;

  VoidCallback onPressed;

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: Duration(milliseconds: 110),
      onPressed: widget.onPressed,
      child: CircleAvatar(
        backgroundColor:
            widget.select.contains(widget.index) ? Colors.blue : Colors.grey,
        child: Text(
          "Topic: ${widget.index + 1}",
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
