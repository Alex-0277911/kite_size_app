import 'package:flutter/material.dart';
import 'package:kite_size_app/pages/account.dart';
import 'package:kite_size_app/pages/home.dart';
import 'package:kite_size_app/pages/message.dart';
import 'package:kite_size_app/pages/settings.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  // variable
  int _selectedIndex = 0;

// method
  void _navigateBottomBar(int index) {
    //code here
    setState(() {
      _selectedIndex = index;
    });
  }

  // list strings
  final List<Widget> _pages = [
    const UserHome(),
    const MessagePages(),
    const SettingsPage(),
    const AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[300],
            elevation: 0,
            // виджеты (иконка) в начале аппбара
            leading: IconButton(
              onPressed: () {
                // code here
              },
              icon: const Icon(Icons.menu),
            ),
            title: const Center(
              child: Text(
                'A P P B A R',
                style: TextStyle(),
              ),
            ),
            // виджеты в конце аппбара
            actions: [
              IconButton(
                onPressed: () {
                  // code here
                },
                icon: const Icon(Icons.share),
              ),
              IconButton(
                onPressed: () {
                  // code here
                },
                icon: const Icon(Icons.person),
              ),
            ],
          ),
          body: _pages[_selectedIndex],
          // body: const Center(
          //   child: Text(
          //     'Hello',
          //     style: TextStyle(fontSize: 50),
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: _navigateBottomBar,
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.message), label: 'Message'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: 'Settings'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: 'Account'),
            ],
          )),
    );
  }
}
