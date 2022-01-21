// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/services/api_manager.dart';
import 'package:netflix_clone/views/Home/widgets/tv_shows/widget_tv_show/listview_tv_show.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class MoviesScreenHome extends StatefulWidget {
  const MoviesScreenHome({Key? key}) : super(key: key);

  @override
  State<MoviesScreenHome> createState() => _MoviesScreenHomeState();
}

class _MoviesScreenHomeState extends State<MoviesScreenHome> {
  late Future<List> _actionMovies;
  late Future<List> _comedyMovies;
  late Future<List> _horrorMovies;
  late Future<List> _romanticMovies;
  @override
  void initState() {
    _actionMovies = ApiManager.getJsonData(ConstantString.actionMovies);
    _comedyMovies = ApiManager.getJsonData(ConstantString.comedyMovies);
    _horrorMovies = ApiManager.getJsonData(ConstantString.horrorMovies);
    _romanticMovies = ApiManager.getJsonData(ConstantString.romanticMovies);
    super.initState();
  }

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
                  FutureBuilder<List>(
                      future: _actionMovies,
                      builder: (context, actionMovies) {
                        return actionMovies.hasData
                            ? Container(
                                height: 600,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(ConstantString
                                            .imageUrl +
                                        actionMovies.data![10]['poster_path']),
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
                                                child:
                                                    ReuseWidget.bannerIconText(
                                                  Icons.add,
                                                  "My list",
                                                )),
                                            InkWell(
                                              onTap: () async {},
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5)),
                                                width: 70,
                                                height: 30,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
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
                  headLines("Action Movies"),
                  FutureBuilder<List>(
                      future: _actionMovies,
                      builder: (context, actionMovies) {
                        return actionMovies.hasData
                            ? ShowListView(snapshot: actionMovies)
                            : Container();
                      }),
                  headLines("Comedy Movies"),
                  FutureBuilder<List>(
                      future: _comedyMovies,
                      builder: (context, comedyMovies) {
                        return comedyMovies.hasData
                            ? ShowListView(snapshot: comedyMovies)
                            : Container();
                      }),
                  headLines("Horror Movies"),
                  FutureBuilder<List>(
                      future: _horrorMovies,
                      builder: (context, horrorMovies) {
                        return horrorMovies.hasData
                            ? ShowListView(snapshot: horrorMovies)
                            : Container();
                      }),
                  headLines("Romantic Movies"),
                  FutureBuilder<List>(
                      future: _romanticMovies,
                      builder: (context, romanticMovies) {
                        return romanticMovies.hasData
                            ? ShowListView(snapshot: romanticMovies)
                            : Container();
                      }),
                ],
              ),
            ),
          ),
        ));
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
