import 'dart:async';

import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key});

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  // в переменной храним первоначальное значение величины с которой
  // начинаем отсчет таймера
  int timeLeft = 5;

// метод для отсчета таймера
  _startCountDown() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (timeLeft > 0) {
          setState(
            () {
              // событыя происходят каждую секунду
              timeLeft--;
            },
          );
        } else {
          timer.cancel();
        }
      },
    );
  }

  _resetCountDown() {
    setState(() {
      timeLeft = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            // если таймер досчитал до О то выводим DONE, иначе считаем дальше
            timeLeft == 0 ? 'DONE' : '$timeLeft',
            style: const TextStyle(
              fontSize: 70,
            ),
          ),
          Column(
            children: [
              MaterialButton(
                color: Colors.orange,
                onPressed: _startCountDown,
                child: const Text(
                  'S T A R T',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              MaterialButton(
                color: Colors.orange,
                onPressed: _resetCountDown,
                child: const Text(
                  'R E S E T',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )
        ],
      ),
    ));
  }
}
