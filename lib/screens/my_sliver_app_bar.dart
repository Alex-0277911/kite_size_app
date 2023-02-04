import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: CustomScrollView(
        slivers: [
          //растянутая панель апп бар
          SliverAppBar(
            backgroundColor: Colors.deepPurple,
            leading: const Icon(Icons.menu),
            //title: const Text('S L I V E R A P P B A R'),
            // учеличеная высота
            expandedHeight: 300,
            //свойство, которое отвечает за появление панели при отмотке назад
            floating: true,
            // свойство закрепляет маленькую панель всегда сверху
            pinned: true,
            // цвет панели при полном растяжении
            flexibleSpace: FlexibleSpaceBar(
              // сюда можно поместить любой виджет, например картинку
              // или контейнер с отображением другим цветом
              background: Container(
                color: Colors.pink,
              ),
              title: const Text('S L I V E R A P P B A R'),
            ),
          ),
          // sliver items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 400,
                  color: Colors.deepPurple[300],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
