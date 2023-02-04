import 'package:flutter/material.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.pink,
      child: const Center(
          child: Text(
        '2 ST TAB',
        style: TextStyle(fontSize: 40),
      )),
    );
  }
}
