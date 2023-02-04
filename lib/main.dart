import 'package:flutter/material.dart';
import 'package:kite_size_app/screens/stack_widgets.dart';
// import 'package:kite_size_app/screens/text_input.dart';
// import 'package:kite_size_app/screens/tiktok_scroll_widget.dart';
//import 'package:kite_size_app/screens/rich_text.dart';
//import 'package:kite_size_app/screens/timer_lessons.dart';
//import 'package:kite_size_app/screens/alert_dialog.dart';
//import 'package:kite_size_app/screens/text_styling.dart';
//import 'package:kite_size_app/screens/animated_container.dart';
//import 'package:kite_size_app/screens/media_query.dart';
// import 'package:kite_size_app/screens/tab_bar.dart';
// import 'package:kite_size_app/screens/my_app_bar.dart';
//import 'package:kite_size_app/screens/my_sliver_app_bar.dart';
// import 'package:kite_size_app/screens/bottom_nav_bar.dart';
// import 'package:kite_size_app/screens/kite_calc_graf.dart';
// import 'package:kite_size_app/screens/kite_calc_text.dart';

void main() {
  // runApp(const KiteCalcText());
  // runApp(const KiteCalcGraf());
  // runApp(const BottomNavBar());
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // home: MyAppBar(),
    //home: MySliverAppBar(),
    // home: const MyTabBar(),
    //home: const MyAnimatedContainer(),
    // home: MyMediaQuery(),
    //home: const MyAlertDialog(),
    //home: const MyTextStyling(),
    //home: const MyRichText(),
    // home: const MyTimer(),
    // home: TikTokScrollWiew(),
    home: const MyStackWidget(),
    // home: const MyTextInput(),
    theme: ThemeData(primarySwatch: Colors.deepPurple),
  ));
}
