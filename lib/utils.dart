import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, this.stor, {super.key});

  final String text;
  final double stor;

  @override
  Widget build(context) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.black,
        fontSize: stor,
      ),
    );
  }
}

List wordsList = [
  'HÚS',
  'BÓK',
  'BLÓM',
  'TUNGL',
  'GLUGGI',
  'FISKUR',
  'FJALL',
  'HUNDUR',
  'FUGL',
  'VEGUR'
];

List<String> letters = [
  'A',
  'Á',
  'B',
  'D',
  'Ð',
  'E',
  'É',
  'F',
  'G',
  'H',
  'I',
  'Í',
  'J',
  'K',
  'L',
  'M',
  'N',
  'O',
  'Ó',
  'P',
  'R',
  'S',
  'T',
  'U',
  'Ú',
  'V',
  'X',
  'Y',
  'Ý',
  'Þ',
  'Æ',
  'Ö'
];
