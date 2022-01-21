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
                })
          ],
        ),
      ),
    );
  }
}
