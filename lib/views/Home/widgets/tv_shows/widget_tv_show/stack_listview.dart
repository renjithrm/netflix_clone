// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';

class StackedListView extends StatelessWidget {
  AsyncSnapshot<List<dynamic>> snapshot;
  StackedListView({Key? key, required this.snapshot}) : super(key: key);

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
              var number = index + 1;
              return Container(
                color: Colors.transparent,
                height: 150,
                width: 110,
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Positioned(
                      right: 0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image(
                          width: 100,
                          height: 155,
                          image: NetworkImage(url),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      // right: 70,
                      bottom: 0,
                      left: -10,

                      child: Container(
                        width: 140,
                        height: 100,
                        color: Colors.black12,
                        child: Text(
                          number.toString(),
                          style: TextStyle(
                            fontSize: 100,
                            color: Colors.white60,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, intdex) => SizedBox(
                  width: 10,
                ),
            itemCount: 10),
      ),
    );
  }
}
