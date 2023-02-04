import 'package:flutter/material.dart';

class MyRichText extends StatelessWidget {
  const MyRichText({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // instagramm post
          Container(
            height: 350,
            color: Colors.grey[300],
          ),

          // name and caption
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              // выравнивание текста для всех детей
              textAlign: TextAlign.justify,
              // общий родитель для всех фрагментов текста
              text: const TextSpan(
                // стиль общий для всех детей, но в детях можно
                // применить отдельный стиль
                style: TextStyle(
                  fontSize: 20,
                ),
                children: [
                  // отдельный фрагмент текста
                  TextSpan(
                    text: 'Mich Koko',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text:
                        'This is a very long caption. One of the most confusing things in Dart is asynchronous programming. In Swift, we only have async and await, but in Dart (and probably other languages), we also have a Future (or Promise) object.',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  // виджет текста с выравниванием (если нужно другое выравнивание чем у всех)
                  WidgetSpan(
                    child: Text(
                      'A combination of a Future, async, and await is quite error-prone and confusing for me. In this article, I will show you a series of asynchronous implementations, highlight pitfalls and give a usage summary of the three components (Future, async, and await) at the end.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
