// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:netflix_clone/controller/trending_controller.dart';
import 'package:netflix_clone/services/api_manager.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/widget_tv_show/listview_tv_show.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/widget_tv_show/stack_listview.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class AllShowPage extends StatefulWidget {
  const AllShowPage({Key? key}) : super(key: key);

  @override
  State<AllShowPage> createState() => _AllShowPageState();
}

class _AllShowPageState extends State<AllShowPage> {
  late Future<List> _topTrendings;
  late Future<List> _topMovies;
  late Future<List> _getDiscover;
  late Future<List> _getTvShows;
  late Future<List> _comedyMovies;
  late Future<List> _horrorMovies;
  late Future<List> _romanticMovies;
  @override
  void initState() {
    _topTrendings = ApiManager.getJsonData(ConstantString.trending);
    _topMovies = ApiManager.getJsonData(ConstantString.topRatedUrl);
    _getDiscover = ApiManager.getJsonData(ConstantString.discover);
    _getTvShows = ApiManager.getJsonData(ConstantString.tvShows);
    _comedyMovies = ApiManager.getJsonData(ConstantString.comedyMovies);
    _horrorMovies = ApiManager.getJsonData(ConstantString.horrorMovies);
    _romanticMovies = ApiManager.getJsonData(ConstantString.romanticMovies);
    super.initState();
  }

  TrendingController get _trendingController => Get.find<TrendingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder<List>(
                future: _topTrendings,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      height: 550,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(ConstantString.imageUrl +
                              snapshot.data![2]['poster_path']),
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
                    );
                  } else {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        height: 550,
                        child: Center(child: CircularProgressIndicator()));
                  }
                }),
            title("Trending"),
            FutureBuilder<List>(
                future: _topTrendings,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ShowListView(
                      snapshot: snapshot,
                    );
                  } else {
                    return Container(
                      height: 170,
                    );
                  }
                }),
            title("Top 10 movies"),
            FutureBuilder<List>(
                future: _topMovies,
                builder: (context, topMovies) {
                  if (topMovies.hasData) {
                    return StackedListView(
                      snapshot: topMovies,
                    );
                  } else {
                    return Container(
                      height: 170,
                    );
                  }
                }),
            title("Discover"),
            FutureBuilder<List>(
                future: _getDiscover,
                builder: (context, getDiscover) {
                  if (getDiscover.hasData) {
                    return ShowListView(
                      snapshot: getDiscover,
                    );
                  } else {
                    return Container(
                      height: 170,
                    );
                  }
                }),
            title("Tv shows"),
            FutureBuilder<List>(
                future: _getTvShows,
                builder: (context, getTvShows) {
                  if (getTvShows.hasData) {
                    return ShowListView(
                      snapshot: getTvShows,
                    );
                  } else {
                    return Container(
                      height: 170,
                    );
                  }
                }),
            title("Comedy Movies"),
            FutureBuilder<List>(
                future: _comedyMovies,
                builder: (context, comedyMovies) {
                  return comedyMovies.hasData
                      ? ShowListView(snapshot: comedyMovies)
                      : Container();
                }),
            title("Horror Movies"),
            FutureBuilder<List>(
                future: _horrorMovies,
                builder: (context, horrorMovies) {
                  return horrorMovies.hasData
                      ? ShowListView(snapshot: horrorMovies)
                      : Container();
                }),
            title("Romantic Movies"),
            FutureBuilder<List>(
                future: _romanticMovies,
                builder: (context, romanticMovies) {
                  return romanticMovies.hasData
                      ? ShowListView(snapshot: romanticMovies)
                      : Container();
                }),
            title("Old Movies"),
            GetX<TrendingController>(builder: (manager) {
              return Container(
                  height: 170,
                  child: Padding(
                    padding: ReuseWidget.PADDING_ALL,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var url = ConstantString.imageUrl +
                              manager.trendingMovies[index].backdropPath
                                  .toString();

                          return ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image(
                                width: 100,
                                image: NetworkImage(url),
                                fit: BoxFit.cover,
                              ));
                        },
                        separatorBuilder: (context, intdex) => SizedBox(
                              width: 10,
                            ),
                        itemCount: manager.trendingMovies.length),
                  ));
            })
          ],
        ),
      ),
    );
  }

  Widget title(String title) {
    return SizedBox(
      height: 30,
      child: Padding(
        padding: ReuseWidget.PADDING_LEFT,
        child: Text(
          title,
          style: TextStyle(
              color: ReuseWidget.DARK_TEXT, fontWeight: ReuseWidget.BOLD_TEXT),
        ),
      ),
    );
  }
}
