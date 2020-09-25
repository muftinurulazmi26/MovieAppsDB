import 'package:flutter/material.dart';

class PosterMovies extends StatelessWidget {
  final int selectPage;
  final int index;
  final String imgUrl;

  const PosterMovies({Key key, this.selectPage, this.index, this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: selectPage == index ? 10 : 30,
        horizontal: 16,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          "$imgUrl",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
