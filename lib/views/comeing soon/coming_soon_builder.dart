// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class ComingSoonBuilder extends StatelessWidget {
  AsyncSnapshot<List<dynamic>> upComing;
  ComingSoonBuilder({Key? key, required this.upComing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          String title = upComing.data![index]["title"];
          return Container(
            height: 375,
            // color: ReuseWidget.DARK_TEXT,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(ConstantString.imageUrl +
                              upComing.data![index]["backdrop_path"])),
                    )),
                Container(
                  height: 75,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 20,
                        bottom: 20,
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            title.length < 20
                                ? title
                                : title.substring(0, 20) + "...",
                            style: TextStyle(
                              color: ReuseWidget.DARK_TEXT,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 150,
                          height: 65,
                          child: Row(
                            children: <Widget>[
                              Container(
                                width: 65,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.notifications_active_outlined,
                                        color: ReuseWidget.DARK_TEXT,
                                      ),
                                      Text(
                                        "Remind Me",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 65,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        Icons.info_outline,
                                        color: ReuseWidget.DARK_TEXT,
                                      ),
                                      Text(
                                        "info",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    title,
                    style: TextStyle(
                        color: ReuseWidget.DARK_TEXT,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 3),
                  child: Text(upComing.data![index]["overview"],
                      maxLines: 3,
                      style: TextStyle(
                        color: ReuseWidget.DARK_TEXT,
                      )),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        itemCount: upComing.data!.length,
      ),
    );
  }
}
