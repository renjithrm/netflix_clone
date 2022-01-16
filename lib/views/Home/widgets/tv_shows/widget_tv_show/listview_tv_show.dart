// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/helper/helper.dart';

class TvShowListView extends StatelessWidget {
  const TvShowListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Padding(
        padding: ReuseWidget.PADDING_ALL,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, intdex) {
              return Container(
                width: 100,
                child: Image(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/e5/17/17/e517176c636bfd6001ffce0aa1f14058.jpg"),
                  fit: BoxFit.cover,
                ),
              );
            },
            separatorBuilder: (context, intdex) => SizedBox(
                  width: 10,
                ),
            itemCount: 5),
      ),
    );
  }
}
