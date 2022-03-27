import 'dart:ffi';
import 'dart:math';

import 'package:Blobby/dataManager.dart';
import 'package:Blobby/styles.dart';
import 'package:Blobby/widgets.dart';
import 'package:Blobby/models.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class TextInputPage extends StatefulWidget {
  TextInputPage({Key? key, required this.task, required this.update})
      : super(key: key);
  Task task;
  final ValueChanged<bool> update;

  @override
  State<TextInputPage> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  int activeStep = 0;
  late int dotCount;
  List<TextEditingController> textFieldControllers = [];
  int result = 0;
  late ConfettiController _confettiController;

  @override
  void initState() {
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
    dotCount = widget.task.tasks.length;
    for (var i = 0; i < widget.task.tasks.length; i++) {
      textFieldControllers.add(TextEditingController());
    }
  }

  Future<void> saveUserResult() async {
    await dataManager.saveUserResult(widget.task.id, result);
    widget.update(true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dark,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            DotStepper(
              dotCount: dotCount,
              dotRadius: 6,
              activeStep: activeStep,
              shape: Shape.circle,
              spacing: 10,
              indicator: Indicator.slide,
              onDotTapped: (tappedDotIndex) {
                setState(() {
                  activeStep = tappedDotIndex;
                });
              },
              fixedDotDecoration: const FixedDotDecoration(
                  color: Colors.transparent,
                  strokeColor: light50,
                  strokeWidth: 1),
              indicatorDecoration: const IndicatorDecoration(
                  color: light50, strokeColor: Colors.transparent),
            ),
            Expanded(
                child: Stack(
              children: [
                confetti(_confettiController),
                Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: steps(),
                    )),
              ],
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [previousButton(), nextButton()],
            )
          ],
        ),
      ),
    );
  }

  steps() {
    if (activeStep == widget.task.tasks.length) {
      return Column(
        children: [
          Text(
            'Твой результат: ' +
                result.toString() +
                '/' +
                widget.task.tasks.length.toString(),
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          const Text(
            'Проверь свои ответы',
            style: TextStyle(color: light50, fontSize: 18),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.task.tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                        'Задание ' +
                            (index + 1).toString() +
                            ': твой ответ - ' +
                            (textFieldControllers[index].text.isEmpty
                                ? 'тут пусто :('
                                : textFieldControllers[index].text) +
                            ', правильный ответ - ' +
                            widget.task.tasks[index].rightAnswer,
                        style: const TextStyle(color: light50, fontSize: 18)));
              }),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Закрыть'))
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          Text(
            widget.task.tasks[activeStep].question,
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            widget.task.hint,
            style: const TextStyle(color: light50, fontSize: 18),
          ),
          const SizedBox(height: 15),
          TextField(
            enabled: dotCount == widget.task.tasks.length,
            controller: textFieldControllers[activeStep],
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: (widget.task.tasks[activeStep].rightAnswer
                                    .toLowerCase() ==
                                textFieldControllers[activeStep].text)
                            ? Colors.green
                            : Colors.red,
                        width: 3)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: accent, width: 3),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue, width: 3),
                ),
                hintText: 'Введи ответ',
                hintStyle: TextStyle(color: light50)),
          ),
        ],
      );
    }
  }

  Widget nextButton() {
    if (activeStep < widget.task.tasks.length) {
      return GestureDetector(
          onTap: () {
            if (activeStep < widget.task.tasks.length - 1) {
              setState(() {
                activeStep++;
              });
            } else {
              if (dotCount == widget.task.tasks.length) {
                setState(() {
                  for (var i = 0; i < widget.task.tasks.length; i++) {
                    if (widget.task.tasks[i].rightAnswer.toLowerCase() ==
                        textFieldControllers[i].text.toLowerCase()) {
                      result++;
                    }
                  }
                  _confettiController.play();
                  dotCount++;
                  activeStep++;
                  if (result > widget.task.userResult) {
                    saveUserResult();
                  }
                });
              } else {
                setState(() {
                  activeStep++;
                });
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.only(right: 15, bottom: 10),
            child: Text(
              (activeStep < dotCount - 1) ? 'Вперёд' : 'Результаты',
              style: TextStyle(
                  color:
                      (activeStep < dotCount - 1) ? Colors.white : Colors.blue,
                  fontSize: 22),
            ),
          ));
    } else {
      return const SizedBox();
    }
  }

  Widget previousButton() {
    return GestureDetector(
        onTap: () {
          if (activeStep > 0) {
            setState(() {
              activeStep--;
            });
          } else {
            Navigator.pop(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Text(
            (activeStep > 0) ? 'Назад' : 'Выход',
            style: const TextStyle(color: Colors.white, fontSize: 22),
          ),
        ));
  }
}
