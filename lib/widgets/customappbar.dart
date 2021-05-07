import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_netflix_responsive_ui/assets.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 24),
      color: Colors.grey[800],
      child: SafeArea(
        child: Row(
          children: [
            Image.asset(Assets.netflixLogo0),
            SizedBox(width: 12),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _AppbarButton(
                    title: "TV shows",
                    onTap: () => print("tv shows"),
                  ),
                  _AppbarButton(title: "Title", onTap: () => print("Titles")),
                  _AppbarButton(title: "MyList", onTap: () => print("my list")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _AppbarButton extends StatelessWidget {
  final String title;
  final Function onTap;

  const _AppbarButton({Key key, this.title, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
