import 'package:flutter/material.dart';

class MyAnimatedContainer extends StatefulWidget {
  const MyAnimatedContainer({super.key});

  @override
  State<MyAnimatedContainer> createState() => _MyAnimatedContainerState();
}

class _MyAnimatedContainerState extends State<MyAnimatedContainer> {
  // переменные для определения размеров бокса
  double boxWidth = 100;
  double boxHeight = 100;

  // первоначальный цвет бокса
  var colorBox = Colors.deepPurple;

  // переменные для определения положения бокса на экране
  double boxX = -1;
  double boxY = -1;

  // // функция изменения местоположения бокса
  void _movebox() {
    setState(() {
      //
      boxX = 1;
      boxY = 1;
    });
  }

// функция изменения размера бокса
  void _expandBox() {
    setState(() {
      boxWidth = 300;
      boxHeight = 300;
    });
  }

// функция изменения цвета бокса
  void _setColorBox() {
    setState(() {
      colorBox = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: _expandBox,
      // onTap: _setColorBox,
      onTap: _movebox,
      child: Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: Center(
          child: AnimatedContainer(
            // продолжительность анимации
            duration: const Duration(seconds: 1),
            // выравнивание объекта
            alignment: Alignment(boxX, boxY),
            // метод перемещения объекта, т.е. по кривой (не прямолинейно)
            curve: Curves.easeInBack,
            // width: boxWidth,
            // height: boxHeight,
            // color: colorBox,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.deepPurple,
            ),
          ),
        ),
      ),
    );
  }
}
