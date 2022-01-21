// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/services/api_manager.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/widget_tv_show/listview_tv_show.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class TvShowsHome extends StatefulWidget {
  const TvShowsHome({Key? key}) : super(key: key);

  @override
  State<TvShowsHome> createState() => _TvShowsHomeState();
}

class _TvShowsHomeState extends State<TvShowsHome> {
  late Future<List> _tvShowComedy;
  late Future<List> _tvShow;
  late Future<List> _tvShowDrama;
  @override
  void initState() {
    _tvShowComedy = ApiManager.getJsonData(ConstantString.tvShowComedy);
    _tvShow = ApiManager.getJsonData(ConstantString.tvShows);
    _tvShowDrama = ApiManager.getJsonData(ConstantString.tvShowDrama);
    super.initState();
  }

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
              FutureBuilder<List>(
                  future: _tvShowComedy,
                  builder: (context, tvShowComedy) {
                    return tvShowComedy.hasData
                        ? Container(
                            height: 550,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(ConstantString.imageUrl +
                                    tvShowComedy.data![14]["poster_path"]),
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
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
                                              borderRadius:
                                                  BorderRadius.circular(5)),
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
                          )
                        : Container(
                            height: 600,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                  }),
              headLines("Tv shows"),
              FutureBuilder<List>(
                  future: _tvShow,
                  builder: (context, tvShow) {
                    return tvShow.hasData
                        ? ShowListView(snapshot: tvShow)
                        : Container();
                  }),
              headLines("Comdey"),
              FutureBuilder<List>(
                  future: _tvShowComedy,
                  builder: (context, tvShowComedy) {
                    return tvShowComedy.hasData
                        ? ShowListView(snapshot: tvShowComedy)
                        : Container();
                  }),
              headLines("Drama"),
              FutureBuilder<List>(
                  future: _tvShowDrama,
                  builder: (context, tvShowDrama) {
                    return tvShowDrama.hasData
                        ? ShowListView(snapshot: tvShowDrama)
                        : Container();
                  }),
            ],
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
