// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/services/api_manager.dart';
import 'package:netflix_clone/views/downloads/download_builder.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({Key? key}) : super(key: key);

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  late Future<List> _downloads;
  @override
  void initState() {
    _downloads = ApiManager.getJsonData(ConstantString.tvShows);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ReuseWidget.SCAFFOLD_COLOR,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ReuseWidget.SCAFFOLD_COLOR,
        title: Text("Downloads"),
        actions: const [Icon(Icons.search)],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Smart Downloads",
                  style: TextStyle(
                    color: ReuseWidget.DARK_TEXT,
                  ),
                ),
                trailing: Icon(
                  Icons.create_outlined,
                  color: ReuseWidget.DARK_TEXT,
                ),
                leading: Icon(
                  Icons.brightness_5_rounded,
                  color: ReuseWidget.DARK_TEXT,
                  size: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Downloads for You",
                      style: TextStyle(
                        color: ReuseWidget.DARK_TEXT,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.grey,
                          size: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Updated 36 minutes ago",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                leading: Icon(
                  Icons.download,
                  color: ReuseWidget.DARK_TEXT,
                ),
              ),
              FutureBuilder<List>(
                  future: _downloads,
                  builder: (context, downloads) {
                    return downloads.hasData
                        ? DownloadBuilder(
                            snapshot: downloads,
                          )
                        : Container();
                  }),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 550,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Introducing Downloads for you",
                        style: TextStyle(
                            color: ReuseWidget.DARK_TEXT,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "We'll download a persolised selection of movies and shows for you, so there's always something to watch on your phone.",
                        style: TextStyle(color: ReuseWidget.DARK_TEXT),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder<List>(
                          future: _downloads,
                          builder: (context, snapshot) {
                            return snapshot.hasData
                                ? Container(
                                    height: 300,
                                    width: MediaQuery.of(context).size.width,
                                    child: Stack(
                                      children: <Widget>[
                                        Positioned(
                                          top: 30,
                                          left: 50,
                                          child: CircleAvatar(
                                            radius: 135,
                                            backgroundColor: Colors.black54,
                                          ),
                                        ),
                                        Positioned(
                                          right: 40,
                                          top: 90,
                                          child: RotationTransition(
                                            turns: AlwaysStoppedAnimation(
                                                20 / 360),
                                            child: Container(
                                              height: 175,
                                              width: 125,
                                              child: Image(
                                                image: NetworkImage(
                                                    ConstantString.imageUrl +
                                                        snapshot.data![2]
                                                            ["backdrop_path"]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 40,
                                          top: 90,
                                          child: RotationTransition(
                                            turns: AlwaysStoppedAnimation(
                                              -20 / 360,
                                            ),
                                            child: Container(
                                              height: 175,
                                              width: 125,
                                              child: Image(
                                                image: NetworkImage(
                                                    ConstantString.imageUrl +
                                                        snapshot.data![5]
                                                            ["backdrop_path"]),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 70,
                                          left: 113,
                                          child: Container(
                                            height: 185,
                                            width: 135,
                                            child: Image(
                                              image: NetworkImage(
                                                  ConstantString.imageUrl +
                                                      snapshot.data![7]
                                                          ["backdrop_path"]),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          top: 110,
                                          left: 150,
                                          child: Icon(
                                            Icons.play_circle_outline_outlined,
                                            color: Colors.white54,
                                            size: 50,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container();
                          }),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text("SET UP"),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Find more to download",
                            style: TextStyle(
                              color: ReuseWidget.DARK_TEXT,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
