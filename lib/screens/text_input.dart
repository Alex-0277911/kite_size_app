import 'package:flutter/material.dart';

class MyTextInput extends StatefulWidget {
  const MyTextInput({super.key});

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
  // создаем контроллер редактирования текста
  final _textController = TextEditingController();

  // строка для хранения вводимого текста
  String userPost = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // отображение вводимого текста при нажатии кнопки
            Expanded(
              child: Center(child: Text(userPost)),
            ),
            TextField(
              // привязываем контроллер редактирования текста, что бы
              // иметь возможность отслежывать вводимый текст
              controller: _textController,
              decoration: InputDecoration(
                // текс подсказки в поле ввода
                hintText: 'What\'s on your mind?',
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    // clear whats currently in the textfield
                    _textController.clear();
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      // обновляем значение переменной для хранения текста
                      userPost = '$userPost  ${_textController.text}';
                    });
                  },
                  color: Colors.blue,
                  child: const Text(
                    'P O S T',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    setState(() {
                      // очищаем значение переменной для хранения текста
                      userPost = '';
                    });
                  },
                  color: Colors.blue,
                  child: const Text(
                    'Clear P O S T',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
