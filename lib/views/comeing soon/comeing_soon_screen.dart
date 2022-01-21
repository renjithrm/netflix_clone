// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/services/api_manager.dart';
import 'package:netflix_clone/views/comeing%20soon/coming_soon_builder.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class ComeingSoonScreen extends StatefulWidget {
  ComeingSoonScreen({Key? key}) : super(key: key);

  @override
  State<ComeingSoonScreen> createState() => _ComeingSoonScreenState();
}

class _ComeingSoonScreenState extends State<ComeingSoonScreen> {
  Widget columDiv = SizedBox(
    height: 10,
  );
  late Future<List> _upComing;
  @override
  void initState() {
    _upComing = ApiManager.getJsonData(ConstantString.upcoming);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ReuseWidget.SCAFFOLD_COLOR,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text("Comming Soon"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(
                  Icons.notifications_active_outlined,
                  color: ReuseWidget.DARK_TEXT,
                ),
                title: Text(
                  "Notifications",
                  style: TextStyle(
                    color: ReuseWidget.DARK_TEXT,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  color: ReuseWidget.DARK_TEXT,
                  size: 20,
                ),
              ),
              columDiv,
              FutureBuilder<List>(
                  future: _upComing,
                  builder: (context, upComing) {
                    return upComing.hasData
                        ? ComingSoonBuilder(
                            upComing: upComing,
                          )
                        : Center(child: CircularProgressIndicator());
                  }),
            ],
          ),
        ));
  }
}
