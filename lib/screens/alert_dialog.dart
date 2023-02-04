// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({super.key});

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  // функциф показа диалога при клике по кнопке
  void _showDialog() {
    //
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            // return CupertinoAlertDialog(
            backgroundColor: Colors.pink[100],
            // заголовок
            title: const Text('Title'),
            // содержимое диалогового окна
            content: const Text('Content, more info'),
            // действия
            actions: [
              MaterialButton(
                onPressed: () {},
                child: const Text('OK'),
              ),
              MaterialButton(
                onPressed: () {
                  // исчезновение окна
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[200],
      body: Center(
        child: MaterialButton(
          color: Colors.deepPurple[100],
          onPressed: _showDialog,
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'SHOW DIALOG',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
