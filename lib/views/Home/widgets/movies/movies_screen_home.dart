// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/widget_tv_show/listview_tv_show.dart';
import 'package:netflix_clone/views/helper/helper.dart';

class MoviesScreenHome extends StatelessWidget {
  const MoviesScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReuseWidget.SCAFFOLD_COLOR,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("Movies"),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
              ))
        ],
      ),
      body: Padding(
        padding: ReuseWidget.PADDING_ALL,
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 600,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://i.pinimg.com/564x/71/43/28/7143288bdcc9759cad0eb3706ab93890.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        height: 100,
                        width: MediaQuery.of(context).size.width,
                        bottom: 0,
                        child: Container(
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                  width: 50,
                                  height: 50,
                                  child: ReuseWidget.bannerIconText(
                                    Icons.add,
                                    "My list",
                                  )),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5)),
                                width: 70,
                                height: 30,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Icon(
                                      Icons.play_arrow,
                                    ),
                                    Text(
                                      "Play",
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                child: ReuseWidget.bannerIconText(
                                  Icons.info_outline,
                                  "info",
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                headLines("Drams"),
                TvShowListView(),
                headLines("Trending Now"),
                TvShowListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget headLines(String text) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: ReuseWidget.PADDING_LEFT,
        child: Text(
          text,
          style: TextStyle(
              color: ReuseWidget.DARK_TEXT, fontWeight: ReuseWidget.BOLD_TEXT),
        ),
      ),
    );
  }
}
