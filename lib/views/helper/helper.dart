// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:netflix_clone/views/search/search_screen.dart';

class ReuseWidget {
  static const String LOGO_MYAPP = "assets/netflix_logo.jpg";
  static const DARK_TEXT = Colors.white;
  static const SCAFFOLD_COLOR = Color.fromARGB(255, 20, 18, 18);
  static const PADDING_LEFT = EdgeInsets.only(left: 15, top: 8);
  static const BOLD_TEXT = FontWeight.bold;
  static const PADDING_ALL = EdgeInsets.all(10);
  static Widget bannerIconText(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: ReuseWidget.DARK_TEXT,
        ),
        Text(
          text,
          style: const TextStyle(color: ReuseWidget.DARK_TEXT),
        )
      ],
    );
  }

  static onTap(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => SearchScreen()));
  }
}
