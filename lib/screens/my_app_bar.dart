import 'package:flutter/material.dart';
import 'package:kite_size_app/pages/first_page.dart';
import 'package:kite_size_app/pages/second_page.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        // title: const Center(
        //   child: Text('D R A W E R'),
        // ),
      ),
      drawer: Drawer(
        // место для любых виджетов, но рекомендуемый ListView
        child: Container(
          color: Colors.deepPurple[100],
          child: ListView(
            children: [
              // список для отображения в ListView
              const DrawerHeader(
                child: Center(
                  child: Text(
                    'L O G O',
                    style: TextStyle(fontSize: 35),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'Page 1',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  //code here
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FirstPage()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text(
                  'Page 2',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  //code here
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SecondPage()));
                },
              ),
            ],
          ),
        ),
      ),
      endDrawer: const Drawer(),
    );
  }
}
