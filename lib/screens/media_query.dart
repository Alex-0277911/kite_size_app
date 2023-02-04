import 'package:flutter/material.dart';

class MyMediaQuery extends StatelessWidget {
  const MyMediaQuery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Height: ${MediaQuery.of(context).size.height.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              'Width: ${MediaQuery.of(context).size.width.toStringAsFixed(0)}',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              'Aspect Ratio: ${MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              MediaQuery.of(context).orientation.toString(),
              style: const TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
