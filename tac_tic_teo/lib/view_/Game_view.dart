import 'package:flutter/material.dart';

class Game_Screen extends StatefulWidget {
  const Game_Screen({super.key});

  @override
  State<Game_Screen> createState() => _Game_ScreenState();
}

class _Game_ScreenState extends State<Game_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Tic Tac Toe'),
      ),
    );
  }
}