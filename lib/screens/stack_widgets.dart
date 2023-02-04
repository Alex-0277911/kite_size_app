import 'package:flutter/material.dart';

class MyStackWidget extends StatelessWidget {
  const MyStackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // центрируем виджет Stack по центру
      body: Center(
        child: Stack(
          // выравнивание виджетов внутри основного
          alignment: AlignmentDirectional.center,
          children: [
            // виджеты располагаются с "дна" телефона в направлении "наверх",
            // т.е. виджет 300х300 самый нижний, на него наложен
            // виджет 200х200 и так далее
            Container(
              width: 300,
              height: 300,
              color: Colors.blue[200],
            ),
            Container(
              width: 200,
              height: 200,
              color: Colors.blue[400],
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.blue[600],
            ),
          ],
        ),
      ),
    );
  }
}
