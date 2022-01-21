// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class ShowListView extends StatelessWidget {
  AsyncSnapshot<List<dynamic>> snapshot;
  ShowListView({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      child: Padding(
        padding: ReuseWidget.PADDING_ALL,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var url = ConstantString.imageUrl +
                  snapshot.data![index]['backdrop_path'];

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
            itemCount: snapshot.data!.length),
      ),
    );
  }
}
