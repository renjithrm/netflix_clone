// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/helper/helper.dart';
import 'package:netflix_clone/views/helper/strings.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:google_fonts/google_fonts.dart';

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
                height: 150,
                width: 130,
                child: Stack(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    Positioned(
                      right: 5,
                      child: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              spreadRadius: 5,
                              offset: Offset(3.0, 0)),
                        ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image(
                            width: 100,
                            height: 145,
                            image: NetworkImage(url),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 35,
                      bottom: 0,
                      left: -6,
                      child: BorderedText(
                        strokeColor: Colors.white70,
                        strokeWidth: 4,
                        child: Text(
                          number.toString(),
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontSize: 95,
                          ),
                          //  TextStyle(
                          //   fontSize: 100,
                          //   color: Colors.black87,
                          // ),
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
