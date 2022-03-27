import 'package:Blobby/styles.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

import 'activities/textInput.dart';
import 'models.dart';

class TaskCard extends StatefulWidget {
  TaskCard({
    Key? key,
    required this.task,
  }) : super(key: key);

  Task task;

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  void _update(bool result) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  TextInputPage(task: widget.task, update: _update),
            ),
          );
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: (widget.task.userResult == widget.task.tasks.length)
                  ? green
                  : accent,
            ),
            child: Row(children: [
              Expanded(
                child: Text(
                  widget.task.name,
                  style: TextStyle(
                      fontSize: 22,
                      color:
                          (widget.task.userResult == widget.task.tasks.length)
                              ? Colors.white
                              : dark),
                ),
              ),
              Text(
                widget.task.userResult.toString() +
                    '/' +
                    widget.task.tasks.length.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: (widget.task.userResult == widget.task.tasks.length)
                        ? Colors.white
                        : dark),
              ),
            ])));
  }
}

Widget confetti(ConfettiController _confettiController) {
  return Positioned(
    bottom: 0,
    left: 0,
    right: 0,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ConfettiWidget(
          minBlastForce: 50,
          maxBlastForce: 200,
          numberOfParticles: 5,
          blastDirection: -1.5708 + 0.3,
          gravity: 0.5,
          emissionFrequency: 0.2,
          confettiController: _confettiController,
        ),
        ConfettiWidget(
          minBlastForce: 50,
          maxBlastForce: 200,
          numberOfParticles: 5,
          blastDirection: -1.5708 - 0.3,
          gravity: 0.5,
          emissionFrequency: 0.2,
          confettiController: _confettiController,
        )
      ],
    ),
  );
}
