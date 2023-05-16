import 'package:flutter/material.dart';

class Hangman extends StatefulWidget {
  const Hangman({super.key});

  @override
  State<Hangman> createState() {
    return _HangmanState();
  }
}

class _HangmanState extends State<Hangman> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          Text('Hangman'),
        ],
      ),
    );
  }
}
