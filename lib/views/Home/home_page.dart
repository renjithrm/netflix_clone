// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/Home/all_show_home/all_shows.dart';
import 'package:netflix_clone/views/Home/widgets/categories/my_list_home.dart';
import 'package:netflix_clone/views/Home/widgets/movies/movies_screen_home.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/tv_shows_home.dart';
import 'package:netflix_clone/views/helper/helper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  var colorsList = [
    Colors.transparent,
    Colors.black,
    Colors.black,
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: ReuseWidget.SCAFFOLD_COLOR,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: colorsList[index],
          leading: Image.asset(
            ReuseWidget.LOGO_MYAPP,
            width: 50,
            height: 50,
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () async => ReuseWidget.onTap(context),
              icon: Icon(Icons.search),
            ),
          ],
          bottom: TabBar(
            indicator: BoxDecoration(color: Colors.transparent),
            tabs: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                      onPressed: () async => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => TvShowsHome())),
                      child: Text(
                        "TV Shows",
                        style: TextStyle(color: ReuseWidget.DARK_TEXT),
                      )),
                  TextButton(
                      onPressed: () async => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => MoviesScreenHome())),
                      child: Text(
                        "Movies",
                        style: TextStyle(color: ReuseWidget.DARK_TEXT),
                      )),
                  InkWell(
                    child: Row(
                      children: [
                        Text(
                          "Categories",
                          style: TextStyle(color: ReuseWidget.DARK_TEXT),
                        ),
                        DropdownButton<HomePage>(
                          items: [],
                          onChanged: (obj) {},
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: AllShowPage(),
      ),
    );
  }
}
// TabBarView(children: <Widget>[
//           TvShowsHome(),
//           MoviesScreenHome(),
//           MyListHome(),
//         ]),
