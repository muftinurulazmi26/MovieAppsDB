import 'package:flutter/material.dart';
import 'package:movie_apps_trasa/custom/itemRatingMovie.dart';
import 'package:movie_apps_trasa/custom/itemTabs.dart';
import 'package:movie_apps_trasa/custom/posterMovies.dart';
import 'package:movie_apps_trasa/model/movieModel.dart';
import 'package:movie_apps_trasa/models/index.dart';
import 'package:movie_apps_trasa/services/servicesMovie.dart';
import 'movieDetail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.75);
  int _selectPage = 1;
  List<Movie> list = [];
  var cekData = false;

  @override
  void initState() {
    ServicesMovie.getNowPlaying().then((value) {
      setState(() {
        list = value;
        if (list.length > 0) {
          cekData = true;
        } else {
          cekData = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        // untuk membuat navigation drawer di sebelah kiri atas
        drawer: Drawer(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Movies Co Working Space"),
          centerTitle: true,
          // Untuk membuat icon button sebelah kanan atas
          actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
          bottom: TabBar(
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey[400],
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide.none,
              ),
              isScrollable: true,
              tabs: [
                ItemTabs(
                  title: "Now Playing",
                  iconData: Icons.home,
                ),
                ItemTabs(
                  title: "Popular",
                  iconData: Icons.home,
                ),
                ItemTabs(
                  title: "Top Rated",
                  iconData: Icons.home,
                ),
                ItemTabs(
                  title: "Upcoming",
                  iconData: Icons.home,
                ),
              ]),
        ),
        // Membuat Body di aplikasi
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.blue[300], Colors.indigo[800]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
          ),
          child: TabBarView(children: [
            cekData
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Expanded(
                        child: Container(
                          height: 600,
                          margin: EdgeInsets.only(top: 50),
                          child: PageView.builder(
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieDetail(
                                                index: index,
                                                models: list[index],
                                              )));
                                },
                                child: PosterMovies(
                                  selectPage: _selectPage,
                                  index: index,
                                  imgUrl:
                                      "https://image.tmdb.org/t/p/w220_and_h330_face${list[index].posterPath}",
                                ),
                              );
                            },
                            itemCount: list.length,
                            onPageChanged: (a) {
                              // print(a);
                              // fungsi untuk rebuild class atau widget class
                              setState(() {
                                _selectPage = a;
                              });
                            },
                            controller: pageController,
                            // children: [
                            //   Container(
                            //     margin: EdgeInsets.symmetric(
                            //       vertical: _selectPage == 0 ? 130 : 150,
                            //       horizontal: 16,
                            //     ),
                            //     child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(16),
                            //       child: Image.network(
                            //         "https://image.tmdb.org/t/p/w220_and_h330_face/4V2nTPfeB59TcqJcUfQ9ziTi7VN.jpg",
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //   ),
                            //   Container(
                            //     margin: EdgeInsets.symmetric(
                            //       vertical: _selectPage == 1 ? 130 : 150,
                            //       horizontal: 16,
                            //     ),
                            //     child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(16),
                            //       child: Image.network(
                            //         "https://image.tmdb.org/t/p/w220_and_h330_face/5MSDwUcqnGodFTvtlLiLKK0XKS.jpg",
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //   ),
                            //   Container(
                            //     margin: EdgeInsets.symmetric(
                            //       vertical: _selectPage == 2 ? 130 : 150,
                            //       horizontal: 16,
                            //     ),
                            //     child: ClipRRect(
                            //       borderRadius: BorderRadius.circular(16),
                            //       child: Image.network(
                            //         "https://image.tmdb.org/t/p/w220_and_h330_face/45FNxAIooJFqjsVaCJts9YJHXS4.jpg",
                            //         fit: BoxFit.cover,
                            //       ),
                            //     ),
                            //   ),
                            // ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "${list[_selectPage].originalTitle}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Category Movie | 2 Hours",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ItemRating(
                            rating: "${list[_selectPage].voteAverage}",
                            titleRating: "Vote Average",
                          ),
                          ItemRating(
                            rating: "${list[_selectPage].popularity}",
                            titleRating: "Popularity",
                          ),
                          ItemRating(
                            rating: "${list[_selectPage].voteCount}",
                            titleRating: "Vote Count",
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        padding: EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(width: 2, color: Colors.white)),
                        child: Text(
                          "Buy Ticket",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  )
                : Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
            Container(
              child: Center(
                child: Text("Popular"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Top Rated"),
              ),
            ),
            Container(
              child: Center(
                child: Text("Upcoming"),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
