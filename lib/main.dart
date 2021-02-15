import 'package:flutter/material.dart';
import 'package:list_movie_revisi/detail.dart';
import 'data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainApp extends StatefulWidget {
  @override
  _MainAppState createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<Container> wWrapper = List();

  _createDataList() {
    for (var i = 0; i < dataMovie.length; i++) {
      final listMovie = dataMovie[i];
      final String images = listMovie.image;

      wWrapper.add(
        Container(
          padding: EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DetailMovie(
                  title: listMovie.title,
                  image: listMovie.image,
                  desc: listMovie.desc,
                ),
              ));
            },
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Hero(
                    tag: images,
                    child: Image.asset(
                      "images/$images",
                      height: 180.0,
                      width: 120.0,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          listMovie.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 21.0),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text(
                          listMovie.desc,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 7,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    _createDataList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List view"),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: wWrapper,
        ),
      ),
    );
  }
}
