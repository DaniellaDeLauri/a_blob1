import 'package:blob/styles.dart';
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
  @override
  Widget build(BuildContext context) {
    return Listener(
        onPointerDown: (PointerDownEvent a) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => TextInputPage(
                  hint:
                      'Переставь буквы, чтобы получилось слово. Правильный ответ введи в поле.',
                  tasks: [
                    TextInputTask(
                        question: 'ь, т, о, л, в', rightAnswer: 'вольт'),
                    TextInputTask(
                        question: 'б, к, а, и, р, с, о',
                        rightAnswer: 'абрикос'),
                    TextInputTask(
                        question: 'у, р, е, г, с, п, е, й, о',
                        rightAnswer: 'супергерой'),
                  ]),
            ),
          );
        },
        child: Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              color: (widget.task.userResult == widget.task.maxResult)
                  ? green
                  : accent,
            ),
            child: Row(children: [
              Expanded(
                child: Text(
                  widget.task.name,
                  style: TextStyle(
                      fontSize: 22,
                      color: (widget.task.userResult == widget.task.maxResult)
                          ? Colors.white
                          : dark),
                ),
              ),
              Text(
                widget.task.maxResult.toString() +
                    '/' +
                    widget.task.userResult.toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: (widget.task.userResult == widget.task.maxResult)
                        ? Colors.white
                        : dark),
              ),
            ])));
  }
}
