import 'package:flutter/material.dart';
import 'package:kite_size_app/posts/post_1.dart';
import 'package:kite_size_app/posts/post_2.dart';
import 'package:kite_size_app/posts/post_3.dart';

class TikTokScrollWiew extends StatelessWidget {
  TikTokScrollWiew({super.key});

  // создаем контроллер для отслеживания на какой странице мы находимся
  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        controller: _controller,
        children: const [
          //
          MyPost1(),
          MyPost2(),
          MyPost3(),
        ],
      ),
    );
  }
}
