import 'package:flutter/material.dart';
import 'package:lokaverkefni/utils.dart';
import 'dart:math';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String word = wordsList[Random().nextInt(wordsList.length)];
  List guessedAlphabets = [];
  int status = 0;
  List images = [
    'assets/images/progress_0.png',
    'assets/images/progress_1.png',
    'assets/images/progress_2.png',
    'assets/images/progress_3.png',
    'assets/images/progress_4.png',
    'assets/images/progress_5.png',
    'assets/images/progress_6.png',
    'assets/images/progress_7.png',
    'assets/images/victory.png'
  ];

  String handleText() {
    String displayWord = '';
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (guessedAlphabets.contains(char)) {
        displayWord += '$char ';
      } else {
        displayWord += '_ ';
      }
    }
    return displayWord;
  }

  checkLetter(String alphabet) {
    if (word.contains(alphabet)) {
      setState(() {
        guessedAlphabets.add(alphabet);
      });
    } else if (status != 7) {
      setState(() {
        status += 1;
      });
    } else {
      print('tapaðir');
    }

    bool isWon = true;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!guessedAlphabets.contains(char)) {
        setState(() {
          isWon = false;
        });
        break;
      }
    }
    if (isWon) {
      print('won');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 30, 21, 203),
        title: const StyledText('HENGIMAÐUR', 28),
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Image(
                width: 200,
                height: 250,
                image: AssetImage(images[status]),
              ),
              const SizedBox(
                height: 30,
              ),
              StyledText(handleText(), 35),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(left: 10),
                children: letters.map((alphabet) {
                  return InkWell(
                    onTap: () => checkLetter(alphabet),
                    child: Center(
                      child: StyledText(
                        alphabet,
                        30,
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
