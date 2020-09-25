import 'package:flutter/material.dart';
import 'package:movie_apps_trasa/custom/itemRatingMovie.dart';
import 'package:movie_apps_trasa/models/index.dart';

class MovieDetail extends StatefulWidget {
  final int index;
  final Movie models;

  const MovieDetail({Key key, this.index, this.models}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[300], Colors.indigo[800]],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter)),
        child: ListView(
          children: [
            Container(
              // color: Colors.amber,
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    child: Image.network(
                      "https://image.tmdb.org/t/p/w220_and_h330_face${widget.models.backdropPath}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    child: AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        IconButton(icon: Icon(Icons.share), onPressed: () {})
                      ],
                    ),
                  ),
                  Positioned(
                    left: 10,
                    right: 10,
                    top: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 150,
                              width: 100,
                              child: Hero(
                                  tag: "${widget.index}",
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/w220_and_h330_face${widget.models.posterPath}",
                                      fit: BoxFit.cover,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "${widget.models.originalTitle}",
                                  style: TextStyle(
                                      fontSize: 50,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.models.originalTitle} / ${widget.models.originalTitle} . 2 Hours",
                                      style: TextStyle(color: Colors.grey[300]),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ItemRating(
                                      rating: "${widget.models.voteAverage}",
                                      titleRating: "Vote Average",
                                    ),
                                    ItemRating(
                                      rating: "${widget.models.popularity}",
                                      titleRating: "Popularity",
                                    ),
                                    ItemRating(
                                      rating: "${widget.models.voteCount}",
                                      titleRating: "Vote Count",
                                    ),
                                  ],
                                ),
                              ],
                            ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: <Widget>[
                  Text(
                    "${widget.models.overview}",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                    maxLines: 3,
                    style: TextStyle(
                        fontSize: 15,
                        height: 1.8,
                        color: Color.fromRGBO(156, 173, 244, 10),
                        letterSpacing: 1.1),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Read More",
                          style: TextStyle(fontSize: 15),
                        ),
                        Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 60),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    width: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 3, color: Colors.white)),
                    child: Text(
                      "Buy Tickets",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
