import 'package:bingo/bingo/bingo_model.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BingoConfetti extends StatefulWidget {
  @override
  _BingoConfettiState createState() => _BingoConfettiState();
}

class _BingoConfettiState extends State<BingoConfetti> {
  ConfettiController _controller;

  @override
  void initState() {
    _controller = ConfettiController(duration: const Duration(seconds: 10));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bingoModel = context.watch<BingoModel>();
    if (bingoModel.isBingo) {
      _controller.play();
    } else {
      _controller.stop();
    }

    return ConfettiWidget(
      confettiController: _controller,
      blastDirectionality: BlastDirectionality.explosive,
      emissionFrequency: 5 / 100,
      colors: const [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple
      ], // manually specify the colors to be used
    );
  }
}
