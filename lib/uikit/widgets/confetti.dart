import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

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
