// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/widget_tv_show/listview_tv_show.dart';
import 'package:netflix_clone/views/helper/helper.dart';

class TvShowsHome extends StatelessWidget {
  const TvShowsHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReuseWidget.SCAFFOLD_COLOR,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("TV Shows"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        clipBehavior: Clip.none,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 600,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/564x/2d/08/2b/2d082be2f8497878ccfeda6bc3dd387c.jpg"),
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
              SizedBox(
                height: 30,
                child: Padding(
                  padding: ReuseWidget.PADDING_LEFT,
                  child: Text(
                    "Popular on Netflix",
                    style: TextStyle(
                        color: ReuseWidget.DARK_TEXT,
                        fontWeight: ReuseWidget.BOLD_TEXT),
                  ),
                ),
              ),
              TvShowListView(),
            ],
          ),
        ),
      ),
    );
  }
}
