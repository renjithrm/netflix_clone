// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/Home/home_page.dart';
import 'package:netflix_clone/views/comeing%20soon/comeing_soon_screen.dart';
import 'package:netflix_clone/views/downloads/downloads_screen.dart';
import 'package:netflix_clone/views/more/more_screen.dart';
import 'package:netflix_clone/views/search/search_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  var items = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.home,
        ),
        label: "Home"),
    BottomNavigationBarItem(
        icon: Icon(Icons.video_call_outlined), label: "Comeing soon"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.emoji_emotions_outlined,
        ),
        label: "Fast Laughs"),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.download,
        ),
        label: "download"),
  ];
  var screens = [
    HomePage(),
    // SearchScreen(),
    ComeingSoonScreen(),
    DownloadScreen(),
    MoreScreen()
  ];
  ValueNotifier<int> index = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, int newIndex, _) {
            return screens[index.value];
          }),
      bottomNavigationBar: ValueListenableBuilder(
          valueListenable: index,
          builder: (context, int newIndex, _) {
            return BottomNavigationBar(
              backgroundColor: Colors.black,
              type: BottomNavigationBarType.fixed,
              unselectedItemColor: Colors.grey,
              selectedItemColor: Colors.white,
              items: items,
              currentIndex: newIndex,
              onTap: (newValue) {
                index.value = newValue;
              },
            );
          }),
    );
  }
}
