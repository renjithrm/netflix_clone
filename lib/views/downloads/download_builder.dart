// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class DownloadBuilder extends StatelessWidget {
  AsyncSnapshot<List<dynamic>> snapshot;
  DownloadBuilder({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            child: Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 125,
                    height: 75,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(ConstantString.imageUrl +
                            snapshot.data![index]["backdrop_path"]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: SizedBox(
                      width: 125,
                      height: 75,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          snapshot.data![index]["name"],
                          style: TextStyle(
                              color: ReuseWidget.DARK_TEXT,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.download_done_sharp,
                    color: ReuseWidget.DARK_TEXT,
                  ),
                ],
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: 4,
    );
  }
}
