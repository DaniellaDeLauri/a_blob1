import 'dart:ffi';
import 'dart:math';

import 'package:blob/styles.dart';
import 'package:blob/widgets.dart';
import 'package:blob/models.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

class TextInputPage extends StatefulWidget {
  TextInputPage({
    Key? key,
    required this.tasks,
    required this.hint,
  }) : super(key: key);
  List<TextInputTask> tasks;
  String hint;

  @override
  State<TextInputPage> createState() => _TextInputPageState();
}

class _TextInputPageState extends State<TextInputPage> {
  int activeStep = 0;
  late int dotCount;
  List<TextEditingController> textFieldControllers = [];
  int result = 0;

  @override
  void initState() {
    dotCount = widget.tasks.length;
    for (var i = 0; i < widget.tasks.length; i++) {
      textFieldControllers.add(TextEditingController());
    }
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
              child:
                  Padding(padding: const EdgeInsets.all(18.0), child: steps()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [previousButton(), nextButton()],
            )
          ],
        ),
      ),
    );
  }

  Column steps() {
    if (activeStep == widget.tasks.length) {
      return Column(
        children: [
          Text(
            'Твой результат: ' +
                result.toString() +
                '/' +
                widget.tasks.length.toString(),
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
              itemCount: widget.tasks.length,
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
                            widget.tasks[index].rightAnswer,
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
            widget.tasks[activeStep].question,
            style: const TextStyle(
                color: Color(0xffffffff),
                fontSize: 28,
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 10),
          Text(
            widget.hint,
            style: const TextStyle(color: light50, fontSize: 18),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: textFieldControllers[activeStep],
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: accent, width: 3),
                ),
                focusedBorder: OutlineInputBorder(
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
    if (activeStep < widget.tasks.length) {
      return GestureDetector(
          onTap: () {
            if (activeStep < widget.tasks.length - 1) {
              setState(() {
                activeStep++;
              });
            } else {
              if (dotCount == widget.tasks.length) {
                setState(() {
                  for (var i = 0; i < widget.tasks.length; i++) {
                    if (widget.tasks[i].rightAnswer ==
                        textFieldControllers[i]) {
                      result++;
                    }
                  }
                  // if (result > widget.maxResult) {
                  //
                  // }
                  dotCount++;
                  activeStep++;
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
