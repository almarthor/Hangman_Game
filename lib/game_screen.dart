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
  List allGuessedLetters = [];
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
  ];

  openDialog(String title) {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 180,
            decoration: const BoxDecoration(color: Colors.blueAccent),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {
                        status = 0;
                        guessedAlphabets.clear();
                        word = wordsList[Random().nextInt(wordsList.length)];
                      });
                    },
                    child: const Center(
                      child: (StyledText('SPILA AFTUR?', 20)),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

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
        allGuessedLetters.add(alphabet);
      });
    } else if (status != 6) {
      setState(() {
        allGuessedLetters.add(alphabet);
        status += 1;
      });
    } else {
      openDialog('Looser HAHAHA');
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
      openDialog('ÓKEYYY ÞÚ VANNST!');
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
                height: 5,
              ),
              Image(
                width: 200,
                height: 250,
                image: AssetImage(images[status]),
              ),
              const SizedBox(
                height: 30,
              ),
              //sdf
              //StyledText(guessedAlphabets[hashCode], 20),
              //sdf
              StyledText(handleText(), 35),
              const SizedBox(
                height: 30,
              ),
              GridView.count(
                crossAxisCount: 7,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 10),
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
              Column(
                children: [
                  Container(
                    color: const Color.fromARGB(255, 30, 21, 203),
                    height: 200,
                    child: ListView.builder(
                      itemCount: allGuessedLetters.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: StyledText(allGuessedLetters[index], 25),
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
