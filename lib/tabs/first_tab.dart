import 'package:flutter/material.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: const Center(
        child: Text(
          '1 ST TAB',
          style: TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
