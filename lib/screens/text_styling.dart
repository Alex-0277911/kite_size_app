import 'package:flutter/material.dart';

class MyTextStyling extends StatelessWidget {
  const MyTextStyling({super.key});

  // переменная в которой храним стиль текста
  final pinkFont = const TextStyle(
    fontSize: 30,
    // курсив
    fontStyle: FontStyle.italic,
    // полужирный
    fontWeight: FontWeight.bold,
    color: Colors.pink,
  );
  // переменная в которой храним стиль текста
  final greenLargeFont = const TextStyle(
    fontSize: 50,
    // курсив
    fontStyle: FontStyle.italic,
    // полужирный
    fontWeight: FontWeight.bold,
    color: Colors.green,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            'Text Widget Tutorial',
            style: TextStyle(
              fontSize: 30,
              // курсив
              fontStyle: FontStyle.italic,
              // полужирный
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          Text(
            'How to customize and style texts with flutter',
            style: pinkFont,
          ),
          Text(
            'Another text widget',
            style: greenLargeFont,
          ),
        ],
      ),
    );
  }
}
