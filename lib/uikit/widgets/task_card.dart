import 'package:a_blob/resources/styles.dart';
import 'package:flutter/material.dart';
import 'package:a_blob/uikit/pages/text_input.dart';
import 'package:a_blob/resources/models.dart';

class TaskCard extends StatefulWidget { //menutask
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
              color: (widget.task.userResult == widget.task.tasks.length-1)
                  ? green
                  : orange,
            ),
            child: Row(children: [
              Expanded(
                child: Text(
                  widget.task.name,
                  style: TextStyle(
                      fontSize: 22,
                      color:
                      (widget.task.userResult == widget.task.tasks.length)
                          ? dark
                          : accent),
                ),
              ),
              Text(
                widget.task.userResult.toString() +
                    '/' +
                    (widget.task.tasks.length-1).toString(),
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: (widget.task.userResult == widget.task.tasks.length)
                        ? dark
                        : accent),
              ),
            ])));
  }
}