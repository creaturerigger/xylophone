import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  // This widget is the root of your application.
  final player = AudioCache();
  final colors = [Colors.red, Colors.orange, Colors.yellowAccent, Colors.lightGreenAccent, Colors.green, Colors.blue, Colors.purple];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (int i = 1; i != 8; i++)
              XylophoneButton(
                color: colors[i - 1],
                player: player,
                onPressedFunction: () => playSound(i, player),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void playSound(int soundNumber, AudioCache player) {
    player.play("note$soundNumber.wav");
  }
}

class XylophoneButton extends StatelessWidget {
  final Color color;
  final AudioCache player;
  final VoidCallback onPressedFunction;
  XylophoneButton({color, player, onPressedFunction}): color = color, player = player,
                                          onPressedFunction = onPressedFunction;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        child: Container(),
        style: TextButton.styleFrom(
          //padding: EdgeInsets.zero,
          backgroundColor: this.color,
        ),
        onPressed: onPressedFunction,
      ),
    );
  }
}